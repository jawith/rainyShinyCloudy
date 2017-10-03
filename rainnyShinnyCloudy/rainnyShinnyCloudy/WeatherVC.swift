//
//  WeatherVC.swift
//  rainnyShinnyCloudy
//
//  Created by k7user on 25/09/17.
//  Copyright © 2017 k7user. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var CurrentTempLabel: UILabel!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var currentweatherImage: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var currentWeather : CurrentWeather!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        currentWeather = CurrentWeather()
       
        currentWeather.downloadWeatherDetails{
            self.updateMainUI()

        }
      print(CURRENT_WEATHER_URL)
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

