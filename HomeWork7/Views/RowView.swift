//
//  RowView.swift
//  HomeWork7
//
//  Created by Vitaliy Voronok on 29.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct RowView: View {
    var name: String
    @Binding var value: TimeInterval
    
    private var timeNumberFormatter: NumberFormatter = {
        var formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        let digits = 6
        formatter.minimumFractionDigits = digits
        formatter.maximumFractionDigits = digits
        return formatter
    }()
    
    public init(name: String, value: Binding<TimeInterval>) {
        self.name = name
        self._value = value
    }
    
    var body: some View {
        HStack(spacing: 20.0) {
            Text(self.name)
            Spacer()
            Text("\(formattedTime(value) ?? "Undefine")")
        }
    }
    
    private func formattedTime(_ time: TimeInterval) -> String? {
        return timeNumberFormatter.string(from: time as NSNumber)
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(name: "Test", value: .constant(10.0))
    }
}
