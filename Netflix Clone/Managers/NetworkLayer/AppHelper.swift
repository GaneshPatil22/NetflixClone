//
//  AppHelper.swift
//  Netflix Clone
//
//  Created by Patil, Ganesh on 22/08/22.
//

import UIKit

import LocalAuthentication

class AppHelper {

}


/// Get device related information
extension AppHelper {

    static func getDeviceID() -> String {

        return UIDevice.current.identifierForVendor!.uuidString
    }

    static func getBuildNumber() -> String {

        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    }

    static func getVersionNumber() -> String {

        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }

    static func getCurrentLanguage() -> String {

        return Locale.current.languageCode!
    }

    class var hasTopNotch: Bool {
        if #available(iOS 11.0, tvOS 11.0, *) {
            // 44.0 on iPhone X, 20.0 on iPhone 8 on iOS 12+.
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        }
        return false
    }

}

/// View controllers related
extension AppHelper {

    class func topMostController() -> UIViewController {
        var topController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController
        while ((topController?.presentedViewController) != nil) {
            topController = topController?.presentedViewController
        }
        return topController!
    }

    class func showAlertOnRootViewController(title: String?, message: String?) {

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(cancelAction)

        DispatchQueue.main.async {

            AppHelper.topMostController().present(alert, animated: true, completion: nil)
        }
    }
}

extension AppHelper {

    func printJSONObject(data: Data) {
        do {
            let json = try? JSONSerialization.jsonObject(with: data, options : .allowFragments)
            dump(json)
        }
    }
}
