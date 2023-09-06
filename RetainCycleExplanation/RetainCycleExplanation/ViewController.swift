//
//  ViewController.swift
//  RetainCycleExplanation
//
//  Created by Şevval Mertoğlu on 31.08.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var course : WeakCourse2? = WeakCourse2(name: "IOS Course", url: URL(string: "www.atilsamancioglu.com")!)
        var instructor : WeakInstructor2? = WeakInstructor2(name: "AtiL Samancioglu")
        
        //strong reference, retain cycle (Hafızada tutmak için döngüye sokuyor)
        //course!.instructor = instructor
        //instructor!.course = course
        
        course!.instructor = instructor
        instructor!.course = course
        
        course!.launch(launchedCourse: LaunchedCourse(title: "IOS")) //Diziye bir kurs ekledik.
        
        course = nil
        instructor = nil
        
        
    }


}

