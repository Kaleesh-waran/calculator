//
//  Model.swift
//  Calculator
//
//  Created by Kaleeshwaran P on 27/12/22.
//

import Foundation

final class MyData {
    
    static let shared: MyData = MyData()
    
    private let data: [String] = ["0","1","2","3","4","5","6","7","8","9",
                                  "+","-","x","/",".","AC","Del","+/-","%","="]
    var valueList: [String] { get { return data } }
    
}


