# skype-polycom-config
A standard Skype for Business / Cloud PBX configuration for Polycom phones.

You should use this only as an example for your business (do *not* directly point your phones here; it'll use our Papertrail logging, set our password, etc.).

This sets some default, sane configuations for Skype for Business (er Microsoft Phone System / Cloud Voice / Calling Plan or whatever they're calling it.) for Polycom VVX phones.

# Where'd all these settings come from?
These settings are all detailed in the (Polycom UC Software manual)[http://support.polycom.com/content/dam/polycom-support/products/Voice/business_media_phones/user/en/3725-42644-002a-ucsoftware-administrator-guide-5-6-0.pdf], specifically version:UC Software 5.6.0 | July 2017 | 3725-42644-002A.

There's also some inspiration from (this respository)[https://github.com/spmiddlebrooks/Polycom-VVX-Config/].


# How to Deploy
I auto-deploy this configuration using *both* DHCP and also the Skype for Business / Powershell route.

Deploying via DHCP lets you buy new phones, and have them "just work" -- especially when using BToE.

## Via DHCP

## Via Skype for Business / Powershell

Download the [Skype PowerShell module](https://www.microsoft.com/en-us/download/details.aspx?id=39366), then: 

    $sfboSession = New-CsOnlineSession -UserName "user@example.com"
    Import-PSSession $sfboSession
    Set-CsIPPhonePolicy -LocalProvisioningServerAddress semenko.github.io/skype-polycom-config -LocalProvisioningServerType HTTPS

Other things you probably want to enable (you can see all the options via `Get-CsIPPhonePolicy`):

    Set-CsIPPhonePolicy -EnableDeviceUpdate $true -EnableExchangeCalendaring $true
    Set-CsIPPhonePolicy -EnableBetterTogetherOverEthernet $true -BetterTogetherOverEthernetPairingMode Auto

