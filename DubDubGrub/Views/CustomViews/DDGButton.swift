//
//  DDGButton.swift
//  DubDubGrub
//
//  Created by Vitali Kupratsevich on 15.12.24.
//

import SwiftUI

struct DDGButton: View {
    var title: String
    var body: some View {
        Text(title)
            .bold()
            .frame(width: 200, height: 44)
            .background(Color.brandPrimary)
            .foregroundColor(Color.white)
            .cornerRadius(8)
    }
}

#Preview {
    DDGButton(title: "Button")
}
