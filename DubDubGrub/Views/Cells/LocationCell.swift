//
//  LocationCell.swift
//  DubDubGrub
//
//  Created by Vitali Kupratsevich on 15.12.24.
//

import SwiftUI

struct LocationCell: View {
    var body: some View {
        HStack {
            Image("default-square-asset")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .padding(.vertical, 8)
            VStack(alignment: .leading ){
                Text("Test Location Name")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)
                HStack{
                    AvatarView(size: 53)
                    AvatarView(size: 53)
                    AvatarView(size: 53)
                }
            }
            .padding(.leading)
        }
    }
}

#Preview {
    LocationCell()
}
