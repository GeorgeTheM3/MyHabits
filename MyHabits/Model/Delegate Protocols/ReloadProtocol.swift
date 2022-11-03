//
//  ReloadProtocol.swift
//  MyHabits
//
//  Created by Георгий Матченко on 03.11.2022.
//

import Foundation

protocol ReloadProtocol: AnyObject {
    func reloadSomething<T>(info: T?) -> T?
}
