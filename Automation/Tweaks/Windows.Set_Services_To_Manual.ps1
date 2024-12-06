# Set Services to Manual

$services = @(
"ALG"                                          # Application Layer Gateway Service(Provides support for 3rd party protocol plug-ins for Internet Connection Sharing)
"AJRouter"                                     # Needed for AllJoyn Router Service
"BcastDVRUserService_48486de"                  # GameDVR and Broadcast is used for Game Recordings and Live Broadcasts
#"BDESVC"                                      # Bitlocker Drive Encryption Service
#"BFE"                                         # Base Filtering Engine (Manages Firewall and Internet Protocol security)
#"BluetoothUserService_48486de"                # Bluetooth user service supports proper functionality of Bluetooth features relevant to each user session.
#"BrokerInfrastructure"                        # Windows Infrastructure Service (Controls which background tasks can run on the system)
"Browser"                                      # Let users browse and locate shared resources in neighboring computers
"BthAvctpSvc"                                  # AVCTP service (needed for Bluetooth Audio Devices or Wireless Headphones)
"CaptureService_48486de"                       # Optional screen capture functionality for applications that call the Windows.Graphics.Capture API.
"cbdhsvc_48486de"                              # Clipboard Service
"diagnosticshub.standardcollector.service"     # Microsoft (R) Diagnostics Hub Standard Collector Service
"DiagTrack"                                    # Diagnostics Tracking Service
"dmwappushservice"                             # WAP Push Message Routing Service
"DPS"                                          # Diagnostic Policy Service (Detects and Troubleshoots Potential Problems)
"edgeupdate"                                   # Edge Update Service
"edgeupdatem"                                  # Another Update Service
#"EntAppSvc"                                    # Enterprise Application Management.
"Fax"                                          # Fax Service
"fhsvc"                                        # Fax History
"FontCache"                                    # Windows font cache
#"FrameServer"                                 # Windows Camera Frame Server (Allows multiple clients to access video frames from camera devices)
"gupdate"                                      # Google Update
"gupdatem"                                     # Another Google Update Service
#"iphlpsvc"                                     # ipv6(Most websites use ipv4 instead) - Needed for Xbox Live
"lfsvc"                                        # Geolocation Service
#"LicenseManager"                              # Disable LicenseManager (Windows Store may not work properly)
"lmhosts"                                      # TCP/IP NetBIOS Helper
"MapsBroker"                                   # Downloaded Maps Manager
"MicrosoftEdgeElevationService"                # Another Edge Update Service
"MSDTC"                                        # Distributed Transaction Coordinator
"NahimicService"                               # Nahimic Service
#"ndu"                                          # Windows Network Data Usage Monitor (Disabling Breaks Task Manager Per-Process Network Monitoring)
"NetTcpPortSharing"                            # Net.Tcp Port Sharing Service
"PcaSvc"                                       # Program Compatibility Assistant Service
"PerfHost"                                     # Remote users and 64-bit processes to query performance.
"PhoneSvc"                                     # Phone Service(Manages the telephony state on the device)
#"PNRPsvc"                                     # Peer Name Resolution Protocol (Some peer-to-peer and collaborative applications, such as Remote Assistance, may not function, Discord will still work)
#"p2psvc"                                      # Peer Name Resolution Protocol(Enables multi-party communication using Peer-to-Peer Grouping.  If disabled, some applications, such as HomeGroup, may not function. Discord will still work)iscord will still work)
#"p2pimsvc"                                    # Peer Networking Identity Manager (Peer-to-Peer Grouping services may not function, and some applications, such as HomeGroup and Remote Assistance, may not function correctly. Discord will still work)
"PrintNotify"                                  # Windows printer notifications and extentions
"QWAVE"                                        # Quality Windows Audio Video Experience (audio and video might sound worse)
"RemoteAccess"                                 # Routing and Remote Access
"RemoteRegistry"                               # Remote Registry
"RetailDemo"                                   # Demo Mode for Store Display
"RtkBtManServ"                                 # Realtek Bluetooth Device Manager Service
"SCardSvr"                                     # Windows Smart Card Service
"seclogon"                                     # Secondary Logon (Disables other credentials only password will work)
"SEMgrSvc"                                     # Payments and NFC/SE Manager (Manages payments and Near Field Communication (NFC) based secure elements)
"SharedAccess"                                 # Internet Connection Sharing (ICS)
#"Spooler"                                     # Printing
"stisvc"                                       # Windows Image Acquisition (WIA)
#"StorSvc"                                     # StorSvc (usb external hard drive will not be reconized by windows)
"SysMain"                                      # Analyses System Usage and Improves Performance
"TrkWks"                                       # Distributed Link Tracking Client
#"WbioSrvc"                                    # Windows Biometric Service (required for Fingerprint reader / facial detection)
"WerSvc"                                       # Windows error reporting
"wisvc"                                        # Windows Insider program(Windows Insider will not work if Disabled)
#"WlanSvc"                                     # WLAN AutoConfig
"WMPNetworkSvc"                                # Windows Media Player Network Sharing Service
"WpcMonSvc"                                    # Parental Controls
"WPDBusEnum"                                   # Portable Device Enumerator Service
"WpnService"                                   # WpnService (Push Notifications may not work)
#"wscsvc"                                      # Windows Security Center Service
"WSearch"                                      # Windows Search
"XblAuthManager"                               # Xbox Live Auth Manager (Disabling Breaks Xbox Live Games)
"XblGameSave"                                  # Xbox Live Game Save Service (Disabling Breaks Xbox Live Games)
"XboxNetApiSvc"                                # Xbox Live Networking Service (Disabling Breaks Xbox Live Games)
"XboxGipSvc"                                   # Xbox Accessory Management Service
# Hp services
"HPAppHelperCap"
"HPDiagsCap"
"HPNetworkCap"
"HPSysInfoCap"
"HpTouchpointAnalyticsService"
# Hyper-V services
"HvHost"
"vmicguestinterface"
"vmicheartbeat"
"vmickvpexchange"
"vmicrdv"
"vmicshutdown"
"vmictimesync"
"vmicvmsession"
# Services that cannot be disabled
#"WdNisSvc"
)

foreach ($service in $services) {
    # -ErrorAction SilentlyContinue is so it doesn't write an error to stdout if a service doesn't exist

    Write-Host "Setting $service StartupType to Manual"
    Get-Service -Name $service -ErrorAction SilentlyContinue | Set-Service -StartupType Manual -ErrorAction SilentlyContinue
}