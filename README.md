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
- To get started, complete the steps as mentioed in : https://help.solidfi.com/hc/en-us/articles/6343456222875

- Once its granted, to enable In-App Provisioning, visit the Identifiers section for Certificates, Identifiers, and Profiles in Developer account. Edit any required profile (or create new one) and select entitlement of the ApplePay In-App Provisioning Distribution. 
- Add Wallet capability in Xcode's Signing & Capabilities  
- After adding capability, add ```com.apple.developer.payment-pass-provisioning``` key and set it to true in Wallet entitlements

```groovy
NOTE: You can test In App Provisioning only in Test Flight or App Store build. 
```

## Reference
- https://usermanual.wiki/Document/InApp20Provisioning20Getting20Started20Guide20V123.884317268/view


## API Reference
- Solid API Integration : https://www.solidfi.com/docs/introduction
