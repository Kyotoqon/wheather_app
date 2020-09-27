//
//  Wheather.swift
//  WheatherApp
//
//  Created by A. Salgara on 27.09.2020.
//  Copyright © 2020 A. Salgara. All rights reserved.
//

import Foundation

struct Wheather: Decodable{
    
    var current: Current
    var location: Location
    
    enum CodingKeys: CodingKey{
        case current, location
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        current = try container.decode(Current.self, forKey: .current)
        location = try container.decode(Location.self, forKey: .location)
    }
    
    
}

struct Current: Decodable{
    var cloudcover: Int
    var weather_descriptions: [String]
    var weather_icons: [String]
    
    enum CodingKeys: CodingKey{
        case cloudcover, weather_descriptions, weather_icons
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        cloudcover = try container.decode(Int.self, forKey: .cloudcover)
        weather_descriptions = try container.decode([String].self, forKey: .weather_descriptions)
        weather_icons = try container.decode([String].self, forKey: .weather_icons)
    }
    
}
struct Location: Decodable {
    var country: String
    
    enum CodingKeys: CodingKey {
        case country
    }
    
    init(from decoder: Decoder) throws {
          let container = try decoder.container(keyedBy: CodingKeys.self)
          country = try container.decode(String.self, forKey: .country)
      }
}


//
//{
//    current =     {
//        cloudcover = 75;
//        feelslike = 25;
//        humidity = 64;
//        "is_day" = no;
//        "observation_time" = "03:23 PM";
//        precip = "0.8";
//        pressure = 1011;
//        temperature = 22;
//        "uv_index" = 1;
//        visibility = 9;
//        "weather_code" = 176;
//        "weather_descriptions" =         (
//            "Patchy rain possible"
//        );
//        "weather_icons" =         (
//            "https://assets.weatherstack.com/images/wsymbols01_png_64/wsymbol_0025_light_rain_showers_night.png"
//        );
//        "wind_degree" = 342;
//        "wind_dir" = NNW;
//        "wind_speed" = 7;
//    };
//    location =     {
//        country = Japan;
//        lat = "35.690";
//        localtime = "2020-09-28 00:23";
//        "localtime_epoch" = 1601252580;
//        lon = "139.692";
//        name = Tokyo;
//        region = Tokyo;
//        "timezone_id" = "Asia/Tokyo";
//        "utc_offset" = "9.0";
//    };
//    request =     {
//        language = en;
//        query = "Tokyo, Japan";
//        type = City;
//        unit = m;
//    };
//}
