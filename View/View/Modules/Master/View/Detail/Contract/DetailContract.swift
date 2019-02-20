//
//  DetailContract.swift
//  ABProject
//
//  Created by Eddson on 30.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation

import RxSwift
import MapKit

protocol DetailCreator: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController
}

protocol DetailPresenter: class {
    var view: DetailView? { get set }
    var interactor: DetailInteractor! { get set }
    
    func getDescription(link:String)
    func getDataById(id: String)
    func viewDidLoad()
}

protocol DetailInteractor: class {
    var  globalProvider: GlobalProvider! {get set}
    
    func getDescription(link:String) -> Observable<String>
    func getDataById(id: String) -> Observable<[Reviews]>
}

protocol DetailView: class {
    var presenter: DetailPresenter! { get set }
    
    func fillImageView(url:String)
    
    func showReviews(review: [Reviews])
    
    func getDescription(string:String) 
}
