import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    myName()
    mySurname()
    nameSurname()
    reverse()
    calculation(number: 12345678987654321)
    checkPassword(pass: "qwertyQW12!")
    sortedArray()
    transliteration(word: "Привет")
    search(keyword: "da")
    antimat(text: "What a fucking perfect weather today!")
    
    
  }
  
  //Task 1. Создать строку с своим именем, вывести количество символов содержащихся в ней.
  
  func myName () {
    let myFirstName = "Anastasiia"
    print("Name \"\(myFirstName)\" has \(myFirstName.count) characters")
  }
  
  //Task 2. Создать строку с своим отчеством проверить его на окончание “ич/на”
  
  func mySurname() {
    let mySurname = "Valeryivna"
    if mySurname.hasSuffix("na") {
      print("Surname \"\(mySurname)\" is ended with characters \"na\"")
    } else {
      print("Surname \"\(mySurname)\" is ended with characters \"ich\"")
    }
  }
  
  //Task 3. Cоздать строку, где слитно написано Ваши ИмяФамилия “IvanVasilevich». Вам нужно разбить на две отдельных строки из предыдущей создать третью, где они обе будут разделены пробелом
  
  func nameSurname() {
    let myNameSurname = "AnastasiiaShkalikova"
    let index = myNameSurname.firstIndex(of: "S") ?? myNameSurname.endIndex
    
    let name = myNameSurname[..<index]
    let nameString = String(name)
    
    let surname = myNameSurname[index...myNameSurname.index(before: myNameSurname.endIndex)]
    let surnameString = String(surname)
    
    let myNameSurnameTwo = nameString+" "+surnameString
    print (myNameSurnameTwo)
  }
  
  //Task 4. Вывести строку зеркально Ось → ьсО не используя reverse (посимвольно)
  func reverse() {
    let stringOne = "Osi"
    var stringTwo = [Character]()
    for character in stringOne {
      stringTwo.insert(character, at: 0)
    }
    let stringFinal = String(stringTwo)
    print("\(stringOne) -> \(stringFinal)")
  }
  
  //Task 5. Добавить запятые в строку как их расставляет калькулятор
  func calculation (number: Int){
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    let formattedNumber = numberFormatter.string(from: NSNumber(value:number))
    print("Number after formatting: \(String(describing: formattedNumber))")
  }
  
  //Task 6. Проверить пароль на надежность от 1 до 5
  /* a) если пароль содержит числа +1
   b) символы верхнего регистра +1
   c) символы нижнего регистра +1
   d) спец символы +1
   e) если содержит все вышесказанное */
  
  func checkPassword(pass: String) {
    var validation: [String] = []
    
    for char in pass {
      if char.isNumber, !validation.contains("A") {
        validation.append("A")
      }
      if char.isUppercase, !validation.contains("B") {
        validation.append("B")
      }
      if char.isLowercase, !validation.contains("C"){
        validation.append("C")
      }
      if char.isSymbol || char.isMathSymbol || char.isPunctuation, !validation.contains("D") {
        validation.append("D")
      }
    }
    if validation.count == 4  {
      print("Password is valid")
    } else {
      print("Password isn't valid", validation)
    }
  }
  
  
  //Task 7. Сортировка массива не встроенным методом по возрастанию + удалить дубликаты: [9, 1, 2, 5, 1, 7]
  
  func sortedArray () {
    let numbers: [Int] = [9,1,2,5,1,7]
    let numbersTwo = Set(Array(numbers))
    var numberThree = Array(Set(numbersTwo))
    
    
    for i in 0..<numberThree.count {
      let index = (numberThree.count - 1) - i
      
      for j in 0..<index {
        let number = numberThree[j]
        let nextNumber = numberThree[j + 1]
        
        if number > nextNumber {
          numberThree[j] = nextNumber
          numberThree[j + 1] = number
        }
      }
    }
    print("Unsorted array is: \(numbers). Sorted array is: \(numberThree)")
  }
  
  
  
  //Task 8. Написать метод, который будет переводить строку в транслит
  
  func transliteration(word: String) {
    let dictionaryRusEng: [Character:String] =
      ["а":"a", "б":"b", "в":"v", "г":"g", "д":"d", "е":"e", "ж":"zh", "з":"z", "и":"i",
       "к":"k", "л":"l", "м":"m", "н":"n", "о":"o", "п":"p", "р":"r", "с":"s", "т":"t",
       "у":"u", "ф":"f", "х":"h", "ц":"c", "ч":"c", "ш":"sh", "щ":"shsh", "ь":"'",
       "ы":"y", "э":"e", "ю":"ju", "я":"ja", "А":"A", "Б":"B", "В":"V", "Г":"G", "Д":"D",
       "Е":"E", "Ж":"ZH", "З":"Z", "И":"I", "К":"K", "Л":"L", "М":"M", "Н":"N", "О":"O",
       "П":"P", "Р":"R", "С":"S", "Т":"T", "У":"U", "Ф":"F", "Х":"H", "Ц":"C", "Ч":"C",
       "Ш":"SH", "Щ":"SHSH", "Ь":"'", "Ы":"Y", "Э":"E", "Ю":"JU", "Я":"JA"]
    
    var newName = ""
    for char in word {
      newName.append(dictionaryRusEng[char] ?? String(char))
    }
    print("The word \"\(word)\" is \"\(newName)\"")
  }
  
  
  //Task 9. Сделать выборку из массива строк в которых содержится указанная строка
  //[“lada”, “sedan”, “baklazhan”] search “da”
  
  func search(keyword: String) {
    let array = ["lada", "sedan", "baklazhan", "laDA"]
    var resultArray: [String] = []
    
    // MANUAL
    for element in array {
      if element.lowercased().contains(keyword.lowercased()) {
        resultArray.append(element)
      }
    }
    // AUTO
    // let resultArray = array.filter { element -> Bool in
    // return element.lowercased().contains(keyword.lowercased())
    print("The following words contain letters \"da\": \(resultArray)")
  }
  
  
  //Task 10. [String] — antimat [“fuck”, “fak”] “hello my fak” “hello my ***”
  //Для программы antimat — исключить из предложения все слова содержащиеся в сете
  
  func antimat(text: String) {
    var textArray = text.split(separator: " ").map { String($0) }
    let antimatList = ["fuck", "fak", "fucking"]
    for i in 0..<(textArray.count - 1) {
      let index = (antimatList.count - 1)
      for j in 0..<index {
        if textArray[i].contains(antimatList[j]) {
          textArray[i] = "***"
        }
      }
    }
    let finalText = textArray.joined(separator: " ")
    print(text, " -> ", finalText)
  }
}
