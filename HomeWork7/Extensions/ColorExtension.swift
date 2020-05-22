//
//  ColorExtension.swift
//  HomeWork7
//
//  Created by Vitaliy Voronok on 22.05.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

extension Color {
    public static func getColorOfPercent(_ t: Double) -> Color {
        let fromR:Double  = 0;
        let fromG:Double  = 1.0;
        let fromB:Double  = 0;
        
        let toR:Double    = 1.0;
        let toG:Double    = 0.0;
        let toB:Double    = 0.0;
        
        let deltaR = round(Double((toR - fromR)))
        let deltaG = round(Double((toG - fromG)))
        let deltaB = round(Double((toB - fromB)))
        
        let R = fromR + t * deltaR
        let G = fromG + t * deltaG
        let B = fromB + t * deltaB

        return Color(red: R, green: G, blue: B)
    }
}
