# Telegram Notifications
## Koncept
### Init.ps1 {id="koncept-init-ps1"}
Wykonaj elementy z tego pliku, żeby zdobyć dane konfiguracyjne.
### Config.secret.ps1 {id="koncept-config-secret-ps1"}
Skopiuj Config.ps1 i uzupełnij danymi.

## Kod

### Init.ps1 {id="init-ps1"}
```Console
$BotKey = "" # Config.secret.ps1 Token
$GetChatID = Invoke-WebRequest -Uri "https://api.telegram.org/bot$BotKey/getUpdates"
(ConvertFrom-Json $GetChatID.Content).result.message.chat.id # ID
```

#### BotKey {id="init-ps1-bot-key"}
Żeby zdobyć klucz bota musisz zrobić te kroki:
1. Wyślij do [@BotFather](https://t.me/BotFather) wiadomość `/newbot`
2. Wpisz nazwę bota i nazwę użytkownika bota
3. Bot Father wyśle Ci wiadomość z tokenem bota
    > Przykład wiadomości:
    ```
    Use this token to access the HTTP API:
    `TOKEN`
    Keep your token secure and store it safely,
    it can be used by anyone to control your bot.
    ```

### Config.secret.ps1
```Console
#!/bin/env pwsh

$BotKey = ""
$chatID = ""
```
#### Co zrobić z tym plikiem?
- Uzupełnij zmienną `$BotKey` tokenem bota z kroku [Bot Key](#init-ps1-bot-key)
- Uzupełnij zmienną `$chatID` ID czatu z kroku [Chat ID](#init-ps1)

### Send-TelegramNotification.ps1
```Console
#!/bin/env pwsh

. $PSScriptRoot/Config.secret.ps1

function Send-TelegramNotification
{
<#
.SYNOPSIS
	Send-TelegramNotification
.DESCRIPTION
	Send Telegram Notification
.PARAMETER  Message
	Message to send to telegram
.EXAMPLE
	PS C:\> Send-TelegramNotification
	Operation ID: 21
	Notification to Telegram sent with message: "Operation #21 in PowerShell completed."
#>

	[CmdletBinding()]
	param(
		[Parameter(Mandatory=$false)]
		[string]
		$OperationId,
		[Parameter(Mandatory=$false)]
		[string]
		$Message
	)
	process {
		$msg = $Message;
		if ([string]::IsNullOrWhiteSpace($OperationId)) {
			$OperationId = (New-Guid).Guid
			Write-Host "Operation ID: ${OperationId}"
		}
		if ([string]::IsNullOrWhiteSpace($msg)) {
			$msg = "Operation ${OperationId} in PowerShell completed."
		} else {
			$msg = "Operation ${OperationId}: $msg"
		}

		$sendMsgLink = "https://api.telegram.org/bot$BotKey/sendMessage"
		try
		{
			$ExecuteInvokeWeb = Invoke-WebRequest -Uri "$sendMsgLink" -Method Post -ContentType "application/json;charset=utf-8" -Body (ConvertTo-Json -Compress -InputObject @{chat_id=$chatID; text="$msg"}) -ErrorAction SilentlyContinue
			$Status = (ConvertFrom-Json -InputObject $ExecuteInvokeWeb.Content)
			if($Status.ok){Write-Host "Notification to Telegram sent with message: '${msg}'" -ForegroundColor Green}
		}
		catch [Exception]
		{
			$exception = $_.Exception.ToString().Split(".")[2]
			Write-Host $_.Exception;
			Write-Host "Message failed to send ($exception)" -ForegroundColor Red
		}
	}
}
```

### Send-TelegramNotificationWhenDone.ps1
```Console
#!/bin/env pwsh

. $PSScriptRoot/Send-TelegramNotification.ps1

function Send-TelegramNotificationWhenDone
{
<#
.SYNOPSIS
	Send-TelegramNotificationWhenDone
.DESCRIPTION
	Send Telegram Notification when Done
.PARAMETER  Message
	Message to send to telegram
.EXAMPLE
	PS C:\> Send-TelegramNotificationWhenDone { Write-Host "Hello"; Start-Sleep 1; }
	Operation ID: 21
	Operation 21 started.
	Hello
	Operation 21 finished.
	Notification to Telegram sent with message: "Operation #21 in PowerShell completed."
#>

	[CmdletBinding()]
	param(
		[Parameter(Position=0, Mandatory=$true)]
		[System.Management.Automation.ScriptBlock]
		$ScriptBlock,
		[Parameter(Position=0, Mandatory=$true)]
		[switch]
		$NotifyAboutStart
	)
	process {
		$OperationId = (New-Guid).Guid
		Write-Host "Operation ID: ${OperationId}"
		Write-Host "Operation ${OperationId} started."
		if ($NotifyAboutStart) {
			Send-TelegramNotification -OperationId $OperationId -Message "Operation in PowerShell started."
		}

		$return = Invoke-Command -ScriptBlock $ScriptBlock

		Write-Host "Operation ${OperationId} finished."
		Send-TelegramNotification -OperationId $OperationId -Message "Operation in PowerShell completed."
		return $return
	}
}
```