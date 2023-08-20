//
//  RealmDB.swift
//  AnasNewsTask
//
//  Created by mac on 17/08/2023.
//

import Foundation
import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    private let realm: Realm
    private init() {
        realm = try! Realm()
    }
    func saveData(json: [String: Any]) {
        try! realm.write{
            realm.deleteAll()
            print("success to delete all saved api response")
        }
        try! realm.write {
            realm.create(NewsJSON.self, value: json, update: .modified)
            print("success to save api response")
        }
    }
    func fetchData() -> Results<NewsJSON> {
        print("success to retriav api response")
        return realm.objects(NewsJSON.self)
    }
}
