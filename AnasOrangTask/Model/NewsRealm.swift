//
//  NewsRealm.swift
//  AnasNewsTask
//
//  Created by mac on 17/08/2023.
//

import Foundation

import RealmSwift
class NewsJSON: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var data: Data
    convenience init(data: Data) {
        self.init()
        self.data = data
    }
    override static func primaryKey() -> String? {
        return "id"
    }
}
