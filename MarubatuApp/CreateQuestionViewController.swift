//
//  CreateQuestionViewController.swift
//  MarubatuApp
//
//  Created by nowall on 2018/10/30.
//  Copyright © 2018 鈴木貴大. All rights reserved.
//

import UIKit

class CreateQuestionViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var segment: UISegmentedControl!
    var questions : [[String : Any]] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
//保存ボタン
    @IBAction func saveButton(_ sender: Any) {
        var questions : [[String : Any]] = []
        //問題文が入っていたらUserDefaultsで読み込み
        if UserDefaults.standard.object(forKey: "questions") != nil {
            questions = UserDefaults.standard.object(forKey: "questions")as! [[String : Any]]
        }
        if textField.text == "" {
            showAlert(message: "問題文を入力してください。")
        } else {
            let question: [String: Any] = [
            "question": textField.text,
            "answer": segment.selectedSegmentIndex
            ]
            //辞書型配列に追加
            questions.append(question)
            //保存
            UserDefaults.standard.set(questions, forKey: "questions")
            textField.text = ""
        }
        //shift + command + K(保存ボタン押すとキーボード消える)
        textField.endEditing(true)
    }
    

    
    
    //削除機能
    @IBAction func deleteButton(_ sender: Any) {
        //削除
        UserDefaults.standard.removeObject(forKey: "questions")
        //保存
        UserDefaults.standard.set(questions, forKey: "questions")
        print(questions)
        showAlert(message: "問題をすべて削除しました。")
        textField.text = ""
    }

    
    
    //Alert機能
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        
        alert.addAction(close)
        present(alert,animated: true,completion: nil)
    }
    
    
    
    //shift + command + K(return押すとキーボード閉じる)
    @IBAction func `return`(_ sender: Any) {
    }
    //shift + command + K(他の画面押すとキーボード閉じる)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}
