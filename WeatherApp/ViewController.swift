//
//  ViewController.swift
//  WeatherApp
//
//  Created by Admin on 08/02/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,weathersServicesDelegate {
    
    
   
    
    @IBOutlet weak var EnterCity: UITextField!
    @IBOutlet weak var AppImage: UIImageView!
    
    @IBOutlet weak var HumidLabel: UILabel!
    @IBOutlet weak var WindLabel: UILabel!
    @IBOutlet weak var TempLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        AppImage.layer.cornerRadius = 20
        AppImage.clipsToBounds = true
        WeatherServices.delegate = self
        
    }
    func WeatherError(message : String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }

   
    @IBAction func GetAction(_ sender: Any) {
    createAlertCon()
    }
    func createAlertCon(){
        let alert = UIAlertController(title: "city", message: "Enter your City", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
          alert.addAction(cancelAction)
        let okAction = UIAlertAction(title: "ok", style: .default)
        { (action : UIAlertAction) in
            let textField = alert.textFields![0]
            let city = textField.text!
           WeatherServices.GetWeather(city:city)
            
        }
        alert.addTextField { (textfield : UITextField) in
            textfield.placeholder = "city name"
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
   
    func setWeather(weather: Weather) {
        // to reduce the number and make it decimal like this 7.2 one number only
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        let f = formatter.string(from: NSNumber(value:weather.tempc))!
        print("cityName:\(weather.cityName),temperature:\(weather.tempc),description:\(weather.desc)")
        TempLabel.text = "\(f)"
        AppImage.image = UIImage(named:"\(weather.icon)")
        WindLabel.text = ("\(weather.wind)")
        HumidLabel.text = ("\(weather.hum)")
        
    }
}

