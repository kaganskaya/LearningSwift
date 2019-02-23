//
//  LocalProvider.swift
//  View
//
//  Created by liza_kaganskaya on 2/22/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class LocalProvider {
    
    func setUserData(username:String, password:String){
        
        let admin = MyUser(username: " ",password: " ")
        
        admin.password = password
        admin.username = username
        
        let archivedAdmin:Data = NSKeyedArchiver.archivedData(withRootObject: admin)
        UserDefaults.standard.set(archivedAdmin, forKey: "savedUserSession")
        UserDefaults.standard.synchronize()
         
    }
    
    func getLoginData() -> Observable<MyUser>{
        
        //while no server part implemented
        setUserData(username: "admin", password: "admin")
        
        return Observable<MyUser>.create { observer -> Disposable in
            do{
                let decoded  =  try UserDefaults.standard.object(forKey: "savedUserSession") as! Data
                let decodedUser =  try NSKeyedUnarchiver.unarchiveObject(with: decoded) as! MyUser
            
                    observer.onNext(decodedUser)
                    observer.onCompleted()
            
            } catch let error as NSError{
                print(error)
                observer.onError(error as Error)
            } catch {
                print("error")
            }
            
            
            return Disposables.create(with: {
            })
        }

    }
}
