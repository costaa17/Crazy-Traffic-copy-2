//
//  ContactTypeTest.swift
//  Crazy Traffic copy 2
//
//  Created by Ana Vitoria do Valle Costa on 3/27/16.
//  Copyright © 2016 Ana Vitoria do Valle Costa. All rights reserved.
//

import Foundation
import SpriteKit

enum ContactType{
    case useless // 2 people or 2 icars
    case crash
    case train_iCar
    case iCar_train
}

class ContactTypeTest{
    
    static func contactTypeTest(contact: SKPhysicsContact) -> ContactType{
        if contact.bodyA.categoryBitMask == TrainRunner.carCategory && contact.bodyB.categoryBitMask == TrainRunner.carCategory{
            return ContactType.crash
        }
        return ContactType.useless
    }
    
}