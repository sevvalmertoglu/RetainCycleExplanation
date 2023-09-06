//
//  Instructor.swift
//  RetainCycleExplanation
//
//  Created by Şevval Mertoğlu on 31.08.2023.
//

import Foundation

class Instructor {
    let name : String
    var course : Course?
    
    init(name : String) {
        self.name = name
    }
    
    deinit {
        //Hafızadan silindiğinde çalışır.
        print("Instructor \(name) deinitialized")
    }
}


class Course {
    let name : String
    let url : URL
    var instructor : Instructor?
    
    init(name: String, url: URL) {
        self.name = name
        self.url = url
    }
    deinit {
        //Hafızadan silindiğinde çalışır.
        print("Course \(name) deinitialized")
    }
    
}
