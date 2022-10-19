//
//  Constants.swift
//  MyHabits
//
//  Created by Георгий Матченко on 10.10.2022.
//

import Foundation
import UIKit

class Constants {
//    static let shared = Constants()
    
    // Настройки create habit view
    static let paddingTop = CGFloat(20)
    static let paddingBetween = CGFloat(5)
    static let paddingLeftAndRigh = CGFloat(60)
    static let datePickerHeigh = CGFloat(200)
    
    // Шрифты
    static let title3Font = UIFont.preferredFont(forTextStyle: .title3).withSize(20)
    static let headlineFont = UIFont.preferredFont(forTextStyle: .headline).withSize(17)
    static let bodyFont = UIFont.preferredFont(forTextStyle: .body).withSize(17)
    static let footnoteFont = UIFont.preferredFont(forTextStyle: .footnote).withSize(13)
    static let footnoteStatusFont = UIFont.preferredFont(forTextStyle: .footnote).withSize(13)
    
    //Цвета
    static let navBarTintColor:UIColor = UIColor(red: 161/255, green: 22/255, blue: 204/255, alpha: 1)
    static let customBlue: UIColor = UIColor(red: 41/255, green: 109/255, blue: 255/255, alpha: 1)
    static let customGreen:UIColor = UIColor(red: 41/255, green: 109/255, blue: 255/255, alpha: 1)
    static let customPurple: UIColor = UIColor(red: 98/255, green: 54/255, blue: 255/255, alpha: 1)
    static let customOrange: UIColor = UIColor(red: 255/255, green: 159/255, blue: 79/255, alpha: 1)
    static let customWhite: UIColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
    
    //Ключи
    enum Key {
        case create
        case rework
    }
}
