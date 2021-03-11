import UIKit

protocol Coffee {
    var cost: Int { get }
    func printPrice()
}

class SimpleCoffee: Coffee {
    var cost: Int {
        return 30
    }
    func printPrice(){
        print("Цена вашего кофе \(cost) рублей")
    }
}

protocol CoffeeDecorator: Coffee {
    var base: Coffee { get }
    init(base: Coffee)
}

class Milk: CoffeeDecorator {
    var base: Coffee
    var cost: Int {
        return base.cost + 20
    }
    required init(base: Coffee){
        self.base = base
    }
    func printPrice(){
        print("Цена вашего кофе \(cost) рублей")
    }
}

class Whip: CoffeeDecorator {
    var base: Coffee
    var cost: Int {
        return base.cost + 30
    }
    required init(base: Coffee){
        self.base = base
    }
    func printPrice(){
        print("Цена вашего кофе \(cost) рублей")
    }
}

class Sugar: CoffeeDecorator {
    var base: Coffee
    var cost: Int {
        return base.cost + 10
    }
    required init(base: Coffee){
        self.base = base
    }
    func printPrice(){
        print("Цена вашего кофе \(cost) рублей")
    }
}
class Nuts: CoffeeDecorator {
    var base: Coffee
    var cost: Int {
        return base.cost + 60
    }
    required init(base: Coffee){
        self.base = base
    }
    func printPrice(){
        print("Цена вашего кофе \(cost) рублей")
    }
}
class Caramel: CoffeeDecorator {
    var base: Coffee
    var cost: Int {
        return base.cost + 50
    }
    required init(base: Coffee){
        self.base = base
    }
    func printPrice(){
        print("Цена вашего кофе \(cost) рублей")
    }
}

let simpleCoffe = SimpleCoffee()
let milkCoffee = Milk(base: simpleCoffe)
let milkAndSugar = Sugar(base: Milk(base: SimpleCoffee()))
let nutsCaramelCoffee = Caramel(base: Nuts(base: simpleCoffe))
let fullCoffee = Caramel(base: Nuts(base: Sugar(base: Whip(base: Milk(base: SimpleCoffee())))))

milkCoffee.printPrice()
nutsCaramelCoffee.printPrice()
milkAndSugar.printPrice()
fullCoffee.printPrice()

