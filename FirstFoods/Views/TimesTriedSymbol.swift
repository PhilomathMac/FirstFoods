//
//  TimesTriedSymbol.swift
//  FirstFoods
//
//  Created by McKenzie Macdonald on 5/26/25.
//

import SwiftUI

struct TimesTriedSymbol: View {
    
    var timesTried: Int
    var symbolName: String {
        switch timesTried {
        case 0:
            return "gauge.with.dots.needle.bottom.0percent"
        case 1:
            return "gauge.with.dots.needle.bottom.50percent"
        case 2:
            return "gauge.with.dots.needle.bottom.100percent"
        default:
            return "checkmark.seal"
        }
    }
    var symbolColor: Color {
        switch timesTried {
        case 0:
            return .red
        case 1:
            return .orange
        case 2:
            return .yellow
        default:
            return .green
        }
    }
    
    var body: some View {
        Image(systemName: symbolName).foregroundStyle(symbolColor)

    }
}

#Preview {
    HStack {
        TimesTriedSymbol(timesTried: 0)
        TimesTriedSymbol(timesTried: 1)
        TimesTriedSymbol(timesTried: 2)
        TimesTriedSymbol(timesTried: 3)
    }
}
