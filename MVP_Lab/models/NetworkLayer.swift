//
//  NetworkLayer.swift
//  MVP_Lab
//
//  Created by moutaz hegazy on 5/3/21.
//  Copyright © 2021 moutaz_hegazy. All rights reserved.
//

import Foundation

class NetworkModel{
    
//    static let shared = NetworkModel()
    
    private init(){}

    
    static func fetch(fromUrl urlStr:String , with handler : (([Employee]?,NSError?)->Void)? = nil)
    {

        let url = URL(string: urlStr)

        DispatchQueue.global(qos: .userInitiated).async{
                guard let dataUrl = url,
                    let webJson = try? String(contentsOf: dataUrl),
                    let jsonData = webJson.data(using: .utf8),
                    let dataDict = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any],
                    let employeesData = dataDict["data"] as? [Dictionary<String,Any>]
                    else
                {
                    handler?(nil,NSError())
                    print(">>> FAILED")
                    return
                }
                print(">>>> Success")
            var employees : [Employee] = []
                for emp in employeesData{
                    let newEmployee = Employee(id: emp["id"] as? Int ?? -1,
                                               name: emp["employee_name"] as? String ?? "",
                                               age: emp["employee_age"] as? Int ?? -1,
                                               salary: emp["employee_salary"] as? Int ?? -1)
                    employees += [newEmployee]
                }
                DispatchQueue.main.async{
                    handler?(employees,nil)
                }
        }
    }
}
