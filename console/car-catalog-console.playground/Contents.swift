struct Car {
    
    var yearOfIssue: Int
    var producer: String
    var model: String
    var bodyType: String
    
    static func addCar(name: String, yearOfIssue: Int, producer: String, model: String, bodyType: String) {
        if let _ = carCatalog[name] {
            print("Такая машина уже существует!")
        } else {
            carCatalog[name] = Car(yearOfIssue: yearOfIssue,
                                   producer: producer,
                                   model: model,
                                   bodyType: bodyType)
        }
    }
    
    static func removeCar(name: String) {
        if let removedValue = carCatalog.removeValue(forKey: name) {
            print("Удалена машина - \(removedValue).")
        } else {
            print("Каталог не содержит машины - \(name).")
        }
    }
    
    static func changeCar(name: String, yearOfIssue: Int, producer: String, model: String, bodyType: String) {
        if let _ = carCatalog[name] {
            carCatalog.updateValue(Car(yearOfIssue: yearOfIssue,
                                       producer: producer,
                                       model: model,
                                       bodyType: bodyType),
                                   forKey: name)
        } else {
            print("Такой машины не существует!")
        }
    }
    
    static func getCarInfo(name: String) {
        if carCatalog[name] != nil {
            print("\(name): год производства: \((carCatalog[name]?.yearOfIssue)!), производитель: \((carCatalog[name]?.producer)!), модель: \((carCatalog[name]?.model)!), тип кузова \((carCatalog[name]?.bodyType)!)")
        } else {
            print("Такой машины не существует в справочнике")
        }
        
    }
    
    static func getAllCarsInfo() {
        if carCatalog.isEmpty {
            print("Каталог пустой добавьте машину")
        } else {
            for (nameOfCar, carInfo) in carCatalog {
                print("\(nameOfCar): год производства: \(carInfo.yearOfIssue), производитель: \(carInfo.producer), модель: \(carInfo.model), тип кузова \(carInfo.bodyType)")
            }
        }
    }
}


var carCatalog = [String: Car]()
carCatalog = ["BMW M8": Car(yearOfIssue: 2020, producer: "BMW", model: "M8", bodyType: "Седан" ),
              "Audi Q6": Car(yearOfIssue: 2018, producer: "Audi", model: "Q6", bodyType: "Хэтчбэк"),
              "Lexus": Car(yearOfIssue: 2015, producer: "Lexus", model: "IS300", bodyType: "Седан")]


Car.getAllCarsInfo()
// Проверка добавления существующей машины в каталоге
Car.addCar(name: "BMW M8", yearOfIssue: 2010, producer: "Lada", model: "Granta", bodyType: "Хэтчбэк")
// Добавления нового автомобиля
Car.addCar(name: "Lada Granta", yearOfIssue: 2010, producer: "Lada", model: "Granta", bodyType: "Хэтчбэк")
// Изменения добавленого автомобиля
Car.changeCar(name: "Lada Granta", yearOfIssue: 2011, producer: "Lada", model: "Granta", bodyType: "Седан")
// Проверка удаления не существующего автомобиля
Car.removeCar(name: "Alfa Romeo")
// Удаление добавленго автомобиля
Car.removeCar(name: "Lada Granta")
// Проверка отображения не существующего автомобиля
Car.getCarInfo(name: "Lada Kalina")
// Отображение существующего автомобиля
Car.getCarInfo(name: "BMW M8")

