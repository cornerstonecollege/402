//
//  Person.swift
//  SavingWithNSCoding
//
//  Created by Luiz on 2016-11-16.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

import UIKit

class Person: NSObject, NSCoding
{
    var name:NSString?
    var age:NSNumber?
    
    init(name: NSString?, age: NSNumber?) {
        super.init()
        
        self.age = age
        self.name = name
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "nameKey")
        aCoder.encode(self.age, forKey: "ageKey")
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "nameKey") as? NSString
        let age = aDecoder.decodeObject(forKey: "ageKey") as? NSNumber
        
        self.init(name: name, age: age)
    }
}
