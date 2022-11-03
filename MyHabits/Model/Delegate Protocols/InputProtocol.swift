//
//  DelegateInController.swift
//  MyHabits
//
//  Created by Георгий Матченко on 10.10.2022.
//

import Foundation

protocol InputProtocol: AnyObject {
    // Create for move data from any object to any object
    func delegateInController<T>(info: T?) -> T?
}
