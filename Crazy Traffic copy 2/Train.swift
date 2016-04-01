//
//  Train.swift
//  Crazy Traffic copy 2
//
//  Created by Ana Vitoria do Valle Costa on 3/27/16.
//  Copyright © 2016 Ana Vitoria do Valle Costa. All rights reserved.
//

import Foundation
import SpriteKit

class Train: SKSpriteNode {
    var type = Type.road
    var path: CGPath?
    var carSpeed: CGFloat = 0
    
    init(scene: SKScene, type: Type){
        super.init(texture: DrawNodes.drawCar(scene).texture, color: UIColor.whiteColor(), size: DrawNodes.drawCar(scene).texture!.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAction(path: CGPath, speed: CGFloat){
        self.carSpeed = speed
        self.path = path
        self.size = CGSizeMake(self.size.width/2, self.size.height/2)
        
        self.runAction(SKAction.followPath(path, asOffset:false, orientToPath:true, speed: carSpeed), withKey: "moving")
        
        let movingAction = self.actionForKey("moving")
        movingAction?.speed = carSpeed
        
    }

    
}