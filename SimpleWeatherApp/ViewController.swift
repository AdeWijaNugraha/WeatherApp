//
//  ViewController.swift
//  SimpleWeatherApp
//
//  Created by Ade Wija Nugraha on 8/21/17.
//  Copyright © 2017 Ade Wija Nugraha. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    @IBOutlet weak var cityLabel: UILabel!

    @IBOutlet weak var conditionLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var iconImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let apiClient = WeatherApiClient()
        apiClient.getStaticWeatherData { response in
            if let responseUnwrapped = response {
                print(responseUnwrapped)
                self.cityLabel.text = responseUnwrapped.name
                self.conditionLabel.text = responseUnwrapped.weatherCondition
                self.temperatureLabel.text = "\(responseUnwrapped.temperature!.rounded()) C"
                self.iconImage.sd_setImage(with:
                    URL(string: "https://openweathermap.org/img/w/\(responseUnwrapped.weatherIconCode!).png")!)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
