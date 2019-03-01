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
import CoreData

class LocalProvider {
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    lazy var managedContext = appDelegate!.persistentContainer.viewContext
    
    
    
    func savePlacesToBd(business: [Business]) -> Observable<Bool>{
        deleteData()
        var result :Observable<Bool> = Observable.just(false)
        for item in business {
            
            result =  saveitem(business: item)
            
        }
       
        return result
        
    }
    
    func saveReviewsToBd(reviews: [Reviews], id:String) -> Observable<Bool>{
        deleteData()
        var result :Observable<Bool> = Observable.just(false)
        for item in reviews {
            
            result =  saveReview(review: item, id:id)
            
        }
        
        return result
        
    }
    
    
    func getPlacesFromBd(isLoaded:Bool) -> Observable<[Places]>{
        print(isLoaded)
        
        return Observable<[Places]>.create { observer -> Disposable in
    
            let fetchRequest =  NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        
        do {
            
            let business  = try self.managedContext.fetch(fetchRequest) as! [Places]
           
            observer.onNext(business  )
            observer.onCompleted()
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            observer.onError(error)
        }
        
            return Disposables.create(with: {
            })
        }
        
       
        
    }
    
    private func deleteData(){
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        fetchRequest.returnsObjectsAsFaults = false
        
        do
        {
            let results = try managedContext.fetch(fetchRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                managedContext.delete(managedObjectData)
            }
        } catch let error as NSError {
            print("Detele all my data in error : \(error) \(error.userInfo)")
        }
        
    }
    
    private func saveitem(business: Business) -> Observable<Bool>{
        
    
        do {
            
                let entity =  NSEntityDescription.entity(forEntityName: "Places",in: managedContext)!
                
                let busines = NSManagedObject(entity: entity,insertInto: managedContext)
                
                busines.setValue(business.id, forKeyPath: "id")
                
                busines.setValue(business.url, forKeyPath: "url")
            
                busines.setValue(business.image_url!, forKeyPath: "image_url")
                
                busines.setValue(business.name, forKeyPath: "name")

                
                do {
                    try managedContext.save()
                    return Observable.just(true)
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                    return Observable.just(false)
                }
                
            
            
        
        return Observable.just(false)
        
        }}


    
    private func saveReview(review: Reviews, id:String) -> Observable<Bool>{
        
        
        do {
            
            let entity =  NSEntityDescription.entity(forEntityName: "Review",in: managedContext)!
            
            let busines = NSManagedObject(entity: entity,insertInto: managedContext)
            
            busines.setValue(review.text, forKeyPath: "text")
            
            do {
                try managedContext.save()
                return Observable.just(true)
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
                return Observable.just(false)
            }
            
            
            
            
            return Observable.just(false)
            
        }}
    
    
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
    func logedIn() ->Observable<Bool>{
        
        if UserDefaults.standard.isLoggedIn()
        {
            return Observable.just(true)
        }else{
            
            return Observable.just(false)
        }
    }
}
