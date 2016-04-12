//: Playground - noun: a place where people can play

import UIKit

var currentDay: Int = 12
var currrentYear: Int = 2016
var currentMonth: Int = 4

struct Birthday {
    var year: Int
    var month: Int
    var day: Int
}

struct Name {
    var firstName: String
    var lastName: String
    
}

struct Person {
    var dateOfBirth: Birthday
    var legalName: Name
    var age: Int {
        get {
        if currentMonth >= dateOfBirth.month && currentDay >= dateOfBirth.day {
            return currrentYear - dateOfBirth.year
        }
        return currrentYear - dateOfBirth.year - 1
        }
        set {
            dateOfBirth.day = currentDay
            dateOfBirth.month = currentMonth
            dateOfBirth.year = currrentYear - newValue
        }
    }
}

var vints = Person(dateOfBirth: Birthday(year: 1991, month: 9, day: 17), legalName: Name(firstName: "Vince", lastName: "Snow"))
print(vints.dateOfBirth)
print(vints.legalName)
vints.age = 99
print(vints.dateOfBirth.year)

