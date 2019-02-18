//
//  Repository.swift
//  View
//
//  Created by liza_kaganskaya on 2/14/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import MapKit

class Repos {
    
    var util = LocationUtil()
    
    var globalpr = GlobalProvider()
    
    init (util: LocationUtil, glob:GlobalProvider){
        self.util = util
        self.globalpr = glob        
    }
    
    func findPlaces(city:String) -> Observable<[Business]>{
        
      
            return  util.getLocationByCityName(city: city)
            .flatMap({ location in
               
                    self.globalpr.getPlaces(coord: location)
                
            })
        
            
       
    }
    
}
