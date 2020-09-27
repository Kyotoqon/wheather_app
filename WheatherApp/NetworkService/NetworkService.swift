//
//  NetworkService.swift
//  WheatherApp
//
//  Created by A. Salgara on 27.09.2020.
//  Copyright © 2020 A. Salgara. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService{
    
    private let key = "afc878ca16f29351361ce62da4874550"
    private let baseURL = "http://api.weatherstack.com"
    
    func getWeatherOf(city: String, completion: @escaping ((Wheather) -> Void) ){
        let request = "\(baseURL)/current?access_key=\(key)&query=\(city))"
        AF.request(request, method: .get).responseJSON { (response) in
            guard let data = response.data else { return }
            if let weather = try? JSONDecoder().decode(Wheather.self, from: data){
                completion(weather)
            }
        }
        
    }
    
}
