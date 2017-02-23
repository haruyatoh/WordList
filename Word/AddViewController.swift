//
//  AddViewController.swift
//  Word
//
//  Created by 矢頭春香 on 2017/02/23.
//  Copyright © 2017年 矢頭春香. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japanesetextField: UITextField!
    
    var wordArray: [Dictionary<String, String>] = []
    var saveData = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if saveData.array(forKey: "WORD") != nil {
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveWord() {
        let wordDictionary = ["english": englishTextField.text!, "japanese": japanesetextField.text!]
        
        if englishTextField.text! != "" && japanesetextField.text! != "" {
            
            wordArray.append(wordDictionary)
            saveData.set(wordArray, forKey: "WORD")
            
            let alert = UIAlertController(title: "保存完了", message: "単語の登録が完了しました", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            englishTextField.text = ""
            japanesetextField.text = ""

            
        }else{
            
            let alert = UIAlertController(title: "保存できません", message: "単語を入力してください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        
        }
    }

    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
