//
//  ViewController.swift
//  lesson-12-tic-tac-toe
//
//  Created by JAHONGIR on 31/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    var isX = true
    var XSteps: Set<Int> = []
    var OSteps: Set<Int> = []
    var xcnt = 0
    
    var results: Set<[Int]> = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    @IBOutlet weak var winnerLBL: UILabel!
    
    @IBOutlet var X0btns: [UIButton]!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func buttons(_ sender: UIButton) {
        sender.isEnabled = false
        
        if isX == true {
            winnerLBL.text = "O's turn"
            sender.setTitle("X", for: .normal)
            isX = false
            
            XSteps.insert(sender.tag)
            xcnt += 1
            for result in results {
                if Set(result).isSubset(of: XSteps) {
                               winnerLBL.text = "X Won"
                    for i in X0btns {
                        i.isEnabled = false
                    }
                }
                if xcnt == 5 && Set(result).isSubset(of: XSteps) == false {
                    winnerLBL.text = "Nobody Won"
                }
            }

        }
          else  {
              winnerLBL.text = "X's turn"
            sender.setTitle("O", for: .normal)
            isX = true
            
            OSteps.insert(sender.tag)
              for result in results {
                  if Set(result).isSubset(of: OSteps){
                      winnerLBL.text = "O Won"
                      for i in X0btns {
                          i.isEnabled = false
                      }
                  }
              }
          }
        print(XSteps, OSteps)
    }
    
    @IBAction func clearBtnPressed(_ sender: Any) {
        isX = true
        winnerLBL.text = ""
        XSteps = []
        OSteps = []
        xcnt = 0
        for btn in X0btns {
            btn.isEnabled = true
            btn.setTitle("", for: .normal )
        }
    }
}

