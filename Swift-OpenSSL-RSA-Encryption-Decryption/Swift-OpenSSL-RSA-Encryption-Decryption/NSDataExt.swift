//
//  NSDataExt.swift
//  Swift-OpenSSL-RSA-Encryption-Decryption
//
//  Created by Sercan on 13/10/16.
//  Copyright © 2016 Gio. All rights reserved.
//

import Foundation
extension NSData{
    func getHex() -> String? {
        var bytes = [UInt8](count: length, repeatedValue: 0)
        getBytes(&bytes, length: length)
        let hexString = NSMutableString()
        for byte in bytes {
            hexString.appendFormat("%02x", UInt(byte))
        }
        return String(hexString)
    }
}
