# TeamCity Meta runner DSL - Trigger Other Build Configuration

## Kod Bash

```Bash
#!/bin/bash
echo "Downloading newer version of curl"
curl -OL https://github.com/moparisthebest/static-curl/releases/download/v7.80.0/curl-amd64 2> /dev/null
chmod +x curl-amd64
echo "Downloading jq"
curl -OL https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux32 2> /dev/null
chmod +x jq-linux32

echo "Triggering new build"
CURL_RETURN_CODE=0
RETURN_DATA=$(
./curl-amd64 \
  --request "POST" \
  --fail-with-body \
  --url "%teamcity.serverUrl%/app/rest/buildQueue" \
  --header 'Authorization: Bearer %system.teamcity_auth_token%' \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/xml' \
  --data '<build>
	<buildType id="%system.build_configuration%"/>
	<properties>
		%system.build_properties%
        <property name="COMMENT" value="Automated Build Triggered by `%teamcity.serverUrl%/buildConfiguration/%system.teamcity.buildType.id%/%teamcity.build.id%`. This build was triggered through metarunner."/>
	</properties>
</build>' || CURL_RETURN_CODE=$?)
RETURN_URL=$(echo $RETURN_DATA | ./jq-linux32 .webUrl -r)

#  -u "%system.teamcity.auth.userId%:%system.teamcity.auth.password%" \
echo $RETURN_DATA;
echo;
echo "Curl Error Code: $CURL_RETURN_CODE";
echo "Triggered Build: $RETURN_URL";
UID=$(date +%%s%%N);
echo $UID;
echo "##teamcity[setParameter name='_COMMENT_$UID' value='Triggered Build: $RETURN_URL.']"

if [ ${CURL_RETURN_CODE} -eq 22 ]; then
    exit 22
fi

echo "Waiting.."
sleep 5
```
{validate=false, ignore-vars=true}


## Opis skryptu

1. Najpierw pobieramy nowszą wersję curl. Możliwe, że w nowszych TeamCity nie będzie takiej potrzeby.
    - Pobieramy wersję 7.80.0, ponieważ ma flagę `--fail-with-body` i inne potrzebne elementy pod działanie tego meta runnera.
2. Pobieramy narzędzie jq do operacji na plikach i danych json.
3. Uruchamiamy curl na `%teamcity.serverUrl%/app/rest/buildQueue`{ignore-vars=true} z odpowiednimi danymi z parametrów.
4. Potem pobieramy informacje o url do uruchomionego build-a.
5. Dodajemy komentarz z tą informacją dla wygody.
6. Sprawdzamy, czy curl przeszedł, jeżeli nie to wywołujemy fail
7. Czekamy 5 sekund, które były głównie potrzebne przy opcji build-owych danych uwierzytelniania.

## TeamCity Meta runner DSL XML

```XML
<meta-runner name="Trigger Build ConfigurationThroughBashAndAPI">
  <description>Triggers build configuration through TeamCity REST API using BuildQueue API.</description>
  <settings>
    <parameters>
      <param name="system.build_configuration" value="" spec="text label='Build Configuration ID to Trigger' validationMode='not_empty' display='normal'" />
      <param name="system.build_properties" value="" spec="text description='Example: `&lt;property name=&quot;PARAM_NAME&quot; value=&quot;VALUE&quot;/&gt;`' label='Custom Properties of Build to Trigger' validationMode='any' display='normal'" />
    </parameters>
    <build-runners>
      <runner name="Trigger Different Build Configuration" type="simpleRunner">
        <parameters>
          <param name="script.content"><![CDATA[#!/bin/bash
echo "Downloading newer version of curl"
curl -OL https://github.com/moparisthebest/static-curl/releases/download/v7.80.0/curl-amd64 2> /dev/null
chmod +x curl-amd64
echo "Downloading jq"
curl -OL https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux32 2> /dev/null
chmod +x jq-linux32

echo "Triggering new build"
CURL_RETURN_CODE=0
RETURN_DATA=$(
./curl-amd64 \
  --request "POST" \
  --fail-with-body \
  --url "%teamcity.serverUrl%/app/rest/buildQueue" \
  --header 'Authorization: Bearer %system.teamcity_auth_token%' \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/xml' \
  --data '<build>
	<buildType id="%system.build_configuration%"/>
	<properties>
		%system.build_properties%
        <property name="COMMENT" value="Automated Build Triggered by `%teamcity.serverUrl%/buildConfiguration/%system.teamcity.buildType.id%/%teamcity.build.id%`. This build was triggered through metarunner."/>
	</properties>
</build>' || CURL_RETURN_CODE=$?)
RETURN_URL=$(echo $RETURN_DATA | ./jq-linux32 .webUrl -r)

echo $RETURN_DATA;
echo;
echo "Curl Error Code: $CURL_RETURN_CODE";
echo "Triggered Build: $RETURN_URL";
UID=$(date +%%s%%N);
echo $UID;
echo "##teamcity[setParameter name='_COMMENT_$UID' value='Triggered Build: $RETURN_URL.']"

if [ ${CURL_RETURN_CODE} -eq 22 ]; then
    exit 22
fi

echo "Waiting.."
sleep 5]]></param>
          <param name="teamcity.step.mode" value="default" />
          <param name="use.custom.script" value="true" />
        </parameters>
      </runner>
    </build-runners>
    <requirements />
  </settings>
</meta-runner>
```
{validate=false, ignore-vars=true}