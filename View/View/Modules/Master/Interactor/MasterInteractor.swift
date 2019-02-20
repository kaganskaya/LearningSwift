//
//  MasterInteractor.swift
//  ABProject
//
//  Created by Eddson on 29.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import Foundation
import RxSwift

class MasterInteratorImpl: MasterInteractor {
    var myRepository: Repos!
    
    init (repository:Repos){
        self.myRepository = repository
    }
    
    func getPlaces(city: String) -> Observable<[Business]> {
        return myRepository.findPlaces(city: city)
    }
}
