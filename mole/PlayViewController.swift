//
//  PlayViewController.swift
//  mole
//
//  Created by Yo Higashida on 2021/05/10.
//

import UIKit

class PlayViewController: UIViewController {
    
    @IBOutlet var moleButton1: UIButton!
    @IBOutlet var moleButton2: UIButton!
    @IBOutlet var moleButton3: UIButton!
    @IBOutlet var moleButton4: UIButton!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var pointLabel: UILabel!
    
    var timer: Timer = Timer()
    var count: Float = 30.0
    var point: Int = 0
    var didIntCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moleButton1.isHidden = true
        moleButton2.isHidden = true
        moleButton3.isHidden = true
        moleButton4.isHidden = true
        start()
    }
    
    @IBAction func mole(sender: UIButton) {
        let id: Int = Int(sender.tag)
        if id % 2 == 0 {
            point += 2
        }else {
            point += 1
        }
        pointLabel.text = String(point)
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    // セグエを準備（prepare）するときに呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.point = self.point
        }
    }
    
    func start() {
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.down),
                                         userInfo: nil,
                                         repeats: true
            )
        }
    }
    
    func stop() {
        if timer.isValid {
            // タイマーが停止していたら停止する
            timer.invalidate()
        }
    }
    
    @objc func down() {
        count = count - 0.01
        timeLabel.text = "残り時間: " + String(format: "%.2f", count)
        
        var intCount: Int = Int(count*5)
        if intCount != didIntCount{
            if intCount % 3 == 0 {
                if !moleButton1.isHidden{
                    moleButton1.isHidden = true
                }else if Bool.random(){
                    moleButton1.isHidden = false
                }
            } else if intCount & 4 == 0 {
                if !moleButton2.isHidden{
                    moleButton2.isHidden = true
                }else if Bool.random(){
                    moleButton2.isHidden = false
                }
            } else if intCount & 2 == 0 {
                if !moleButton3.isHidden{
                    moleButton3.isHidden = true
                }else if Bool.random(){
                    moleButton3.isHidden = false
                }
            } else if intCount & 5 == 0 {
                if !moleButton4.isHidden{
                    moleButton4.isHidden = true
                }else if Bool.random(){
                    moleButton4.isHidden = false
                }
            }
            
            didIntCount = intCount
        }
        
        if count <= 0 {
            self.stop()
            moleButton1.isEnabled = false
            moleButton2.isEnabled = false
            moleButton3.isEnabled = false
            moleButton4.isEnabled = false
            performSegueToResult()
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
    
}
