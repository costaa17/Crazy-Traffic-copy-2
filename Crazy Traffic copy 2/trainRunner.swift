//
//  trainRunner.swift
//  Crazy Traffic copy 2
//
//  Created by Ana Vitoria do Valle Costa on 3/31/16.
//  Copyright © 2016 Ana Vitoria do Valle Costa. All rights reserved.
//

import Foundation
import SpriteKit
class trainRunner {
    static func runTrains(scene: SKScene){
        
        for  i in 0...ReadData.paths.count - 1{
            let path = ReadData.paths[i]["points"] as! [[CGPoint]]
            if let remainingTime = ReadData.paths[i]["remainingTime"]{
                
                if (remainingTime as! UInt32) <= 0{
                    newCar(scene, path: Useful.buildCGPath(path))
                    ReadData.paths[i]["remainingTime"] = Useful.random(100,max: 450)
                }else{
                    ReadData.paths[i]["remainingTime"] = remainingTime as! UInt32 - 1
                    ReadData.paths[i]["remainingTime"] =  UInt32(0)
                }
            }else{
                addGarbage(scene, location: path[0][0])
            }
        }
    }

    static func newCar(scene: SKScene, path: CGPath){
        // set up texture, physics, name, speed, type and add to scene
        let car = Train(scene: scene, type: Type.road)
        scene.addChild(car)
        car.startAction(path, speed: 10)
    }
    
    static func newPerson(scene: SKScene){
        // set up texture, physics, name, speed, type and add to scene
    }
    
    static func newTrain(scene: SKScene){
        // set up texture, physics, name, speed, type, random num of cars and add to scene
    }
    
    static func addGarbage(scene: SKScene, location: CGPoint){
        // random type in random location
    }
}