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
    
    let key = "afc878ca16f29351361ce62da4874550"
    let baseURL = "http://api.weatherstack.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let query = "37.85834,-122.406417"
        let city = "Tokyo"
        let request = "\(baseURL)/current?access_key=\(key)&query=\(city))"
        AF.request(request, method: .get).responseJSON { (response) in
            switch response.result{
            case let .success(data):
                print(data)
                if let wheatherData = data as? [String: Any]{
                    guard let current = wheatherData["current"] as? [String: Any] else { return }
                    if let description = current["weather_descriptions"] as? [String]{
//                        print(description.first)
                        self.titleLabel.text = description.first
                    }
                }
            case let .failure(error):
                print(error)
            }
        }
        
        
        
    }


}

