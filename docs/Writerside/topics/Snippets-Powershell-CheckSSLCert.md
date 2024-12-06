# Check SSL Certificate

## Code of cmdlet
```Console
#!/usr/bin/env pwsh

$code = @"
using System;
using System.Net;
using System.Net.Http;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;

namespace PatrykAdamczykCmdLetLib
{
	public class CheckSSLCertificate
	{
		public static void Main(string Address){
            var handler = new HttpClientHandler();
            handler.ServerCertificateCustomValidationCallback = (
                HttpRequestMessage message,
                X509Certificate2 certificate2,
                X509Chain certchain,
                SslPolicyErrors policyerrors
            ) =>
            {
                var certExpDate = certificate2.NotAfter;
                int certExpiresIn = (certExpDate - DateTime.Now).Days;
                var certName = certificate2.Subject;
                var certThumbprint = certificate2.GetCertHashString();
                var certEffectiveDate = certificate2.GetEffectiveDateString();
                var certIssuer = certificate2.Issuer;
                if (certExpiresIn > 30)
                {
                    Console.ForegroundColor = ConsoleColor.Green;
                    Console.WriteLine($"The {Address} certificate expires in {certExpiresIn} days [{certExpDate}]");
                    Console.ResetColor();
                }
                else
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine($"The {Address} certificate expires in {certExpiresIn} days [{certExpDate}]");
                    Console.ResetColor();
                }
                Console.WriteLine("Details:");
                var padding = "  ";
                Console.WriteLine($"{padding}Cert name: {certName}");
                Console.WriteLine($"{padding}Cert thumbprint: {certThumbprint}");
                Console.WriteLine($"{padding}Cert effective date: {certEffectiveDate}");
                Console.WriteLine($"{padding}Cert issuer: {certIssuer}");
                return true;
            };
            var req = new System.Net.Http.HttpClient(handler);
            req.Timeout = TimeSpan.FromMilliseconds(10000);
            var res = req.GetAsync(Address).Result;
		}
	}
}
"@
Add-Type -TypeDefinition $code -Language CSharp -ErrorAction SilentlyContinue

function Check-SSLCertificate (
    [Parameter(Mandatory=$true, Position=0)]
    [String] $Address
) {
    # Writing this through C# directly because PowerShell is fucked
    [PatrykAdamczykCmdLetLib.CheckSSLCertificate]::Main($Address)
}

Write-Host -ForegroundColor DarkRed "Warning! Check-SSLCertificate is added only once as type. Changes of it after reloading of profile file will not apply to same session!";
```

### C# Code inside this cmdlet

```C#

using System;
using System.Net;
using System.Net.Http;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;

namespace PatrykAdamczykCmdLetLib
{
	public class CheckSSLCertificate
	{
		public static void Main(string Address){
            var handler = new HttpClientHandler();
            handler.ServerCertificateCustomValidationCallback = (
                HttpRequestMessage message,
                X509Certificate2 certificate2,
                X509Chain certchain,
                SslPolicyErrors policyerrors
            ) =>
            {
                var certExpDate = certificate2.NotAfter;
                int certExpiresIn = (certExpDate - DateTime.Now).Days;
                var certName = certificate2.Subject;
                var certThumbprint = certificate2.GetCertHashString();
                var certEffectiveDate = certificate2.GetEffectiveDateString();
                var certIssuer = certificate2.Issuer;
                if (certExpiresIn > 30)
                {
                    Console.ForegroundColor = ConsoleColor.Green;
                    Console.WriteLine($"The {Address} certificate expires in {certExpiresIn} days [{certExpDate}]");
                    Console.ResetColor();
                }
                else
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine($"The {Address} certificate expires in {certExpiresIn} days [{certExpDate}]");
                    Console.ResetColor();
                }
                Console.WriteLine("Details:");
                var padding = "  ";
                Console.WriteLine($"{padding}Cert name: {certName}");
                Console.WriteLine($"{padding}Cert thumbprint: {certThumbprint}");
                Console.WriteLine($"{padding}Cert effective date: {certEffectiveDate}");
                Console.WriteLine($"{padding}Cert issuer: {certIssuer}");
                return true;
            };
            var req = new System.Net.Http.HttpClient(handler);
            req.Timeout = TimeSpan.FromMilliseconds(10000);
            var res = req.GetAsync(Address).Result;
		}
	}
}
```

### Basic Explanation of this code

