//
//  AvatarView.swift
//  DubDubGrub
//
//  Created by Vitali Kupratsevich on 15.12.24.
//

import SwiftUI

struct AvatarView: View {
    var size: CGFloat
    var body: some View {
        Image("default-avatar")
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .clipShape(Circle())
    }
}

#Preview {
    AvatarView(size: 90)
}
