//
//  EmployeesPresenter.swift
//  MVP_Lab
//
//  Created by moutaz hegazy on 5/3/21.
//  Copyright © 2021 moutaz_hegazy. All rights reserved.
//

import Foundation

class EmployeesPresenter {
    private var presenterDelegate : EmployeeDisplayer
    
    init(with delegate : EmployeeDisplayer) {
        presenterDelegate = delegate
        NetworkModel.fetch(fromUrl: Urls.employeesUrl) { (employees, error) in
            if(error != nil){
                return
            }
            
            self.presenterDelegate.display(employees ?? [])
        }
    }
}
