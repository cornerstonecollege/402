//
//  Person.swift
//  SavingWithNSCoding
//
//  Created by Boyoung on 2016-11-16.
//  Copyright © 2016 Boyoung. All rights reserved.
//

import UIKit

class Person: NSObject, NSCoding
{
    var name: String?
    var age: Int?
    
    init(name: String?, age: Int?) {
        super.init()
        
        self.name = name
        self.age = age
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "nameKey")
        aCoder.encode(self.age, forKey: "ageKey")
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
    
        let name = aDecoder.decodeObject(forKey: "nameKey") as? String
        let age = aDecoder.decodeObject(forKey: "ageKey") as? Int
        
        self.init(name: name, age: age)
    }
    
    
}
