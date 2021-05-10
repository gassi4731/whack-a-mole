//
//  ResultViewController.swift
//  mole
//
//  Created by Yo Higashida on 2021/05/10.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var pointLabel: UILabel!
    var point: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pointLabel.text = String(point) + "点"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
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
