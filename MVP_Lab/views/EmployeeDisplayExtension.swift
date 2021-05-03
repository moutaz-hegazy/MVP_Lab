//
//  EmployeeDisplayExtension.swift
//  MVP_Lab
//
//  Created by moutaz hegazy on 5/3/21.
//  Copyright © 2021 moutaz_hegazy. All rights reserved.
//

import Foundation

extension EmployeesTableViewController : EmployeeDisplayer{
    func display(_ employees: [Employee]) {
        self.employees = employees
        tableView.reloadData()
    }
}
