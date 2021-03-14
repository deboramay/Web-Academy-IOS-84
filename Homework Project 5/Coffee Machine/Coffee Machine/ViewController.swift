//
//  ViewController.swift
//  Coffee Machine
//
//  Created by Anastasia on 16.02.2021.
//

import UIKit

class ViewController: UIViewController {
  
  let coffeeMachine = CoffeeMachineClass()
  
  @IBOutlet weak var statusBarLabel: UILabel!
  @IBOutlet weak var espressoButton: UIButton!
  @IBOutlet weak var latteButton: UIButton!
  @IBOutlet weak var addWaterButton: UIButton!
  @IBOutlet weak var addCoffeeButton: UIButton!
  @IBOutlet weak var addMilkButton: UIButton!
  @IBOutlet weak var emptyGarbageButton: UIButton!
  
    
  
  override func viewDidLoad() {
    super.viewDidLoad()
    statusBarLabel.text = coffeeMachine.statusBar
  }

  
  @IBAction func espressoButton(_ sender: UIButton) {
    coffeeMachine.makeDrink(drink: .espresso)
    statusInfo()
  }

  @IBAction func latteButton(_ sender: UIButton) {
    coffeeMachine.makeDrink(drink: .latte)
    statusInfo()
  }
  
  @IBAction func addWaterButton(_ sender: UIButton) {
    coffeeMachine.addWater()
    statusInfo()
  }
  
  @IBAction func addCoffeeButton(_ sender: UIButton) {
    coffeeMachine.addCoffee()
    statusInfo()
  }
  
  @IBAction func addMilkButton(_ sender: UIButton) {
    coffeeMachine.addMilk()
    statusInfo()
  }
  
  @IBAction func emptyGarbageButton(_ sender: UIButton) {
    coffeeMachine.emptyGarbageTank()
    statusInfo()
  }
  
  func statusInfo () {
    statusBarLabel.text = coffeeMachine.statusBar
    print(coffeeMachine.waterTank, coffeeMachine.coffeeTank, coffeeMachine.garbageTank, coffeeMachine.milkTank, coffeeMachine.statusBar)
  }
  
  
  
}

