//
//  ViewController.swift
//  TechPod
//
//  Created by 海月 on 2021/12/08.
//

import UIKit
import RealmSwift
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    let realm = try! Realm()
    var memolist: List<Memo>!
    
    @IBOutlet  var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        // Do any additional setup after loading the view.
        table.dataSource = self
        table.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        memolist = realm.objects(MemoList.self).first?.list
        self.table.reloadData()
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realm.objects(MemoList.self).count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell")
                                                 
        cell?.textLabel?.text = memolist[indexPath.row].name
        return cell!
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(memolist[indexPath.row].name)が選ばれました！")
    }
}

//extension MemoList {
//    subscript (list index: Int) -> Int? {
//        if index < self.list.count {
//            return index
//        } else {
//            return nil
//        }
//    }
//    
//}
