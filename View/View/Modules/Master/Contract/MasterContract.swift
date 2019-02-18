//
//  MasterContract.swift
//  View
//
//  Created by liza_kaganskaya on 2/12/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation
import UIKit

import RxSwift
import MapKit

protocol MasterPresenter: class {
    var view: MasterView? { get set }
    var interactor: MasterInteractor! { get set }
    func findBusiness(city:String)
    func onViewDidLoad()
}

protocol MasterInteractor: class {
    
    var  myRepository: Repos! {get set}
    func getPlaces(city: String) -> Observable<[Business]>
    
}

protocol MasterView: class {
    var presenter: MasterPresenter! { get set }
    func showBusiness(business:[Business])
}
