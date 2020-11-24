//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeLabels()
    }

    @IBAction func touchUpStrawberryJuiceButton() {
        do {
            try juiceMaker.make(juice: .strawberryJuice)
            showSuccessAlert(juice: .strawberryJuice)
            changeLabels()
        } catch {
            showOutOfStockAlert()
        }
    }

    @IBAction func touchUpBananaJuiceButton() {
       do {
           try juiceMaker.make(juice: .bananaJuice)
           showSuccessAlert(juice: .bananaJuice)
           changeLabels()
       } catch {
           showOutOfStockAlert()
       }
   }

    @IBAction func touchUpMangoJuiceButton() {
       do {
           try juiceMaker.make(juice: .mangoJuice)
           showSuccessAlert(juice: .mangoJuice)
           changeLabels()
       } catch {
           showOutOfStockAlert()
       }
   }

    @IBAction func touchUpKiwiJuiceButton() {
       do {
           try juiceMaker.make(juice: .kiwiJuice)
           showSuccessAlert(juice: .kiwiJuice)
           changeLabels()
       } catch {
           showOutOfStockAlert()
       }
   }

    @IBAction func touchUpPineappleJuiceButton() {
       do {
           try juiceMaker.make(juice: .pineappleJuice)
           showSuccessAlert(juice: .pineappleJuice)
           changeLabels()
       } catch {
           showOutOfStockAlert()
       }
   }

    @IBAction func touchUpStrawberryBananaJuiceButton() {
       do {
           try juiceMaker.make(juice: .strawberryBananaJuice)
           showSuccessAlert(juice: .strawberryBananaJuice)
           changeLabels()
       } catch {
           showOutOfStockAlert()
       }
   }

    @IBAction func touchUpMangoKiwiJuiceButton() {
       do {
           try juiceMaker.make(juice: .mangoKiwiJuice)
           showSuccessAlert(juice: .mangoKiwiJuice)
           changeLabels()
       } catch {
           showOutOfStockAlert()
       }
   }
    
    @IBAction func touchUpMoveToStockViewButton() {
        moveToManageStockPage()
    }
    
    func showSuccessAlert(juice: JuiceName) {
        let message = juice.rawValue + Message.success.rawValue
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK",
                                     style: .default) { _ in
                                                        self.changeLabels()
        }
        
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
    func showOutOfStockAlert() {
        let alert = UIAlertController(title: nil,
                                      message: Message.outOfStock.rawValue,
                                      preferredStyle: .alert)
        let yesButton = UIAlertAction(title: "yes",
                                      style: .default,
                                      handler: { _ in
                                        self.moveToManageStockPage()
                                      })
        let noButton = UIAlertAction(title: "no",
                                     style: .default,
                                     handler: nil)
        
        alert.addAction(yesButton)
        alert.addAction(noButton)
        present(alert, animated: true, completion: nil)
    }
    
    func moveToManageStockPage() {
        let stockViewController = self.storyboard?.instantiateViewController(withIdentifier: "StockViewController")
        
        stockViewController?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(stockViewController!, animated: true, completion: nil)
    }
    
    func changeLabels() {
        guard let strawberry = juiceMaker.fruits[.strawberry],
              let banana = juiceMaker.fruits[.banana],
              let mango = juiceMaker.fruits[.mango],
              let kiwi = juiceMaker.fruits[.kiwi],
              let pineapple = juiceMaker.fruits[.pineapple] else {
            return
        }
        strawberryStockLabel.text = "\(strawberry.amount)"
        bananaStockLabel.text = "\(banana.amount)"
        mangoStockLabel.text = "\(mango.amount)"
        kiwiStockLabel.text = "\(kiwi.amount)"
        pineappleStockLabel.text = "\(pineapple.amount)"
    }
}

