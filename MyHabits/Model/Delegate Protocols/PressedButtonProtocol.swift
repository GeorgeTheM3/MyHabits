//
//  PressedButton.swift
//  MyHabits
//
//  Created by Георгий Матченко on 23.10.2022.
//

import Foundation
import UIKit

protocol PressedButtonProtocol: AnyObject {
    func buttonPressed(selector: Selector)
}
