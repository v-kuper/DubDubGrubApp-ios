//
//  LocationDetailView.swift
//  DubDubGrub
//
//  Created by Vitali Kupratsevich on 11.12.24.
//

import SwiftUI

struct LocationDetailView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack (spacing: 16) {
            BannerImageView(imageName: "default-banner-asset")
            
            HStack{
                AddressView(address: "123 Main Street")
                Spacer()
            }
            .padding(.horizontal)
        
            DescriptionView(text: "This is a description of the location that will be displayed here in detail view of the app when tapped on the location card. This is a description of the location that will be displayed here in detail view of the app when tapped on the location card.")
            
            ZStack {
                Capsule()
                    .frame(height: 80)
                    .foregroundColor(Color(.secondarySystemBackground))
                
                HStack(spacing: 20) {
                    Button {
                        
                    } label: {
                        LocationActionButton(color: .brandPrimary, imageName: "location.fill")
                    }
                    Link(destination: URL(filePath: "https://www.apple.com")!, label: {
                        LocationActionButton(color: .brandPrimary, imageName: "network")
                    })
                    Button {
                        
                    } label: {
                        LocationActionButton(color: .brandPrimary, imageName: "phone.fill")
                    }
                    Button {
                        
                    } label: {
                        LocationActionButton(color: .brandPrimary, imageName: "person.fill.checkmark")
                    }
                }
            }
            .padding(.horizontal)
            
            Text("Who's Here?")
                .bold()
                .font(.title2)
            
            ScrollView {
                LazyVGrid(
                    columns: columns,
                    content: {
                        FirstNameAvatarView(firstName: "Sean")
                        FirstNameAvatarView(firstName: "Kelly")
                        FirstNameAvatarView(firstName: "Test name")
                        FirstNameAvatarView(firstName: "Test name")
                        FirstNameAvatarView(firstName: "Test name")
                        FirstNameAvatarView(firstName: "Test name")
                    })
            }
            Spacer()
        }
        .navigationTitle("Location name")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        LocationDetailView()
    }
}

struct LocationActionButton: View {
    
    var color: Color
    var imageName: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color)
                .frame(width: 60, height: 60)
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: 22, height: 22)
        }
    }
}

struct FirstNameAvatarView: View {
    var firstName: String
    var body: some View {
        VStack {
            AvatarView(size: 64)
            Text(firstName)
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.75)
        }
    }
}

struct BannerImageView: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(height: 120)
    }
}

struct AddressView: View {
    var address: String
    var body: some View {
        Label(address, systemImage: "mappin.and.ellipse")
            .font(.caption)
            .foregroundColor(.secondary)
    }
}

struct DescriptionView: View {
    var text: String
    var body: some View {
        Text(text)
            .lineLimit(3)
            .minimumScaleFactor(0.75)
            .frame(height: 70)
            .padding(.horizontal)
    }
}
