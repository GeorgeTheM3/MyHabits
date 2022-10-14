//
//  DelegateOutController.swift
//  MyHabits
//
//  Created by Георгий Матченко on 11.10.2022.
//

import Foundation

protocol OutputProtocol: AnyObject {
    func delegateOut<T>(info: T?) -> T?
}
