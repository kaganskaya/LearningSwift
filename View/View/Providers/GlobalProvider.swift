//
//  GlobalProvider.swift
//  View
//
//  Created by liza_kaganskaya on 2/12/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import MapKit



class GlobalProvider {
    
    func getPlaces(coord: CLLocationCoordinate2D) -> Observable<[Business]> {
        
        let headers: HTTPHeaders = ["Authorization": "Bearer D1OLBwqLhC5_27J_oSLIjXhAqJs17p6urXveZCxdAyuIQaba9toeFnc1kCWBL8DG9cAsDKsIUX-qki8Ey5fL_eK-XtUQfngg6HSrdWtQmXW4Q4hBOBJ76Z1L-eplXHYx"]
        
        let url = "https://api.yelp.com/v3/businesses/search?latitude=\(coord.latitude)&longitude=\(coord.longitude)"
        
        return Observable<[Business]>.create { observer -> Disposable in
            
            let keyList = "businesses"
        
            let request = Alamofire
                
                .request(url, method: .get, headers: headers )
                
                .validate()
                
                .responseJSON { response in
                                      
                    let value:  NSDictionary?  = response.result.value as? NSDictionary
                    
                    if let listValues =  value?[keyList] {
                        
                
                        
                        let decoder = JSONDecoder()
                        
                        if let data = try? JSONSerialization.data(withJSONObject: listValues as! NSArray , options:[]){
                            do{
                            
                                let content:[Business] = try decoder.decode([Business].self, from: data)
//                                for f in content {
//                                    self.getJSON(strURL: f.imageURL!)
//
//                                }
                              //  print(content)
                                observer.onNext(content)
                                observer.onCompleted()
                            }catch let er as NSError{
                                
                                observer.onError(er)
                            }
                        }else{
                            let error : NSError = NSError(
                                domain: "GlobalProvider",
                                code: -1,
                                userInfo: [NSLocalizedDescriptionKey:"error while serialization"])
                            
                            observer.onError(error)
                        }
                    } else{
                        let error : NSError = NSError(
                            domain: "GlobalProvider",
                            code: -1,
                            userInfo: [NSLocalizedDescriptionKey:"Под данному запросу нету информации"])
                        
                        observer.onError(error)
                    }
                    
            }
            
            
            return Disposables.create(with: {
                request.cancel()
            })
        }
    }
    
    func getReviews(id:String) -> Observable<[Reviews]> {
        
        let headers: HTTPHeaders = ["Authorization": "Bearer D1OLBwqLhC5_27J_oSLIjXhAqJs17p6urXveZCxdAyuIQaba9toeFnc1kCWBL8DG9cAsDKsIUX-qki8Ey5fL_eK-XtUQfngg6HSrdWtQmXW4Q4hBOBJ76Z1L-eplXHYx"]
        
        let url = "https://api.yelp.com/v3/businesses/\(id)/reviews"
        
        return Observable<[Reviews]>.create { observer -> Disposable in
            
            let keyList = "reviews"
            
            let request = Alamofire
                
                .request(url, method: .get, headers: headers )
                
                .validate()
                
                .responseJSON { response in
                    
                    let value:  NSDictionary?  = response.result.value as? NSDictionary
                    
                    if let listValues =  value?[keyList] {
                        
                        
                        
                        let decoder = JSONDecoder()
                        
                        if let data = try? JSONSerialization.data(withJSONObject: listValues as! NSArray , options:[]){
                            do{
                                
                                let content:[Reviews] = try decoder.decode([Reviews].self, from: data)
                                print(content)
                                observer.onNext(content)
                                observer.onCompleted()
                            }catch let er as NSError{
                                
                                observer.onError(er)
                            }
                        }else{
                            let error : NSError = NSError(
                                domain: "GlobalProvider",
                                code: -1,
                                userInfo: [NSLocalizedDescriptionKey:"error while serialization"])
                            
                            observer.onError(error)
                        }
                    } else{
                        let error : NSError = NSError(
                            domain: "GlobalProvider",
                            code: -1,
                            userInfo: [NSLocalizedDescriptionKey:"Под данному запросу нету информации"])
                        
                        observer.onError(error)
                    }
                    
            }
            
            
            return Disposables.create(with: {
                request.cancel()
            })
        }
    }
    
    
}
