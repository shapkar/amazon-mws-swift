//
//  Signature.swift
//  amazon-mws
//
//  Created by Naum Shapkarovski on 6/5/20.
//  Copyright © 2020 Naum Shapkarovski. All rights reserved.
//

import Foundation
import CommonCrypto

struct Signature {
    static func calculateSignature (stringToSign: String, secretKey: String) -> String {
        let dataToSign = stringToSign.data(using: .utf8)
        
        let signingSecretData = secretKey.data(using: .utf8)
        
        let digestLength = Int(CC_SHA256_DIGEST_LENGTH)
        let digestBytes = UnsafeMutablePointer<UInt8>.allocate(capacity:digestLength)
        
        CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA256), [UInt8](signingSecretData!), signingSecretData!.count, [UInt8](dataToSign!), dataToSign!.count, digestBytes)
        
        // base64 output
        let hmacData = Data(bytes: digestBytes, count: digestLength)
        let signature = hmacData.base64EncodedString()
        print("The HMAC signature in base64 is " + signature)
        
        return signature
    }
    
    static func urlEncode(urlItem: String) -> String {
        let unreserved = "~*-._"
        let allowed = NSMutableCharacterSet.alphanumeric()
        allowed.addCharacters(in: unreserved)
        
        return urlItem.addingPercentEncoding(withAllowedCharacters: allowed as CharacterSet)!
    }
    
    static let iso8601Formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return formatter
    }()
    
    static func dateToIso8601() -> String {
        let date = iso8601Formatter.string(from: Date())
        return date
    }
    
}
