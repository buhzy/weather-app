//
//  WeatherServices.swift
//  WeatherApp
//
//  Created by Admin on 09/02/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
protocol weathersServicesDelegate {
    func setWeather(weather:Weather)
    func WeatherError(message : String)
    
    
}
class WeatherServices {
    static var delegate :weathersServicesDelegate?
    static func GetWeather(city:String){
          let appid = "2e09baf41e66fb8af20f3b927facbbb2"
          let path = "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(appid)"
        let url = URL(string: path)
        let request = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            print(">>> \(data)")
         let httpresponse = response as? HTTPURLResponse
            do{
                if error == nil{
                if let unrappedData = data{
                    
                    let json = try JSON(data:unrappedData)
                    var status = 0
                    if let cod = json["cod"].int{
                        status = cod
                    }else if let cod2 = json["cod"].string{
                        status = Int(cod2)!
                    }
                    if status == 200 {
                        let lat = json["coord"]["lat"].double
                        let lon = json["coord"]["lon"].double
                        let temp = json["main"]["temp"].double
                        let Name = json["name"].string
                        let hum = json["main"]["humidity"].double
                        let wind = json["wind"]["speed"].double
                        let description = json["weather"][0]["description"].string
                        let icon = json["weather"][0]["icon"].string
                        
                        let weather = Weather(cityName: Name!, Temp: temp!, desc:description!,icon:icon!,hum:hum!,wind:wind!)
                        
                        
                        if delegate != nil{
                            // to make our results fast
                            DispatchQueue.main.async {
                                self.delegate?.setWeather(weather: weather)
                            }
                            
                        }
                        print("lat: \(lat),temp: \(temp),lon: \(lon),desc: \(description)")
                    }else if status == 404 {
                        if self.delegate != nil {
                            DispatchQueue.main.async {
                                self.delegate?.WeatherError(message: "city not found")
                            }
                        }
                    }else{
                        //401 error
                        if self.delegate != nil{
                            DispatchQueue.main.async {
                                self.delegate?.WeatherError(message: "something went wrong")
                            }
                        }
                    }
        }
                }
                    
                }catch{
                    print("error")
            }
                
                
            }.resume()
            
                    }
                   
        
        
        
        /*
        let weather = Weather(cityName: city, Temp: 2566, desc: "best city")
        print("your city is \(city)")
    self.delegate?.setWeather(weather: weather)
    }
    */
    }

