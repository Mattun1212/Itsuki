//
//  MemoViewController.swift
//  TechPod
//
//  Created by 海月 on 2022/01/26.
//

import UIKit
import RealmSwift
class MemoViewController: UIViewController,UITextFieldDelegate{
    
    let realm = try! Realm()
    var memolist: List<Memo>!
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.delegate = self
        
       // nameArray = saveData.object(forKey: "data") as? [String] ?? []
        
//        titleTextField.text = saveData.object(forKey: "title") as? String
//        contentTextView.text = saveData.object(forKey: "content") as? String
        // Do any additional setup after loading the view.
    }
    
func read() ->  Memo? {
    return  realm.objects(Memo.self).first
    
}
    @IBAction func saveMemo() {
        
        let memo = Memo()
        if let newName = titleTextField.text {
            memo.name = newName
            try! self.realm.write() {
                if self.memolist == nil {
                    let nameList = MemoList()
                    nameList.list.append(memo)
                    self.realm.add(nameList)
                    self.memolist = self.realm.objects(MemoList.self).first?.list
                } else {
                    self.memolist.append(memo)
                }
                        
            }
        }
        
        let alert: UIAlertController = UIAlertController(title: "保存",message: "メモの保存が完了しました",preferredStyle: .alert)
        
        alert.addAction(
        UIAlertAction(
            title: "OK",
            style: .default,
            handler: {action in
                self.navigationController?.popViewController(animated: true)
        print("OKボタンが押されました！")
                
                
            }
        
)
        )
        
        present(alert,animated: true,completion: nil)
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

