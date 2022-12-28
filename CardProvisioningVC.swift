//  Solid
//
//  Created by Solid iOS Team on 03/06/22.

import Foundation
import UIKit
import PassKit

class CardProvisioningVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Check eligibility whether device supports In-app provisioning(add to wallet) or not..
        self.checkEligibility()
    }
}

// MARK: - Passkit methods
extension CardProvisioningVC: PKAddPaymentPassViewControllerDelegate {
    func checkEligibility() {
        let eligibility = PKAddPaymentPassViewController.canAddPaymentPass()
        let passLibrary = PKPassLibrary.init()
        
        if eligibility {
            //once its eligible, add button to add card to wallet..
            let addPassButton = PKAddPassButton()
            addPassButton.addPassButtonStyle = .black
            addPassButton.addTarget(self, action: #selector(startApplePayProvisioning), for: .touchUpInside)
            self.view.addSubview(addPassButton)
            self.view.bringSubviewToFront(addPassButton)
            
            addPassButton.translatesAutoresizingMaskIntoConstraints = false
            addPassButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
            addPassButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -25).isActive = true
            addPassButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
        }
    }
    
    @objc func startApplePayProvisioning() {
        let request = PKAddPaymentPassRequestConfiguration(encryptionScheme: .ECC_V2)
        request?.cardholderName = "xxxxx"
        request?.primaryAccountSuffix = "xxxxx" //last 4 digits of card
        request?.localizedDescription =  "xxxxx" // description
        request?.primaryAccountIdentifier = "xxxxx" //card id..... it filters the device and attached devices that already have this card provisioned.(Maybe cardId);
        request?.paymentNetwork = PKPaymentNetwork.visa
        let vc = PKAddPaymentPassViewController(requestConfiguration: request!, delegate: self)
        self.present(vc!, animated: true, completion: nil)
    }
    
    func addPaymentPassViewController(_ controller: PKAddPaymentPassViewController, generateRequestWithCertificateChain certificates: [Data], nonce: Data, nonceSignature: Data, completionHandler handler: @escaping (PKAddPaymentPassRequest) -> Void) {
        
        //First you should get the certificates, nonce and nonceSignature
        //and convert them to Base 64 string.....
        let certificateLeaf = certificates[0].base64EncodedString()
        let nonceString = nonce.base64EncodedString()
        let nonceSignatureVal = nonceSignature.base64EncodedString()

        //After that, send it to solid backend...
        var postBody = CardWalletRequestBody()  //Data Model..
        var aPay = Applepay() //Data Model..
        aPay.nonce = nonceString
        aPay.nonceSignature = nonceSignatureVal
        aPay.deviceCert = certificateLeaf
        postBody.wallet = "applePay"
        postBody.applePay = aPay

        //you need to call Solid API to enroll card with endpoint : "(apiBaseURL)/card/(cardId)/provision"
        APIcalls.enrollCard(cardId: cId, walletData: postBody) { response, errorMessage in
            //you should get values in base64 string from the backend..
            let payloadData = response.applePay?.encryptedPassData
            let activationcode = response.applePay?.activationData
            let ephemeralkey = response.applePay?.ephemeralPublicKey

            //once you get the response from backend, convert it to base64 data
            let encryptedPassData =  Data(base64Encoded: payloadData ?? "", options: [])
            let ephemeralPublicKey  = Data(base64Encoded: ephemeralkey ?? "", options: [])
            let activationData = Data(base64Encoded: activationcode ?? "", options: [])

            //then create an object using PKAddPaymentPassRequest and send by completionHandler.
            let paymentPassRequest = PKAddPaymentPassRequest.init()
            paymentPassRequest.activationData = activationData
            paymentPassRequest.encryptedPassData = encryptedPassData
            paymentPassRequest.ephemeralPublicKey = ephemeralPublicKey
            handler(paymentPassRequest)
        }
    }
    
    func addPaymentPassViewController(_ controller: PKAddPaymentPassViewController, didFinishAdding pass: PKPaymentPass?, error: Error?) {
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
