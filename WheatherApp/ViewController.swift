//
//  ViewController.swift
//  WheatherApp
//
//  Created by A. Salgara on 27.09.2020.
//  Copyright © 2020 A. Salgara. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    var networkService = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
    }
    
    private func getWeather(){
        networkService.getWeatherOf(city: "Seoul") {[weak self] (weather) in
            guard let self = self else { return }
            self.titleLabel.text = weather.current.weather_descriptions.first
        }
    }

}

