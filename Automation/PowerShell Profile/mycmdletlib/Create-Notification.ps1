#!/usr/bin/env pwsh
######## Variables to bypass some things that PowerShell have
###### IsOS Variables first as reference to use in functions and as alternatives because Windows PowerShell (5.*) don't have them anyway [even windows one]
$_IsWindows = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows);
$_IsLinux = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Linux);
$_IsMacOS = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::OSX);
# Test Command
function Test-Command($command) {
    try {
        if (Get-Command $command -ErrorAction Stop) {
            return $true
        }
    } catch {}
    return $false
}
# Create Toast Notification Windows
function Create-ToastNotificationW10($appId, $title, $message) {
    [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
    [Windows.UI.Notifications.ToastNotification, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
    [Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] | Out-Null
    $template = @"
<toast activationType="protocol" launch="" duration="short">
    <visual>
        <binding template="ToastGeneric">
            <text><![CDATA[$title]]></text>
            <text><![CDATA[$message]]></text>
        </binding>
    </visual>
	<audio silent="true" />
</toast>
"@
    $xml = New-Object Windows.Data.Xml.Dom.XmlDocument
    $xml.LoadXml($template)
    $toast = New-Object Windows.UI.Notifications.ToastNotification $xml
    [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($appId).Show($toast)
}

# Create Notification
function Create-Notification (
    [Parameter(Mandatory=$true, Position=0)]
    [string] $Title,
    [Parameter(Mandatory=$true, Position=1)]
    [string] $Description
) {
    if ($_IsMacOS) {
        if (Test-Command "osascript") {
            $tmpfile = New-TemporaryFile
            Set-Content $tmpfile "display notification `"$Description`" with title `"$Title`""
            osascript $tmpfile
            Remove-Item $tmpfile -Force -ErrorAction SilentlyContinue
        } else {
            Write-Error "Error: osascript is not available"
        }
    } elseif ($_IsLinux) {
    } elseif ($_IsWindows) {
        $isWindows10 = $(Get-ItemProperty "HKLM:/Software/Microsoft/Windows NT/CurrentVersion" CurrentMajorVersionNumber).CurrentMajorVersionNumber -eq 10;
        if ($isWindows10) {
            $applicationId = "{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe";
            try
            {
                $applicationId = $(Get-StartApps -Name "Windows PowerShell")[0].AppID;
            }
            catch
            {}
        }
    } else {
        Write-Error "Error: Unknown OS"
    }
}
