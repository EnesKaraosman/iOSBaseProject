//
//  ColorPicker.swift
//  BaseProject
//
//  Created by Enes Karaosman on 3.03.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import SwiftTheme

enum GlobalPicker {
    static let backgroundColor: ThemeColorPicker = ["#fff", "#292b38"]
    static let textColor: ThemeColorPicker = ["#000", "#ECF0F1"]
    
    static let barTextColors = ["#FFF", "#FFF"]
    static let barTextColor = ThemeColorPicker.pickerWithColors(barTextColors)
    static let barTintColor: ThemeColorPicker = ["#DDDDDD", "#01040D"]
    static let statusBarStyle: ThemeStatusBarStylePicker = [.default, .lightContent]
}
