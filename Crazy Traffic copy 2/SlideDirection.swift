//
//  SlideDirection.swift
//  Crazy Traffic copy 2
//
//  Created by Ana Vitoria do Valle Costa on 3/27/16.
//  Copyright © 2016 Ana Vitoria do Valle Costa. All rights reserved.
//

import Foundation
import SpriteKit

enum SlideDirection{
    case forward
    case backward
    case useless
}

class SDirection{
    
    private func degToRad(degrees: CGFloat) -> CGFloat {
        return 0
    }
    
    private func radToDeg(radians: CGFloat) -> CGFloat {
        return 0
    }
    
    static func getSlideDirection(panAngle: CGFloat, ObjAngle: CGFloat) -> SlideDirection{
        return SlideDirection.useless
    }
    

}