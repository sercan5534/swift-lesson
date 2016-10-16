//
//  StringExt.swift
//  Swift-OpenSSL-RSA-Encryption-Decryption
//
//  Created by Sercan on 13/10/16.
//  Copyright © 2016 Gio. All rights reserved.
//
import Foundation

extension String{
    func hexToByteArray() -> [UInt8] {
        let tempStr = NSString(string: self)
        let len = tempStr.length
        var arr = [UInt8]()
        for i in 0..<len where i%2 == 0{
            let x = tempStr.substringWithRange(NSRange(location: i, length: 2))
            let y = UInt8.init(x, radix: 16)
            arr.append(y!)
        }
        return arr
    }
}