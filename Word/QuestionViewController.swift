//
//  QuestionViewController.swift
//  Word
//
//  Created by 矢頭春香 on 2017/02/23.
//  Copyright © 2017年 矢頭春香. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var questionLabel:UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    var isAnswered: Bool = false //回答したか、次の問題に行くかの判定
    var wordArray:[Dictionary<String, String>] = [] //UserDefaultsからとる配列
    var shuffledWordarray:[Dictionary<String, String>] = [] //シャッフルされた配列
    var nowNumber: Int = 0 //現在の回数
    
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerLabel.text = ""

        // Do any additional setup after loading the view.
    }

    //Viewが現れたときに呼ばれる
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        //問題をシャッフルする
        shuffle()
        questionLabel.text = shuffledWordarray[nowNumber]["english"]
        
    }
    
    func shuffle(){
        while  wordArray.count > 0 {
            let index = Int(arc4random()) % wordArray.count
            shuffledWordarray.append(wordArray[index])
            wordArray.remove(at: index)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonTapped(){
        //回答したか
        if isAnswered {
            //次の問題へ
            nowNumber += 1
            answerLabel.text = ""
            
            //次の問題を表示するか
            if nowNumber < shuffledWordarray.count{
                //次の問題を表示
                questionLabel.text = shuffledWordarray[nowNumber]["english"]
                //isAnswweredをfalseにする
                isAnswered = false
                //ボタンのタイトルを変更する
                nextButton.setTitle("答えを表示", for: .normal)
            
            }else{
                //これ以上表示する問題がないので、FinishViewに遷移
                self.performSegue(withIdentifier: "toFinishView", sender: nil)
            }
            
        }else{
            //答えを表示する
            answerLabel.text = shuffledWordarray[nowNumber]["japanese"]
            //isAnsweredをtrueにする
            isAnswered = true
            //ボタンのタイトルを変更する
            nextButton.setTitle("次へ", for: .normal)
        }
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
