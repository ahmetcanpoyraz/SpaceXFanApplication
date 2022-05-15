//
//  Rocket.swift
//  SpaceXFanApplication
//
//  Created by Ahmet can Poyraz on 14.05.2022.
//





import Foundation

struct Rocket:  Codable  {
    
    
       
    let id : Int
 //   let payloads: [Payloads]
  //  var firstStage: [FirstStage]
        let  rocketID, rocketName, rocketType: String
      
        enum CodingKeys: String, CodingKey {
            
          
            case id = "id"
          //  case payloads = "payloads"
           // case firstStage ="
            case rocketID = "rocket_id"
            case rocketName = "rocket_name"
            case rocketType = "rocket_type"
        }
    
  
    }


    struct Payloads: Codable {

        let option_1: String
       
        enum CodingKeys: String, CodingKey {
            case option_1 = "option_1"
   
        }
    }

    
struct FirstStage: Codable {

 
    let fuelAmountTons: Int
    let burnTimeSEC: Int
   

    enum CodingKeys: String, CodingKey {
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
        
       
    }
}
