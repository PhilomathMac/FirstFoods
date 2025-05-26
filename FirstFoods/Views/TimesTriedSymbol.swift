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
    
    var body: some View {
        Image(systemName: symbolName)

    }
}

#Preview {
    TimesTriedSymbol(timesTried: 0)
}

#Preview {
    TimesTriedSymbol(timesTried: 1)
}

#Preview {
    TimesTriedSymbol(timesTried: 2)
}

#Preview {
    TimesTriedSymbol(timesTried: 3)
}
