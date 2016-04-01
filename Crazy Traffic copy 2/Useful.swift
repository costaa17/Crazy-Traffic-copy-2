//
//  Useful.swift
//  Crazy Traffic copy 2
//
//  Created by Ana Vitoria do Valle Costa on 3/31/16.
//  Copyright © 2016 Ana Vitoria do Valle Costa. All rights reserved.
//

import Foundation
import SpriteKit


class Useful{
    static func centerPoint(myPoint: CGPoint) -> CGPoint{
        let point = pointFromIndex(myPoint)
        return CGPointMake((floor(point.x / ReadData.tileWidth!) * ReadData.tileWidth!) + ReadData.tileWidth!, (floor(point.y / ReadData.tileHeight!) * ReadData.tileHeight!) + ReadData.tileHeight!)
    }
    static func pointFromIndex(point: CGPoint) -> CGPoint{
        return CGPointMake(point.x * ReadData.tileWidth!, point.y * ReadData.tileHeight!)
    }
    
    static func randomColor() -> UIColor{
        let colorNum = arc4random_uniform(6)
        switch colorNum{
        case 0: return UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0)
        case 1: return UIColor.greenColor()
        case 2: return UIColor.redColor()
        case 3: return UIColor.orangeColor()
        case 4: return UIColor.yellowColor()
        case 5: return UIColor(red: 1.0, green: 122/255, blue: 1.0, alpha: 1.0)
        default: return UIColor.redColor()
            
        }
    }
    
    static func random(min: UInt32, max: UInt32) -> UInt32 {
        
        let range = UInt32(min)...UInt32(max)
        return range.startIndex + arc4random_uniform(range.endIndex - range.startIndex + 1 )
        
    }
    
    static func buildCGPath(curves: [[CGPoint]]) -> CGPath{
        let myPath = CGPathCreateMutable()
        for curve in curves{
            if curve.count == 2 {
                // Draw a straight line
                //if path[0] == a {
                CGPathMoveToPoint ( myPath , nil, Useful.centerPoint(curve[0]).x, Useful.centerPoint(curve[0]).y )
                //}
                CGPathAddLineToPoint( myPath, nil, Useful.centerPoint(curve[1]).x, Useful.centerPoint(curve[1]).y )
                
            }else if curve.count == 3 {
                // Draw curve with 3 points
                //if path[0] == a {
                CGPathMoveToPoint( myPath , nil, Useful.centerPoint(curve[0]).x, Useful.centerPoint(curve[0]).y )
                //}
                CGPathAddCurveToPoint( myPath, nil, Useful.centerPoint(curve[2]).x, Useful.centerPoint(curve[2]).y, Useful.centerPoint(curve[1]).x, Useful.centerPoint(curve[1]).y,Useful.centerPoint(curve[1]).x, Useful.centerPoint(curve[1]).y )
                
            }else if curve.count == 4 {
                // Draw curve with 4 points
                //if path[0] == a {
                CGPathMoveToPoint( myPath , nil, Useful.centerPoint(curve[0]).x, Useful.centerPoint(curve[0]).y )
                //}
                CGPathAddCurveToPoint( myPath, nil, Useful.centerPoint(curve[2]).x, Useful.centerPoint(curve[2]).y, Useful.centerPoint(curve[3]).x, Useful.centerPoint(curve[3]).y,Useful.centerPoint(curve[1]).x, Useful.centerPoint(curve[1]).y )
            }
        }
        return myPath
    }

}