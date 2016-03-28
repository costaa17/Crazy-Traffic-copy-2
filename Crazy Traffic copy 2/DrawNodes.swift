//
//  DrawNodes.swift
//  Crazy Traffic copy 2
//
//  Created by Ana Vitoria do Valle Costa on 3/27/16.
//  Copyright © 2016 Ana Vitoria do Valle Costa. All rights reserved.
//

import Foundation
import SpriteKit


class DrawNodes{
    
    static var playButton = SKSpriteNode()
    static var blackBackground = SKShapeNode()
    
    static let scoreLabel = SKLabelNode(fontNamed:"Chalkduster")
    static let highScoreLabel = SKLabelNode(fontNamed:"Chalkduster")
    static let goalLabel = SKLabelNode(fontNamed:"Chalkduster")
    static let specialGoalLabel = SKLabelNode(fontNamed:"Chalkduster")


    static func drawPlayButton(scene: SKScene){
    
    }
    
    static func drawBlackBackgroud(scene: SKScene){
    
    }
    
    static func drawScoreLabel(scene: SKScene){
    
    }
    
    static func drawHighScoreLabel(scene: SKScene){
    
    }
    
    static func drawGoalLabel(scene: SKScene){
    
    }
    
    static func drawSpecialGoalLabel(scene: SKScene){
        
    }
    
    static func drawPaths(pathsArray: [String: AnyObject], scene: SKScene) {
       
    }
    
    static func newCar(scene: SKScene){
        // set up texture, physics, name, speed, type and add to scene
    }
    
    static func newPerson(scene: SKScene){
        // set up texture, physics, name, speed, type and add to scene
    }
    
    static func newTrain(scene: SKScene){
        // set up texture, physics, name, speed, type, random num of cars and add to scene
    }
    
    static func addGarbage(scene: SKScene){
        // random type in random location
    }
}