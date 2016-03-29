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

}

class ReadData {
    
    static var paths = [String: Any]()
    static var tileWidth: CGFloat?
    static var tileHeight: CGFloat?
    
    static func readData(filePath: String){
        var points: [CGPoint] = []
        var pathArray: [[CGPoint]] = []
        
        do {
            let contents = try NSString(contentsOfFile: filePath, usedEncoding: nil) as String
            
            if let data = contents.dataUsingEncoding(NSUTF8StringEncoding) {
                do {
                    let dic = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String: AnyObject]
                    let pathsArray = dic!["paths"]// array of dictionaries
                    for path in pathsArray as! NSArray{
                        path.valueForKey("points")
                        let pointsArray = path.valueForKey("points") as! NSArray // array of CGPoint arrays
                        for curve in pointsArray{
                            for p in curve as! NSArray{
                                
                                let point = p as! NSArray
                                let flx = CGFloat(point[0].floatValue)
                                let fly = CGFloat(point[1].floatValue)
                                let screenSize = UIScreen.mainScreen().bounds
                                tileWidth = screenSize.width/((path.valueForKey("cols") as! CGFloat))
                                tileHeight = screenSize.height/((path.valueForKey("rows") as! CGFloat))
                                points.append(CGPointMake(flx  * CGFloat(tileWidth!), fly * CGFloat(tileHeight!)))
                               
                                
                            }
                            pathArray.append(points)
                            points = []
                        }
                        
                        let typeString = path.valueForKey("Type")
                        
                        switch typeString as! String{
                        case "road":
                            paths["type"] = "road"
                        case "rail":
                            paths["type"] = "rail"
                        case "walk":
                            paths["type"] = "walk"
                        case "cross":
                            paths["type"] = "cross"
                        case "crazyPedestrian":
                            paths["type"] = "crazyPedestrian"
                        case "garbage":
                            paths["type"] = "garbage"
                        default: break
                            
                        }
                        
                        paths["points"] = pathArray

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