//
//  WeakInstructor.swift
//  RetainCycleExplanation
//
//  Created by Şevval Mertoğlu on 31.08.2023.
//

import Foundation

class WeakInstructor {
    let name : String
    var course : WeakCourse?
    
    init(name : String) {
        self.name = name
    }
    
    deinit {
        //Hafızadan silindiğinde çalışır.
        print("Instructor \(name) deinitialized")
    }
}


class WeakCourse {
    let name : String
    let url : URL
    weak var instructor : WeakInstructor? //Weak kullandığımızda hafızadan silinir.
    
    init(name: String, url: URL) {
        self.name = name
        self.url = url
    }
    deinit {
        //Hafızadan silindiğinde çalışır.
        print("Course \(name) deinitialized")
    }
    
}
