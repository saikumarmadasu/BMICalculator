//
//  CalculaterModel.swift
//  BMI Calculater
//
//  Created by sai kumar madasu on 6/12/19.
//  Copyright © 2019 sai kumar madasu. All rights reserved.
//

import UIKit

struct CalculaterModel {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, tip: "Eat More", color: #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1))
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, tip: "Eat Normal", color: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, tip: "Eat Less", color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))
        }
    }
    
    func getBMIValue() -> String {
        let bmiValueString = String(format: "%.0f", bmi?.value ?? 0.0)
        return bmiValueString
    }
    func getBMIAdvice() -> String {
        return bmi?.tip ?? "No Tips"
    }
    
    func getBMIColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 0.8446564078, green: 0.5145705342, blue: 1, alpha: 1)
    }
}
