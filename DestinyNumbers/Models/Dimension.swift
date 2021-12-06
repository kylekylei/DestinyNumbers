//
//  Dimension.swift
//  DestinyNumbers
//
//  Created by Kyle Lei on 2021/12/1.
//

import Foundation
import UIKit

class Dimension {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let buttonHeight: CGFloat = 48
    let defaultPadding: CGFloat = 32
    let bottomPadding: CGFloat = 72
    
    var width: CGFloat {
        screenWidth - defaultPadding * 2
    }
    var buttonY: CGFloat {
        screenHeight - bottomPadding - buttonHeight
    }
}
