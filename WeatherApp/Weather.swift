//
//  Weather.swift
//  WeatherApp
//
//  Created by Admin on 09/02/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

struct Weather {
    let cityName : String
    let Temp : Double
    let wind : Double
    let hum : Double
    var tempc : Double{
        get{
            return Temp - 273.15
        }
    }
    let desc : String
    let icon :String
    
    init(cityName:String,Temp:Double,desc:String,icon:String,hum:Double,wind:Double) {
        self.cityName = cityName
        self.Temp = Temp
        self.desc = desc
        self.icon = icon
       self.wind = wind
        self.hum = hum
    }
}
