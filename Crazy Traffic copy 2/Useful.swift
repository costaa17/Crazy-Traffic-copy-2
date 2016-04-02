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
    
    static func random(min: UInt32, max: UInt32) -> UInt32 {
        
        let range = UInt32(min)...UInt32(max - 1)
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