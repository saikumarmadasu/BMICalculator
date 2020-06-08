//
//  ViewController.swift
//  BMI Calculater
//
//  Created by sai kumar madasu on 6/12/19.
//  Copyright © 2019 sai kumar madasu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    @IBOutlet weak var calculateBtnOutlet: UIButton!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculaterModel = CalculaterModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUserInterface()
        setUpLabels()
        setUpButton()
        sliderSetUp()
    }
    
    func setUserInterface() {
        view.backgroundColor = UIColor.init(red: 0.51, green: 0.93, blue: 0.93, alpha: 1.0)
        let appNameLabel: UILabel = UILabel()
        appNameLabel.frame = CGRect(x: 30.0, y: 140.0, width: view.frame.width/2, height: 100.0)
        appNameLabel.text = "Calculate your BMI"
        appNameLabel.text = appNameLabel.text?.uppercased()
        appNameLabel.numberOfLines = 2
        appNameLabel.textColor = UIColor.init(red: 0.18, green: 0.20, blue: 0.21, alpha: 1.0)
        appNameLabel.textAlignment = .left
        appNameLabel.font = UIFont.systemFont(ofSize: 30.0, weight: .semibold)
        view.addSubview(appNameLabel)
    }
    
    func sliderSetUp() {
        heightSlider.minimumValue = 0.0
        heightSlider.maximumValue = 3.0
        heightSlider.value = 1.5
        weightSlider.minimumValue = 0.0
        weightSlider.maximumValue = 100.0
        weightSlider.value = 50.0
    }
    
    func setUpLabels() {
        heightLabel.text = "Height"
        heightValueLabel.textAlignment = .right
        heightValueLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .light)
        heightValueLabel.textColor = UIColor.darkGray
        heightLabel.textAlignment = .left
        heightLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .light)
        heightLabel.textColor = UIColor.darkGray
        weightLabel.text = "Weight"
        weightLabel.textAlignment = .left
        weightLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .light)
        weightLabel.textColor = UIColor.darkGray
        weightValueLabel.textAlignment = .left
        weightValueLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .light)
        weightValueLabel.textColor = UIColor.darkGray
    }
    
    func setUpButton() {
        calculateBtnOutlet.setTitle("Calculate", for: .normal)
        calculateBtnOutlet.backgroundColor = UIColor.init(red:0.88, green:0.44, blue:0.33, alpha:1.00)
        calculateBtnOutlet.setTitleColor(UIColor.white, for: .normal)
        calculateBtnOutlet.layer.cornerRadius = 2.0
        calculateBtnOutlet.titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightValueLabel.text = String(format: "%.2f", sender.value) + "m"
        
    }
    
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightValueLabel.text = String(format: "%.0f", sender.value) + "Kg"
    }
    
    @IBAction func didPressCalculateBtn(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculaterModel.calculateBMI(height: height, weight: weight)
//        let bmi = weight / pow(height, 2)
//        bmiValue = String(format: "%.0f", bmi)
        self.performSegue(withIdentifier: "gotoResultSegue", sender: self)

        /*
         Formula for BMI = Weight (kgs) / Height (m) power 2
         let bmi = weight / (height * height)
         Follow the BODMAS PEMDAS for the mathemetics order in Programming
         */
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoResultSegue" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.resultValue = calculaterModel.getBMIValue()
            destinationVC.advice = calculaterModel.getBMIAdvice()
            destinationVC.color = calculaterModel.getBMIColor()

        }
    }
}

