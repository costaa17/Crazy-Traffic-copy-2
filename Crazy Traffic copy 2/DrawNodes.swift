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
    static let tutorialShapeN = SKShapeNode()

    static func drawPlayButton(scene: SKScene, big: Bool){
        var clippath = CGPathCreateWithRoundedRect (CGRectMake(0,0,175,50), 10.0, 10.0, nil)
        if(big){
            clippath = CGPathCreateWithRoundedRect (CGRectMake(0,0,350,100), 10.0, 10.0, nil)
        }
        let button = SKEffectNode()
        let playB = SKShapeNode()
        playB.path = clippath
        playB.strokeColor = UIColor.blackColor()
        playB.fillColor = UIColor.whiteColor()
        playB.lineWidth = 5
        playB.position = CGPointMake(CGRectGetMidX(scene.frame), CGRectGetMidY(scene.frame))
        let playDraw = SKShapeNode()
        let play = CGPathCreateMutable()
        if(big){
            CGPathMoveToPoint ( play , nil, 0, 0 )
            CGPathAddLineToPoint( play, nil, 0, 70 )
            CGPathAddLineToPoint( play, nil, 50, 35 )
            CGPathAddLineToPoint( play, nil, 0, 0 )
        }else{
            CGPathMoveToPoint ( play , nil, 0, 0 )
            CGPathAddLineToPoint( play, nil, 0, 35 )
            CGPathAddLineToPoint( play, nil, 25, 17.5 )
            CGPathAddLineToPoint( play, nil, 0, 0 )

        }
        playDraw.path = play
        playDraw.strokeColor = UIColor.blackColor()
        playDraw.fillColor = UIColor.greenColor()
        playDraw.lineWidth = 3
        playDraw.position = CGPointMake(CGRectGetMidX(scene.frame), CGRectGetMidY(scene.frame))
        let texture = scene.view!.textureFromNode(playB)
        let sprite = SKSpriteNode(texture: texture)
        let texture2 = scene.view!.textureFromNode(playDraw)
        let sprite2 = SKSpriteNode(texture: texture2)
        button.addChild(sprite)
        button.addChild(sprite2)
        button.shouldRasterize = true
        let texture3 = scene.view!.textureFromNode(button)
        playButton = SKSpriteNode(texture: texture3)
        sprite.removeFromParent()
        sprite2.removeFromParent()
        playButton.name = "playButton"
        playButton.position = CGPointMake(CGRectGetMidX(scene.frame), CGRectGetMidY(scene.frame) - 100)
        if(big){
            playButton.position = CGPointMake(CGRectGetMidX(scene.frame), CGRectGetMidY(scene.frame))
        }
        scene.addChild(playButton)
    }
    
    static func drawBlackBackgroud(scene: SKScene){
        let myPath = CGPathCreateMutable()
        CGPathMoveToPoint(myPath, nil, 0, 0)
        CGPathAddLineToPoint(myPath, nil, 0, CGRectGetMaxY(scene.frame))
        CGPathAddLineToPoint(myPath, nil, CGRectGetMaxX(scene.frame), CGRectGetMaxY(scene.frame))
        CGPathAddLineToPoint(myPath, nil, CGRectGetMaxX(scene.frame), 0)
        CGPathCloseSubpath(myPath)
        tutorialShapeN.path = myPath
        tutorialShapeN.fillColor = UIColor.blackColor()
        tutorialShapeN.strokeColor = UIColor.blackColor()
        scene.addChild(tutorialShapeN)

    }
    
    static func drawScoreLabel(scene: SKScene){
        scoreLabel.text = "Score: " + "0"
        scoreLabel.fontSize = 20
        scoreLabel.position = CGPoint(x:CGRectGetMaxX(scene.frame) - 100, y:CGRectGetMaxY(scene.frame) - 50)
        scene.addChild(scoreLabel)
        
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