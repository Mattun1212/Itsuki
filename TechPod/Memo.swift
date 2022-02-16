//
//  Memo.swift
//  TechPod
//
//  Created by 海月 on 2022/02/02.
//
import Foundation
import RealmSwift

class Memo: Object{
    @objc dynamic var name: String = ""
}

class MemoList: Object{
    let list = List<Memo>()
}
