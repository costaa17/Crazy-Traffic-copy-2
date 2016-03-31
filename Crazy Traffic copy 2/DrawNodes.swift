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
    
    static func drawPaths(scene: SKScene) {
        if let path = NSBundle.mainBundle().pathForResource("test", ofType:"json") {
            ReadData.readData(path)
        }
        for path in ReadData.paths{
            if path["type"] as! Type != Type.garbage{
                // build CGPath
                let curves = path["points"] as! [[CGPoint]]
                let myPath = CGPathCreateMutable()
                for curve in curves{
                    if curve.count == 2 {
                        // Draw a straight line
                        //if path[0] == a {
                        CGPathMoveToPoint ( myPath , nil, centerPoint(curve[0]).x, centerPoint(curve[0]).y )
                        //}
                        CGPathAddLineToPoint( myPath, nil, centerPoint(curve[1]).x, centerPoint(curve[1]).y )
                        
                    }else if curve.count == 3 {
                        // Draw curve with 3 points
                        //if path[0] == a {
                        CGPathMoveToPoint( myPath , nil, centerPoint(curve[0]).x, centerPoint(curve[0]).y )
                        //}
                        CGPathAddCurveToPoint( myPath, nil, centerPoint(curve[2]).x, centerPoint(curve[2]).y, centerPoint(curve[1]).x, centerPoint(curve[1]).y,centerPoint(curve[1]).x, centerPoint(curve[1]).y )
                        
                    }else if curve.count == 4 {
                        // Draw curve with 4 points
                        //if path[0] == a {
                        CGPathMoveToPoint( myPath , nil, centerPoint(curve[0]).x, centerPoint(curve[0]).y )
                        //}
                        CGPathAddCurveToPoint( myPath, nil, centerPoint(curve[2]).x, centerPoint(curve[2]).y, centerPoint(curve[3]).x, centerPoint(curve[3]).y,centerPoint(curve[1]).x, centerPoint(curve[1]).y )
                    }
                }
                // myPath is the CGPath
                switch path["type"] as! Type{
                
                case Type.road:
                    let myShapeNode = SKShapeNode()
                    myShapeNode.path = myPath
                    myShapeNode.lineWidth = 53
                    myShapeNode.strokeColor = UIColor(red: 96/255.0, green: 96/255.0, blue: 96/255.0, alpha: 1.0)//gray
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
    static func centerPoint(myPoint: CGPoint) -> CGPoint{
        let point = pointFromIndex(myPoint)
        return CGPointMake((floor(point.x / ReadData.tileWidth!) * ReadData.tileWidth!) + ReadData.tileWidth!, (floor(point.y / ReadData.tileHeight!) * ReadData.tileHeight!) + ReadData.tileHeight!)
    }
    static func pointFromIndex(point: CGPoint) -> CGPoint{
        return CGPointMake(point.x * ReadData.tileWidth!, point.y * ReadData.tileHeight!)
    }
}