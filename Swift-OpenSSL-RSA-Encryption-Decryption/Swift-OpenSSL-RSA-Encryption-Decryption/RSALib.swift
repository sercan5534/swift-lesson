//
//  RSA.swift
//  Swift-OpenSSL-RSA-Encryption-Decryption
//
//  Created by Sercan on 13/10/16.
//  Copyright © 2016 Gio. All rights reserved.
//

import Foundation

import OpenSSL.rsa
import OpenSSL.ossl_typ
import OpenSSL.bn


class RSALib{
    let key:UnsafeMutablePointer<RSA>
    
    public init(){
        var status:Int32 = 0
        let rsa = RSA_new()
        let bne = BN_new()
        let exp = RSA_F4
        
        status = BN_set_word(bne, UInt(exp))
        if(status != 1){
            print("error")
        }
        status = RSA_generate_key_ex(rsa, 2048, bne, nil)
        if(status != 1){
            print("error")
        }
        key = rsa
    }
    
    func encrypt(str:String) -> String {
        var strArr = [UInt8](str.utf8)
        let len = Int32(strArr.count)
        let keyLen = RSA_size(key)
        var encArr =  [UInt8](count: Int(keyLen), repeatedValue: 0)
        let encryptedStrLeng = RSA_public_encrypt(len, &strArr, &encArr, key, RSA_PKCS1_PADDING)
        if(encryptedStrLeng < 0){
            print("error")
            return ""
        }
        let encData = NSData(bytes: encArr, length: encArr.count)
        return encData.getHex()!
    }
    
    func decrypt(chipperText:String) -> String {
        let chipperTextLocal = chipperText.hexToByteArray()
        let chipperLength = chipperTextLocal.count
        let keyLen = RSA_size(key)
        var decArr =  [UInt8](count: Int(keyLen), repeatedValue: 0)
        let decryptedStrLeng = RSA_private_decrypt(Int32(chipperLength), chipperTextLocal, &decArr, key, RSA_PKCS1_PADDING)
        if(decryptedStrLeng < 0){
            print("error")
            return ""
        }
        let str = NSString(bytes: decArr, length:Int(decryptedStrLeng), encoding: NSUTF8StringEncoding)!
        return String(str)
    }

}
