//
//  Console.swift
//  Console Retro
//
//  Created by Ringa - mac mini 2 on 20/12/18.
//  Copyright © 2018 Ringa - mac mini 2. All rights reserved.
//

import UIKit

struct RGB {
    var red:CGFloat = 0
    var blue:CGFloat = 0
    var green:CGFloat = 0
    
    enum RGB_LIMITS:CGFloat{
        case INF = 0
        case SUP = 1
    }
    
    private let RGB_MAX_VALUE:CGFloat = 255
    
    init(red:CGFloat,green:CGFloat,blue:CGFloat) {
        self.red = red/RGB_MAX_VALUE
        self.blue = blue/RGB_MAX_VALUE
        self.green = green/RGB_MAX_VALUE
    }
    func isValid() -> Bool{
        return (red >= RGB_LIMITS.INF.rawValue && red <= RGB_LIMITS.SUP.rawValue &&
            blue >= RGB_LIMITS.INF.rawValue && blue <= RGB_LIMITS.SUP.rawValue &&
            green >= RGB_LIMITS.INF.rawValue && green <= RGB_LIMITS.SUP.rawValue)
    }
}

class Console {

    var name:String
    var image:UIImage?
    var color:UIColor
    var start:Int
    var end:Int
    var desc:String
    
    init(name:String, start:Int, end:Int, rgb:[CGFloat], desc:String) {
        self.name = name
        self.image = UIImage(named: name + ".png")
        self.start = start
        self.end = end
        self.desc = desc
        self.color = UIColor.lightGray
        if rgb.count == 3 {
            self.color = colorFrom(colorParams: RGB(red:rgb[0],green:rgb[1],blue:rgb[2]))
        }
    }
    
    private func colorFrom(colorParams:RGB) -> UIColor{
        if(colorParams.isValid()){
            return UIColor(red: colorParams.red,
                           green: colorParams.green, blue: colorParams.blue, alpha: 0.5)
        }
        else { return UIColor.black }
    }
    
    func lifeCycle() -> String {
        return "Debut: \(start) - Fin: \(end)"
    }
}
