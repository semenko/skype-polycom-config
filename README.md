# skype-polycom-config
A standard Skype for Business / Cloud PBX configuration for Polycom phones.


# How to Deploy

## Via DHCP

## Via Skype for Business / Powershell

Download the [Skype PowerShell module](https://www.microsoft.com/en-us/download/details.aspx?id=39366), then: 

    $sfboSession = New-CsOnlineSession -UserName "nick@aldinetravel.com"
    Import-PSSession $sfboSession
    Set-CsIPPhonePolicy -LocalProvisioningServerAddress semenko.github.io/skype-polycom-config -LocalProvisioningServerType HTTPS

Other things you probably want to enable (you can see all the options via `Get-CsIPPhonePolicy`):

    Set-CsIPPhonePolicy -EnableDeviceUpdate $true -EnableExchangeCalendaring $true
    Set-CsIPPhonePolicy -EnableBetterTogetherOverEthernet $true -BetterTogetherOverEthernetPairingMode Auto

