//
//  DetailPresenterImpl.swift
//  ABProject
//
//  Created by Eddson on 30.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation
import RxSwift
import MapKit

class DetailPresenterImpl: DetailPresenter{
    
  
    

    
    weak var view: DetailView?
    
    var interactor: DetailInteractor!
    
    private var disposeBag = DisposeBag()
    
    
    func viewDidLoad() { }
    
    
    func getDataById(id: String) {
        
        interactor.getDataById(id: id)
            .subscribe(
            onNext: { (n) in
                self.view?.showReviews(review: n)
        }, onError: { (error) in
            print("-> \(error.localizedDescription)")
        }, onCompleted: {
            print(" onCompleted")
        }, onDisposed: {
            print("onDisposed")
        }).disposed(by: disposeBag)
        
        
    }
    

    func getDescription(link: String) {
        interactor.getDescription(link: link)
            .subscribe(
                onNext: { (n) in
                        print(n)
                self.view?.getDescription(string: n)
            }, onError: { (error) in
                print("-> \(error.localizedDescription)")
            }, onCompleted: {
                print(" onCompleted")
            }, onDisposed: {
                print("onDisposed")
            }).disposed(by: disposeBag)
    }
    
}


    /*
        getLocation from city name
     */

//
//
//
//    /*
//      get weather data by city name
//    */
//    func loadWeather(city: String) {
//        view?.showLoading()
//        interactor.getWeatcher(city: city)
//            .observeOn(MainScheduler.instance)
//            .subscribe(
//                onNext: { (n) in
//                print("loadWeather -> onNext")
//                self.view?.showResultScreen(result: n)
//            }, onError: { (error) in
//                self.view?.showErrorScreen(error: error.localizedDescription)
//            }, onCompleted: {
//                print("loadWeather -> onCompleted")
//            }, onDisposed: {
//                print("loadWeather -> onDisposed")
//            }).disposed(by: disposeBag)

    

