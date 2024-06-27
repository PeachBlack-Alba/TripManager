//
//  BadgeView.swift
//  TripManager
//
//  Created by Alba Torres Rodriguez on 27.06.24.
//

import Foundation
import SwiftUI

struct BadgeView: View {
    var count: Int
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.red)
                .frame(width: 24, height: 24)
            
            Text("\(count)")
                .foregroundColor(.white)
                .font(.system(size: 14))
        }
        .opacity(count > 0 ? 1 : 0)
    }
}
