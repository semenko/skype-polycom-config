# skype-polycom-config
This is an optimied Skype for Business /  Cloud PBX configuration for Polycom VVX phones.

You should use this only as an example for your business (do *not* directly point your phones here; it'll use our PaperTrail logging, etc.).

This sets some default, sane configurations for Skype for Business (er Microsoft Phone System / Cloud Voice / Calling Plan or whatever they're calling it) for Polycom VVX-series phones.

# Where'd all these settings come from?
These settings are all detailed in two places:

* The [Polycom UC Software manual](http://support.polycom.com/content/dam/polycom-support/products/Voice/business_media_phones/user/en/3725-42644-002a-ucsoftware-administrator-guide-5-6-0.pdf), specifically version: UC Software 5.6.0 | July 2017 | 3725-42644-002A.
* The [Polycom UC Software with Skype for Business Deployment Guide](http://support.polycom.com/content/dam/polycom-support/products/Voice/business_media_phones/user/en/3725-49078-018a-uc-software-skype-for-business-deployment-guide-5-6-0.pdf), specifically version: UC Software 5.6.0 | July 2017 | 3725-49078-018A

There's also some inspiration from [this respository](https://github.com/spmiddlebrooks/Polycom-VVX-Config/).

The shared directory information (000000000000-directory.xml) is [detailed here](http://community.polycom.com/t5/VoIP/FAQ-How-can-I-create-a-local-directory-or-what-is-the/td-p/8216).

# What's the license file?

It's not clear this is actually needed in recent OS versions, but it's included here for older devices/software revisions.

However, the license is a *free* license from Polycom that enables Corporate Directory, Visual Conference Management, and USB Call Recording (it expires on 15th March 2022).

This is well described & provided for free on the [Polycom Local Directory FAQ page](http://community.polycom.com/t5/VoIP/FAQ-How-can-I-create-a-local-directory-or-what-is-the/td-p/8216).

# How to Deploy
I auto-deploy this configuration using *both* DHCP and also the Skype for Business / PowerShell route.

Deploying via DHCP lets you buy new phones, and have them "just work" -- especially when using BToE.

## Via DHCP
Polycom VVX phones respect *either* DHCP 160 or 161 [based on if their SKU is a Lync / Skype SKU](http://community.polycom.com/t5/VoIP/New-order-of-VVX500-phones-different-default-configuration-to/td-p/73009).

Setting *both* DHCP 160 and 161 works best; then if you've bought VVX phones without Skype licenses, you can automatically provision and assign licenses.

(It can be much cheaper to buy used non-Skype Polycom phones, then buy the Skype license packs, e.g. 5150-49254-001)

## Via Skype for Business / PowerShell

Download the [Skype PowerShell module](https://www.microsoft.com/en-us/download/details.aspx?id=39366), then: 

    $sfboSession = New-CsOnlineSession -UserName "user@example.com"
    Import-PSSession $sfboSession
    Set-CsIPPhonePolicy -LocalProvisioningServerAddress semenko.github.io/skype-polycom-config -LocalProvisioningServerType HTTPS

Other things you probably want to enable (you can see all the options via `Get-CsIPPhonePolicy`):

    Set-CsIPPhonePolicy -EnableDeviceUpdate $true -EnableExchangeCalendaring $true
    Set-CsIPPhonePolicy -EnableBetterTogetherOverEthernet $true -BetterTogetherOverEthernetPairingMode Auto

