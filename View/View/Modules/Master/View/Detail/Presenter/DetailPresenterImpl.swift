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
   
    
    var networkReviewsInteractor: NetworkReviewsInteractor!
    
    var storageReviewsInteractor: StorageReviewsInteractor!
    
    

    
    weak var view: DetailView?
    private var disposeBag = DisposeBag()
    
    
    func viewDidLoad() { }
    
    
    func loadData(id: String) -> Observable<[Places]> {
        return self.networkReviewsInteractor.checkInternet()
            .flatMap {
                isInternet -> Observable<Bool> in
                
                if isInternet {
                    return self.uploadFromInternet(id: id)
                }
                
                return Observable.just(false)
            }
            .flatMap { isDataUpdated in
                self.storageReviewsInteractor.getFromStorage(isSucLoaded: isDataUpdated)
        }
    }
    
    
    func uploadFromInternet(id: String) -> Observable<Bool> {
        
        return self.networkReviewsInteractor.getReviews(id: id).flatMap { result in
            self.storageReviewsInteractor.saveInStorage(reviews: result, id: id)        }
        
    }
    
    
    
    func getDataById(id: String) {
        
//        self.loadData(id: id)
//            .subscribe(
//            onNext: { (n) in
//               // self.view?.showReviews(review: n)
//        }, onError: { (error) in
//            print("-> \(error.localizedDescription)")
//        }, onCompleted: {
//            print(" onCompleted")
//        }, onDisposed: {
//            print("onDisposed")
//        }).disposed(by: disposeBag)
//        
        
    }
    

    func getDescription(link: String) {
//        networkReviewsInteractor.getDescription(link: link)
//            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
//            .observeOn(MainScheduler.instance)
//            .subscribe(
//                onNext: { (n) in
//                        print(n)
//                self.view?.getDescription(string: n)
//            }, onError: { (error) in
//                print("-> \(error.localizedDescription)")
//            }, onCompleted: {
//                print(" onCompleted")
//            }, onDisposed: {
//                print("onDisposed")
//            }).disposed(by: disposeBag)
   }
    
}



