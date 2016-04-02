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
    static let gameOverLabel = SKLabelNode(fontNamed:"Chalkduster")
    static let tutorialShapeN = SKShapeNode()
    
    
    static func drawPlayButton(scene: SKScene, big: Bool){
        var clippath = CGPathCreateWithRoundedRect (CGRectMake(0,0,175,50), 10.0, 10.0, nil)
        if(big){
            clippath = CGPathCreateWithRoundedRect (CGRectMake(0,0,350,100), 10.0, 10.0, nil)
        }
        let button = SKEffectNode()
        let playB = SKShapeNode()
        playB.path = clippath
        playB.strokeColor = UIColor.whiteColor()
        playB.fillColor = UIColor.blackColor()
        playB.lineWidth = 8
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
        playDraw.strokeColor = UIColor.whiteColor()
        playDraw.fillColor = UIColor.blackColor()
        playDraw.lineWidth = 5
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
    
    static func drawGameOverLabel(scene: SKScene){
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 50
        gameOverLabel.position = CGPoint(x:CGRectGetMidX(scene.frame), y:CGRectGetMidY(scene.frame) + 100)
        scene.addChild(gameOverLabel)
    }
    
    static func drawPaths(scene: SKScene) {
        if let path = NSBundle.mainBundle().pathForResource("test", ofType:"json") {
            ReadData.readData(path)
        }
        
        for path in ReadData.paths{
            if path["type"] as! Type != Type.garbage{
                // build CGPath
                let curves = path["points"] as! [[CGPoint]]
                let myPath = Useful.buildCGPath(curves) // CGPath
                
                switch path["type"] as! Type{
                
                case Type.road:
                    let myShapeNode = SKShapeNode()
                    myShapeNode.path = myPath
                    myShapeNode.lineWidth = 53
                    myShapeNode.strokeColor = UIColor.whiteColor()
                    scene.addChild(myShapeNode)
                    
                case Type.rail:
                    //add wood part
                    let myShapeNode = SKShapeNode()
                    myShapeNode.path = myPath
                    myShapeNode.lineWidth = 20
                    let myDashedPath = CGPathCreateCopyByDashingPath(myShapeNode.path, nil, 0, [5.0,5.0], 2)
                    myShapeNode.strokeColor = UIColor(red: 102/255.0, green: 51/255.0, blue: 0.0, alpha: 1.0)//brown
                    myShapeNode.path = myDashedPath
                    scene.addChild(myShapeNode)
                    
                    //add steel part
                    let myShapeNode2 = SKShapeNode()
                    myShapeNode2.path = myPath
                    let myShapeNodeOutP = SKShapeNode()
                    myShapeNodeOutP.strokeColor = UIColor(red: 180/255.0, green: 180/255.0, blue: 180/255, alpha: 1.0) // gray
                    let outPath = CGPathCreateCopyByStrokingPath(myShapeNode2.path, nil, 10, CGLineCap.Round , CGLineJoin.Round, 0)
                    myShapeNodeOutP.path = outPath
                    myShapeNodeOutP.lineWidth = 2
                    scene.addChild(myShapeNodeOutP)
                    
                case Type.walk:
                    let myShapeNode = SKShapeNode()
                    myShapeNode.path = myPath
                    myShapeNode.lineWidth = 15
                    myShapeNode.strokeColor = UIColor(red: 167/255.0, green: 125/255.0, blue: 73/255, alpha: 1.0)//brown
                    scene.addChild(myShapeNode)
                    
                case Type.cross:
                    let myShapeNode = SKShapeNode()
                    myShapeNode.path = myPath
                    myShapeNode.lineWidth = 30
                    let myDashedPath = CGPathCreateCopyByDashingPath(myShapeNode.path, nil, 0, [7.0,7.0], 2)
                    myShapeNode.strokeColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)//brown
                    myShapeNode.path = myDashedPath
                    scene.addChild(myShapeNode)

                default:
                    break

                }
            }
        }   
    }
    
    
    static func drawCar(scene: SKScene)-> SKSpriteNode{
        let i = Useful.random(0, max: 1)
        var carColor = UIColor.blackColor()
        var topColor = UIColor.blackColor()
        
        if(i == 0){
            carColor = UIColor.whiteColor()
        }else{
            topColor = UIColor.whiteColor()
        }
        let carEffectNode =  SKEffectNode()
        let carPath = CGPathCreateWithRoundedRect (CGRectMake(10,0,90,160), 40.0, 40.0, nil)
        let car = SKShapeNode()
        car.path = carPath
        car.fillColor = carColor
        car.lineWidth = 8
        car.strokeColor = UIColor.blackColor()
        carEffectNode.addChild(car)
        
        let topPath = CGPathCreateWithRoundedRect (CGRectMake(20,15,70,80), 20.0, 20.0, nil)
        let top = SKShapeNode()
        top.path = topPath
        top.fillColor = topColor
        top.strokeColor = UIColor.blackColor()
        carEffectNode.addChild(top)
        
        let wheelPath = CGPathCreateWithRoundedRect (CGRectMake(0,25,16,30), 7.0, 7.0, nil)
        let wheel = SKShapeNode()
        wheel.path = wheelPath
        wheel.fillColor = UIColor.blackColor()
        wheel.strokeColor = UIColor.blackColor()
        carEffectNode.addChild(wheel)
        
        let wheel2Path = CGPathCreateWithRoundedRect (CGRectMake(94,25,16,30), 7.0, 7.0, nil)
        let wheel2 = SKShapeNode()
        wheel2.path = wheel2Path
        wheel2.fillColor = UIColor.blackColor()
        wheel2.strokeColor = UIColor.blackColor()
        carEffectNode.addChild(wheel2)
        
        let wheel3Path = CGPathCreateWithRoundedRect (CGRectMake(0,95,16,30), 7.0, 7.0, nil)
        let wheel3 = SKShapeNode()
        wheel3.path = wheel3Path
        wheel3.fillColor = UIColor.blackColor()
        wheel3.strokeColor = UIColor.blackColor()
        carEffectNode.addChild(wheel3)
        
        let wheel4Path = CGPathCreateWithRoundedRect (CGRectMake(94,95,16,30), 7.0, 7.0, nil)
        let wheel4 = SKShapeNode()
        wheel4.path = wheel4Path
        wheel4.fillColor = UIColor.blackColor()
        wheel4.strokeColor = UIColor.blackColor()
        carEffectNode.addChild(wheel4)
        
        
        carEffectNode.xScale = 0.6
        carEffectNode.yScale = 0.6
        carEffectNode.shouldRasterize = true
        
        let texture = scene.view!.textureFromNode(carEffectNode)
        let carSpriteNode = SKSpriteNode(texture: texture)
        
        
        return carSpriteNode
        
    
    }

}