//
//  WeatherVC.swift
//  rainnyShinnyCloudy
//
//  Created by k7user on 25/09/17.
//  Copyright © 2017 k7user. All rights reserved.
//

import UIKit
import Alamofire
class WeatherVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var CurrentTempLabel: UILabel!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var currentweatherImage: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var currentWeather : CurrentWeather!
    var forecast : Forecast!
    var forecasts = [Forecast]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails{
            self.downloadForecastData{
                self.updateMainUI()
            }
        }
      print(CURRENT_WEATHER_URL)
    }
    
    func downloadForecastData(completed:DownloadComplete){
        let forecastUrl = URL(string :FORECAST_URL)!
             Alamofire.request(forecastUrl).responseJSON { response in
                let result = response.result
                if let dict = result.value as? Dictionary<String,AnyObject>{
                    if let list = dict["list"] as? [Dictionary<String,AnyObject>]{
                        
                        for  obj in list{
                            let forecast = Forecast(weatherDict: obj)
                            self.forecasts.append(forecast)
                            print(obj)
                        }
                    }
                }
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func updateMainUI(){
        dateLabel.text=currentWeather.date
        CurrentTempLabel.text = "\(currentWeather.currentTemp)"
        weatherTypeLabel.text = currentWeather.weatherType
        locationLabel.text=currentWeather.cityName
        currentweatherImage.image = UIImage(named:currentWeather.weatherType);
        
    }
}

