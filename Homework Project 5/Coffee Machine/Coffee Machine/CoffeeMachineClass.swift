//
//  CoffeeMachineClass.swift
//  Coffee Machine
//
//  Created by Anastasia on 20.02.2021.
//

import Foundation

enum Drink: String {
  case espresso, latte
  
  var waterNeed: Double {
    switch self {
    case .espresso: return 10.0
    case .latte: return 20.0
    }
  }
  
  var coffeeNeed: Double {
    switch self {
    case .espresso: return 20.0
    case .latte: return 20.0
    }
  }
  
  var milkNeed: Double {
    switch self {
    case .espresso: return 0.0
    case .latte: return 30.0
    }
  }
  
  var waste: Double {
    switch self {
    case .espresso: return 20.0
    case .latte: return 20.0
    }
  }
}

class CoffeeMachineClass {
  
  var statusBar: String = "Choose a coffee!"
  var waterTank = 100.0
  var coffeeTank = 100.0
  var milkTank = 100.0
  var garbageTank = 0.0
  
  
  func makeDrink(drink: Drink) {
    if drink == .espresso {
      if coffeeTank < Drink.espresso.coffeeNeed {
        statusBar = "Coffeebean tank is empty"
      }
      else if waterTank < Drink.espresso.waterNeed {
        statusBar = "Water tank is empty"
      }
      else if garbageTank >= 100.0 {
        statusBar = "Garbage container is full"
      }
      else if (coffeeTank >= Drink.espresso.coffeeNeed) && (waterTank >= Drink.espresso.waterNeed) && (garbageTank <= (100-Drink.espresso.waste)) {
        waterTank -= Drink.espresso.waterNeed
        coffeeTank -= Drink.espresso.coffeeNeed
        garbageTank += Drink.espresso.waste
        statusBar = "Take your espresso. Enjoy!"
      }
    }
    if drink == .latte {
      if coffeeTank < Drink.latte.coffeeNeed {
        statusBar = "Coffeebean tank is empty"
      }
      else if waterTank < Drink.latte.waterNeed {
        statusBar = "Water tank is empty"
      }
      else if garbageTank >= 100.0 {
        statusBar = "Garbage container is full"
      }
      else if milkTank < Drink.latte.milkNeed {
        statusBar = "Milk tank is empty"
      }
      else if coffeeTank >= Drink.latte.coffeeNeed && waterTank >= Drink.latte.waterNeed && garbageTank <= (100-Drink.latte.waste) {
        waterTank -= Drink.latte.waterNeed
        coffeeTank -= Drink.latte.coffeeNeed
        garbageTank += Drink.latte.waste
        milkTank -= Drink.latte.milkNeed
        statusBar = "Take your latte. Enjoy!"
      }
      
    }
  }
  func addWater () {
    waterTank = 100.0
    statusBar = "Water tank is full!"
  }
  
  func addMilk () {
    milkTank = 100.0
    statusBar = "Milk tank is full!"
  }
  
  func addCoffee () {
    coffeeTank = 100.0
    statusBar = "Coffee tank is full!"
  }
  
  func emptyGarbageTank () {
    garbageTank = 0.0
    statusBar = "Garbage tank is empty!"
  }
}
