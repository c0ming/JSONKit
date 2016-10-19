//
//  JSONKit.swift
//  c0ming
//
//  Created by c0ming on 16/4/27.
//  Copyright © 2016年 c0ming.me. All rights reserved.
//

import Foundation

extension Collection {
    func toJSONString() -> String? {
        guard let JSONData = self.toJSONData() else {
            return nil
        }
        return String(data: JSONData, encoding: .utf8)
    }
    
    func toJSONData() -> Data? {
        guard JSONSerialization.isValidJSONObject(self) else {
            return nil
        }
        return try? JSONSerialization.data(withJSONObject: self)
    }
}

extension String {
    func toJSONObject() -> Any? {
        return self.data(using: .utf8)?.toJSONObject()
    }
}

extension Data {
    func toJSONObject() -> Any? {
        return try? JSONSerialization.jsonObject(with: self, options: [.allowFragments])
    }
}