- This code is completely using C# to make this logic work.
- Then it imports this code (Its error is silent to make it work in Profile file) \[Which you can technically execute over and over, which is mostly useful when you're testing things out with Profile file]
- This C# code inside is pretty much a small application that checks SSL Certificate based on .NET APIs inside C#.
- Note at the end of this file is because this cmdlet logic will not update when you change C# code at all. You would need to restart PowerShell to make it see your changes. This is because you can't load the same C# code multiple times in a session with the same types. If you change namespace or something like that every time, then it should work.




## Old Code — Aka My tries of making this work before a final solution
```Console






#    $handler = [System.Net.Http.HttpClientHandler]::new()
#    function temp ($message, $certificate, $certchain, $policyerrors) {
#        Write-Host $message $certificate $certchain $policyerrors
#        return $true
#    }
##    $handler.ServerCertificateCustomValidationCallback = {
##        param($message, $certificate, $certchain, $policyerrors)
##        Write-Host $message $certificate $certchain $policyerrors
##        return $true
##    }
#    $handler.ServerCertificateCustomValidationCallback = temp
#    $req = [System.Net.Http.HttpClient]::new($handler);
#    $req.Timeout = [System.TimeSpan]::FromMilliseconds(10000);
#    $res = $req.GetAsync($Address).GetAwaiter().GetResult();
#    Write-Host $res.Headers;


#
#    [System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
#    $req = [System.Net.HttpWebRequest]::Create($Address)
#    $req.Timeout = 10000
#    try {
#        Write-Host $req.GetResponse()
#    } catch {
#        Write-Host URL check error $Address`: $_ -f Red
#        Write-Host $_.Exception.InnerException
#        if ($_.Exception.InnerException.Status -eq 'ProtocolError') {
#        } else {
#            # this is a real error - timeout, DNS failure etc
#            Write-Host "$url, $_" -ForegroundColor Red
#            return
#        }
#    }
#    $expDate = $req.ServicePoint.Certificate.GetExpirationDateString()
#    $certExpDate = [datetime]::ParseExact($expDate, “dd/MM/yyyy HH:mm:ss”, $null)
#    [int]$certExpiresIn = ($certExpDate - $(get-date)).Days
#    $certName = $req.ServicePoint.Certificate.GetName()
#    $certThumbprint = $req.ServicePoint.Certificate.GetCertHashString()
#    $certEffectiveDate = $req.ServicePoint.Certificate.GetEffectiveDateString()
#    $certIssuer = $req.ServicePoint.Certificate.GetIssuerName()
#    if ($certExpiresIn -gt 30)
#    {
#        Write-Host The $Address certificate expires in $certExpiresIn days [$certExpDate] -f Green
#    }
#    else
#    {
#        Write-Host The $Address certificate expires in $certExpiresIn days [$certExpDate] -f Red
#    }
#    $message= "The $site certificate expires in $certExpiresIn days"
#    $messagetitle= "Renew certificate"
#    Write-Host $message [$certExpDate]. Details:`n`nCert name: $certName`nCert thumbprint: $certThumbprint`nCert effective date: $certEffectiveDate`nCert issuer: $certIssuer -f Red
#$minCertAge = 80
#$timeoutMs = 10000
#$sites = @(
#"https://testsite1.com/",
#"https://testsite2.com/",
#"https://woshub.com/"
#)
## Disable certificate validation
#[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
#foreach ($site in $sites)
#{
#    Write-Host Check $site -f Green
#    $req = [Net.HttpWebRequest]::Create($site)
#    $req.Timeout = $timeoutMs
#    try {$req.GetResponse() |Out-Null} catch {Write-Host URL check error $site`: $_ -f Red}
#    $expDate = $req.ServicePoint.Certificate.GetExpirationDateString()
#    $certExpDate = [datetime]::ParseExact($expDate, “dd/MM/yyyy HH:mm:ss”, $null)
#    [int]$certExpiresIn = ($certExpDate - $(get-date)).Days
#    $certName = $req.ServicePoint.Certificate.GetName()
#    $certThumbprint = $req.ServicePoint.Certificate.GetCertHashString()
#    $certEffectiveDate = $req.ServicePoint.Certificate.GetEffectiveDateString()
#    $certIssuer = $req.ServicePoint.Certificate.GetIssuerName()
#    if ($certExpiresIn -gt $minCertAge)
#    {
#        Write-Host The $site certificate expires in $certExpiresIn days [$certExpDate] -f Green
#    }
#    else
#    {
#        $message= "The $site certificate expires in $certExpiresIn days"
#        $messagetitle= "Renew certificate"
#        Write-Host $message [$certExpDate]. Details:`n`nCert name: $certName`Cert thumbprint: $certThumbprint`nCert effective date: $certEffectiveDate`nCert issuer: $certIssuer -f Red
#        #Displays a pop-up notification and sends an email to the administrator
#        #ShowNotification $messagetitle $message
#        # Send-MailMessage -From powershell@woshub.com -To admin@woshub.com -Subject $messagetitle -body $message -SmtpServer gwsmtp.woshub.com -Encoding UTF8
#    }
#    write-host "________________" `n
#}


#function Check-SSLCertificate (
#    [Parameter(Mandatory=$true, Position=0)]
#    [String] $Address
#) {
#    [System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
#    $req = [System.Net.HttpWebRequest]::Create($Address)
#    $req.Timeout = 10000
#    try {
#        Write-Host $req.GetResponse()
#    } catch {
#        Write-Host URL check error $Address`: $_ -f Red
#        Write-Host $_.Exception.InnerException
#        if ($_.Exception.InnerException.Status -eq 'ProtocolError') {
#        } else {
#            # this is a real error - timeout, DNS failure etc
#            Write-Host "$url, $_" -ForegroundColor Red
#            return
#        }
#    }
#    $expDate = $req.ServicePoint.Certificate.GetExpirationDateString()
#    $certExpDate = [datetime]::ParseExact($expDate, “dd/MM/yyyy HH:mm:ss”, $null)
#    [int]$certExpiresIn = ($certExpDate - $(get-date)).Days
#    $certName = $req.ServicePoint.Certificate.GetName()
#    $certThumbprint = $req.ServicePoint.Certificate.GetCertHashString()
#    $certEffectiveDate = $req.ServicePoint.Certificate.GetEffectiveDateString()
#    $certIssuer = $req.ServicePoint.Certificate.GetIssuerName()
#    if ($certExpiresIn -gt 30)
#    {
#        Write-Host The $Address certificate expires in $certExpiresIn days [$certExpDate] -f Green
#    }
#    else
#    {
#        Write-Host The $Address certificate expires in $certExpiresIn days [$certExpDate] -f Red
#    }
#    $message= "The $site certificate expires in $certExpiresIn days"
#    $messagetitle= "Renew certificate"
#    Write-Host $message [$certExpDate]. Details:`n`nCert name: $certName`nCert thumbprint: $certThumbprint`nCert effective date: $certEffectiveDate`nCert issuer: $certIssuer -f Red
#}

```