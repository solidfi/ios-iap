# ios-iap
iOS In App Push Provisioning Sample

## Table of contents
- [Overview](#overview)
- [Getting Started](#getting-started)
- [Prerequisite](#prerequisite)
- [Reference](#reference)
- [API Reference](#api-reference)


## Overview
Apple In App Provisioning is the way to provision your card to Apple Wallet.


## Getting Started
- Clone repository
```groovy
git clone git@github.com:solidfi/ios-iap.git
OR
git clone https://github.com/solidfi/ios-iap.git
```
- Open ```CardProvisioningVC.swift``` file


## Prerequisite
- To get started, your Apple developer account owner should send an email to Apple Pay Entitlements (applepayentitlements@apple.com) requesting to enable Apple Pay push provisioning for the App:

  - App name (as it appears on AppStore Connect)
  - Developer team ID
  - Bundle ID: (eg. com.company.appname)

- Once its granted, to enable In-App Provisioning, visit the Identifiers section for Certificates, Identifiers, and Profiles in Developer account. Edit any required profile (or create new one) and select entitlement of the ApplePay In-App Provisioning Distribution. 
- Add Wallet capability in Xcode's Signing & Capabilities  
- After adding capability, add ```com.apple.developer.payment-pass-provisioning``` key and set it to true in Wallet entitlements

```groovy
NOTE: You can test In App Provisioning only in Test Flight or App Store build. 
```

## Reference
- https://usermanual.wiki/Document/InApp20Provisioning20Getting20Started20Guide20V123.884317268/view


## API Reference
- Solid API Integration : https://documenter.getpostman.com/view/13543869/TWDfEDwX#ce8c0e57-0dcf-45ea-87d8-6f03a302e027
