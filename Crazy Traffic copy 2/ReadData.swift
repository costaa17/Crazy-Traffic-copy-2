//
//  ReadData.swift
//  Crazy Traffic copy 2
//
//  Created by Ana Vitoria do Valle Costa on 3/27/16.
//  Copyright © 2016 Ana Vitoria do Valle Costa. All rights reserved.
//

import Foundation
import SpriteKit

enum Type{
    case road
    case rail
    case walk
    case cross
    case crazyPedestrian
    case garbage

}

class ReadData {
    
    static var paths = [Dictionary<String, Any>]()
    static var tileWidth: CGFloat?
    static var tileHeight: CGFloat?
    
    static func readData(filePath: String){
        paths = [Dictionary<String, Any>]()
        
        var points: [CGPoint] = []
        var pathArray: [[CGPoint]] = []
        var thisPath = [String: Any]()
        
        do {
            let contents = try NSString(contentsOfFile: filePath, usedEncoding: nil) as String
            
            if let data = contents.dataUsingEncoding(NSUTF8StringEncoding) {
                do {
                    let dic = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String:AnyObject]
                    let pathsArray = dic!["paths"]// array of dictionaries
                    let screenSize = UIScreen.mainScreen().bounds
                    tileWidth = CGFloat(screenSize.width)/((dic!["cols"] as! CGFloat))
                    tileHeight = CGFloat(screenSize.height)/((dic!["rows"] as! CGFloat))
                    for path in pathsArray as! NSArray{
                        let pointsArray = path.valueForKey("points") as! NSArray // array of CGPoint arrays
                        for curve in pointsArray{
                            for p in curve as! NSArray{
                                
                                let point = p as! NSArray
                                let flx = CGFloat(point[0].floatValue)
                                let fly = CGFloat(point[1].floatValue)
                                points.append(CGPointMake(flx , fly ))
                                
                            }
                            pathArray.append(points)
                            points = []
                        }
                        
                        let typeString = path.valueForKey("Type")
                        
                        switch typeString as! String{
                        case "road":
                            thisPath["type"] = Type.road
                        case "rail":
                            thisPath["type"] = Type.rail
                        case "walk":
                            thisPath["type"] = Type.walk
                        case "cross":
                            thisPath["type"] = Type.cross
                        case "crazyPedestrian":
                            thisPath["type"] = Type.crazyPedestrian
                        case "garbage":
                            thisPath["type"] = Type.garbage
                        default: break
                            
                        }
                        
                        thisPath["points"] = pathArray
                        pathArray = []
                        if thisPath["type"] as! Type != Type.garbage{
                            thisPath["remainingTime"] = Useful.random(100,max: 450)
                        }
                        paths.append(thisPath)
                        thisPath = [String: Any]()

                    }
                    
                }catch{
                    
                }
            }
        } catch let error as NSError {
            Swift.print(error)
            
            // contents could not be loaded
        }
    }
}