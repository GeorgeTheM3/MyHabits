//
//  DelegateInController.swift
//  MyHabits
//
//  Created by Георгий Матченко on 10.10.2022.
//

import Foundation

protocol InputProtocol: AnyObject {
    func delegateInController<T>(info: T?) -> T?
}
