/* 1. создать структуру с названием Описание файла она должна содержать следующие свойства: путь к файлу, имя файла, максимальный размер файла на диске, путь к папке содержащей файл, тип файла(скрытый или не скрытый, содержимое файла
   правильно определить свойства которыми должен обладать тип и конкретный обьект(lazy, static, ets) (вып) */
import Foundation

struct FileDescription {
    var filePath: String
    var fileName: String {
/* реализую метод из функционала NSString, разделяющий строку на элементы по разделяющему символу '\' и все элементы внесу в массив, с последним элементом проделаю такую же операцию с разделяющим символом "." и переменной fileName присвою значение суммы элементов массива без последнего */
        let words = filePath.components(separatedBy: "\\")
        let names = words[(words.count - 1)].components(separatedBy: ".")
        var fileName = ""
        if words.count <= 2 {
            fileName = words[0]
        } else {
            for index in 0 ..< (names.count - 1) {
                if index == (names.count - 2) {
                    fileName = "\(fileName)\(names[index])"
                } else {
                    fileName = "\(fileName)\(names[index])."
                }
            }
        }
        return fileName
    }
    static var maxSizeFile = 30
    var pathToTheFolder: String {
/* использую массив из вычисляемого свойства fileName и преременной pathToTheFolder присвою значение суммы всех элементов кроме последнего разделяя элементы символом "/" */
        let words = filePath.components(separatedBy: "\\")
        var pathToTheFolder = ""
        for index in 0 ..< (words.count - 1) {
            pathToTheFolder = "\(pathToTheFolder)" + "\(words[index])" + "\\"
        }
        return pathToTheFolder
    }
    var typeFile: String {
/* использую массив из вычисляемого свойства fileName и с последним элементом проделаю такую же операцию с разделяющим символом "." и переменной typeFile присвою значение последнего элемента массива */
        let words = filePath.components(separatedBy: " ")
        let names = words[(words.count-1)].components(separatedBy: ".")
        let typeFile = names[names.count-1]
        return typeFile
    }
    
    var content: String {
        var content = ""
        switch typeFile {
            case "txt":
                content = "information/documentation"
            case "exe":
                content = "executable file"
            default:
                content = "unknown file"
            }
        return content
    }
}
/* 2. созадать энум, представляющий цветовую гамму, каждое значение энума должно быть Int, тоесть каждое значение энума соответсвовало трехбайтному значению цвета создать энуму три свойства: колличество цветов в гамме, начальный цвет и конечный цвет.

enum Palette {
    //case color(R: Int, G: Int, B: Int)
    case white(255.0, 255.0, 255.0)
    case yellow(255.0, 204.0, 0.0)
    case blue(0.0, 122.0, 255.0)
    
    
    
    func middleColor() -> Int {
        return self.rawValue * 100
    }
}


struct PaletteStructure {
    //case color(R: Int, G: Int, B: Int)
    var totalColor: Int = 0
    var startColor: Int = 0
    var endColor: Int = 0
    
    init(totalColor: Int) {
        self.totalColor = totalColor
    }
    
    init(startColor: Int) {
        self.startColor = startColor
    }
    
    init(endColor: Int) {
        self.endColor = endColor
    }
}

let abcd = PaletteStructure.init(totalColor: 5)
*/

/* 3. создать класс Человек свойства имя фамилия возраст рост вес, макс вес-возраст, минимальный вес-возраст, макс длинна имени, макс длина фамилии   создать свойство в классе, которое будет содержать колличество созданных обьектов этого класса(вып) */
class Human {
    static let firstNameMaxLenght = 10  // lenght
    static let surnameMaxLenght = 25 //surname
    var firstName: String {
        didSet {
            if firstName.count > Human.firstNameMaxLenght {
                firstName = oldValue
            }
        }
    }
    
    var surname: String {
        didSet {
            if firstName.count > Human.firstNameMaxLenght {
            firstName = oldValue
            }
        }
    }
    
    var age: Int
    
    static let maxHeight = 230
    static let minHeight = 50
    var height: Int {
        didSet {
            print("oldValue - \(oldValue) height  - \(height)")
            if (height > Human.maxHeight) || (height < Human.minHeight) {
                height = oldValue
            }
        }
    }
    
    static let maxWeight = 300
    static let minWeight = 3
    var weight: Int {
        didSet {
            if ((weight < Human.maxWeight) && (weight > Human.minWeight)) {
                weight = oldValue
            }
        }
    }
    
    static var copiesCount = 0
    
    init(firstName: String, surname: String, age: Int, height: Int, weight: Int) {
        self.firstName = firstName
        self.surname = surname
        self.age = age
        self.height = height
        self.weight = weight
        Human.copiesCount += 1
    }
}

var human1 = Human(firstName: "Vasya", surname: "Moysha", age: 32, height: 100, weight: 60)
var human2 = Human(firstName: "Tom", surname: "Mur", age: 1000, height: 30, weight: 2)
print(human1.firstName)
print(human1.surname)
print(human1.age)
print(human1.height)
print(human1.weight)
print(Human.copiesCount)
human1.height = 120
print(human1.height)
print(human1.firstName)
