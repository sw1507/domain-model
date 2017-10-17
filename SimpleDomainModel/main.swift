//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
  return "I have been tested"
}

open class TestMe {
  open func Please() -> String {
    return "I have been tested"
  }
}

////////////////////////////////////
// Money
//
public struct Money {
  public var amount : Int
  public var currency : String
  
  public func convert(_ to: String) -> Money {
    var newAmount = 0
    
    if (self.currency == "USD"){
        switch to {
        case "CAN":
            newAmount = self.amount * 5 / 4
        case "GBP":
            newAmount = self.amount / 2
        case "EUR":
            newAmount = self.amount * 3 / 2
        default:
            newAmount = self.amount
        }
    }else if(self.currency == "CAN"){
        switch to {
        case "USD":
            newAmount = self.amount * 4 / 5
        case "GBP":
            newAmount = self.amount * 2 / 5
        case "EUR":
            newAmount = self.amount * 6 / 5
        default:
            newAmount = self.amount
        }
    }else if(self.currency == "EUR"){
        switch to{
        case "USD":
            newAmount = self.amount * 2 / 3
        case "GBP":
            newAmount = self.amount * 1 / 3
        case "CAN":
            newAmount = self.amount * 5 / 6
        default:
            newAmount = self.amount
        }
    }else{
        switch to {
        case "USD":
            newAmount = self.amount * 2
        case "EUR":
            newAmount = self.amount * 3
        case "CAN":
            newAmount = self.amount * 5 / 2
        default:
            newAmount = self.amount
        }
    }
    return Money(amount: newAmount, currency: to)
  }
  
  public func add(_ to: Money) -> Money {
    if(self.currency == to.currency){
        return Money(amount: self.amount + to.amount, currency: to.currency)
    }else{
        let newAmount = self.convert(to.currency).amount + to.amount
        return Money(amount: newAmount, currency: to.currency)
    }
  }
  public func subtract(_ from: Money) -> Money {
    if(self.currency == from.currency){
        return Money(amount: self.amount + from.amount, currency: from.currency)
    }else{
        let newAmount = self.convert(from.currency).amount - from.amount
        return Money(amount: newAmount, currency: from.currency)
    }
  }
}

////////////////////////////////////
// Job
//
open class Job {
  fileprivate var title : String
  fileprivate var type : JobType

  public enum JobType {
    case Hourly(Double)
    case Salary(Int)
  }
  
  public init(title : String, type : JobType) {
    self.title = title
    self.type = type
  }
  
  open func calculateIncome(_ hours: Int) -> Int {
    
  }
  
  open func raise(_ amt : Double) {
  }
}

////////////////////////////////////
// Person
//
open class Person {
  open var firstName : String = ""
  open var lastName : String = ""
  open var age : Int = 0

  fileprivate var _job : Job? = nil
  open var job : Job? {
    get { }
    set(value) {
    }
  }
  
  fileprivate var _spouse : Person? = nil
  open var spouse : Person? {
    get { }
    set(value) {
    }
  }
  
  public init(firstName : String, lastName: String, age : Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
  }
  
  open func toString() -> String {
  }
}

////////////////////////////////////
// Family
//
open class Family {
  fileprivate var members : [Person] = []
  
  public init(spouse1: Person, spouse2: Person) {
  }
  
  open func haveChild(_ child: Person) -> Bool {
  }
  
  open func householdIncome() -> Int {
  }
}





