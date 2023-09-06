//
//  WeakSelfExamples.swift
//  RetainCycleExplanation
//
//  Created by Şevval Mertoğlu on 31.08.2023.
//

import Foundation

struct LaunchedCourse {
    // Struct'larda referans yoktur.
    let title : String
    var isLaunched : Bool = false
    
    init(title: String) {
        self.title = title
       
    }
}

class WeakInstructor2 {
    let name : String
    var course : WeakCourse2?
    
    init(name : String) {
        self.name = name
    }
    
    deinit {
        //Hafızadan silindiğinde çalışır.
        print("WeakInstructor2 \(name) deinitialized")
    }
}


class WeakCourse2 {
    let name : String
    let url : URL
    weak var instructor : WeakInstructor2?
    
    var launchedCourses : [LaunchedCourse] = [] //Yayınlanılan kursların bir listesini tutuyoruz.
    var onLaunched : ((_ launchedCourse : LaunchedCourse) -> Void)?
    
    func launch(launchedCourse : LaunchedCourse) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.onLaunched?(launchedCourse)
           
        }
    }
    
    
    init(name: String, url: URL) {
        self.name = name
        self.url = url
        
        onLaunched = { [weak self] launchedCourse in
            self?.launchedCourses.append(launchedCourse)
            print("launched course count:\(self?.launchedCourses.count)")
            
        }
        
        
    }
    deinit {
        //Hafızadan silindiğinde çalışır.
        print("WeakCourse2 \(name) deinitialized")
    }
    
}
