//
//  MasterPresenterImpl.swift
//  View
//
//  Created by liza_kaganskaya on 2/12/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation
import RxSwift
import MapKit

class MasterPresenterImpl: MasterPresenter {
   
    
    weak var view: MasterView?
    
    var interactor: MasterInteractor!
    
    private var disposeBag = DisposeBag()
    
     
    func findBusiness(city: String) {
        
        interactor.getPlaces(city:city )
            .subscribe(
                onNext: { (n) in
                    self.view?.showBusiness(business: n)
            }, onError: { (error) in
                print("-> \(error.localizedDescription)")
                //self.view?.showErrorLocation(value: error.localizedDescription)
            }, onCompleted: {
                print(" onCompleted")
            }, onDisposed: {
                print("onDisposed")
            }).disposed(by: disposeBag)
        
    }
    
    
    func onViewDidLoad() {
        
       
        
    }
    
    
    
}
