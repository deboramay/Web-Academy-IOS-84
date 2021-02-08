
import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    printBiggerNumber(numberOne: 4, numberTwo: 5)
    math(number: 6)
    reverseNumber(number: 5)
    denominatorNumber(number: 8)
    perfectNumber(number: 496)
    perfectNumber(number: 100)
    islandPrice()
    studentMoney()
    studentMoneyTwo()
    mirrorNumber(number: 12345)
  }
  
  //BLOCK #1
  // task 0: Вывести на экран наибольшее из двух чисел
  func printBiggerNumber(numberOne: Int, numberTwo: Int) {
    if numberOne == numberTwo {
      print("\(numberOne) is EQUAL to \(numberTwo)")
    } else if numberOne > numberTwo {
      print("\(numberOne) is bigger than \(numberTwo)")
    } else {
      print("\(numberTwo) is bigger than \(numberOne)")
    }
  }
  
  // task 1: Вывести на экран квадрат и куб числа
  func math(number: Int) {
    let sq = number * number
    let qube = sq * number
    print("Square of number \(number) is \(sq), qube is \(qube)")
  }
  
  // task 2: Вывести на экран все числа до заданного и в обратном порядке до 0
  func reverseNumber(number: Int) {
    for value in 0...number {
      print(value, number - value)
    }
  }
  
  // task 3: Подсчитать общее количество делителей числа и вывести их
  func denominatorNumber(number: Int) {
    var i = 0
    for value in 1...number {
      if (number % value == 0) {
        i += 1
      }
    }
    print("Amount of determinators of number \"\(number)\" is \(i)")
  }
  
  // task 4: Проверить, является ли заданное число совершенным и найти их (делители)
  func perfectNumber(number: Int) {
    var denominator = [Int]()
    for value in 1...(number-1) {
      if (number % value == 0) {
        denominator.append(value)
      }
    }
    var sum = 0
    for number in denominator {
      sum += number
    }
    if sum == number {
      print("\(number) is a perfect number, denominators are: \(denominator)")
    } else {
      print("\(number) is not a perfect number")
    }
  }
  
  //BLOCK #2
  //Task 1: Остров Манхэттен был приобретен поселенцами за $24 в 1826 г. Каково было бы в настоящее время состояние их счета, если бы эти 24 доллара были помещены тогда в банк под 6% годового дохода?
  
  func islandPrice () {
    let dateOne = 1826
    let dateTwo = 2021
    let percentValue = 0.06
    var price:Double = 24
    
    for _ in dateOne...dateTwo {
      let money = price+(price*percentValue)
      price = money
    }
    print("The sum on the account equals to \(price.rounded())")
  }
  
  //Task 2: Ежемесячная стипендия студента составляет 700 гривен, а расходы на проживание превышают ее и составляют 1000 грн. в месяц. Рост цен ежемесячно увеличивает расходы на 3%. Определить, какую нужно иметь сумму денег, чтобы прожить учебный год (10 месяцев), используя только эти деньги и стипендию.
  func studentMoney () {
    let scolarship:Double = 700
    var expenses:Double = 1000
    var totalExpenses:Double = 0
    let inflation = 0.03
    var additionalMoney:Double = 0
    
    for _ in 1...10 {
      let money = expenses+(expenses*inflation)
      expenses = money
      totalExpenses = totalExpenses+money
      additionalMoney = additionalMoney+(expenses-scolarship)
    }
    print("The total sum equals to \(totalExpenses.rounded()): scolarship = \(scolarship*10), additional money = \(additionalMoney.rounded())")
  }
  
  //Task 3: У студента имеются накопления 2400 грн. Ежемесячная стипендия составляет 700 гривен, а расходы на проживание превышают ее и составляют 1000 грн. в месяц. Рост цен ежемесячно увеличивает расходы на 3%. Определить, сколько месяцев сможет прожить студент, используя только накопления и стипендию.
  
  func studentMoneyTwo() {
    let scolarship:Double = 700
    var expenses:Double = 1000
    var savings:Double = 2400
    let inflation = 0.03
    let additionalMoney:Double = expenses-scolarship
    var months = 0
    
    while savings > 0 {
      savings = savings-additionalMoney
      expenses = expenses*inflation
      if savings > additionalMoney {
      months += 1
      }
    }
    print("Student can live for \(months) months")
  }
  
  //Task 4: 2хзначную целочисленную переменную типа 25, 41, 12. После выполнения вашей программы у вас в другой переменной должно лежать это же число только задом на перед 52, 14, 21
  func mirrorNumber(number:Int) {
    var n = number
    var m = 0
    while n>0 {
        m = m*10 + n%10
        n = n/10
    }
    print("Reverse number of \(number) is \(m)")
  }
}
