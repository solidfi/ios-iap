# ios-iap
iOS In App Push Provisioning Sample

## Table of contents
- [Overview](#overview)
- [Getting started](#getting-started)
- [Prerequisite](#prerequisite)
- [Integration Reference](#integration-reference)
- [API Reference](#api-reference)


## Overview
Apple In App Provisioning is the way to provision your card to apple wallet.


## Getting started
- Clone repository
```groovy
git clone git@github.com:solidfi/ios-iap.git
OR
git clone https://github.com/solidfi/ios-iap.git
```
- Open CardProvisioningVC.swift file


## Prerequisite
- Request for the Apple Pay Entitlements to : applepayentitlements@apple.com
- Once its granted, to enable In-App Provisioning, visit the Identifiers section for Certificates, Identifiers, and Profiles in Developer account. Edit any required App IDs and enable the In-App Provisioning capability in the new Additional Capabilities tab. Once enabled, the entitlement will automatically be included in newly generated provisioning profiles.
- Add Wallet capability in Xcode's Signing & Capabilities  
- After adding capability, add com.apple.developer.payment-pass-provisioning key and set it to true in Wallet entitlements

NOTE: You cant test In App Provisioning only in Test flight or App store build. 


## Integration Reference
- Integration reference : https://usermanual.wiki/Document/InApp20Provisioning20Getting20Started20Guide20V123.884317268/view


## API Reference
- Solid API Integration : https://documenter.getpostman.com/view/13543869/TWDfEDwX#ce8c0e57-0dcf-45ea-87d8-6f03a302e027
