//
//  CustomAsyncImage.swift
//  Darzy
//
//  Created by Muhammad Bassiouny on 1/17/24.
//

import SwiftUI

struct CustomAsyncImage: View {
    var imageURL: String
    var dimension: CGFloat
    var placeholder: String
    
    var body: some View {
        AsyncImage(
            url: URL(string: imageURL),
            transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))
        ) { phase in
            switch phase {
            case .success(let image):
                image
                    .resize(to: dimension)
                    .transition(.scale)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            case .failure(_):
                Image(systemName: placeholder)
                    .resize(to: dimension)
            case .empty:
                Spacer()
                ProgressView()
                    .scaleEffect(x: 2, y: 2)
                    .frame(width: dimension, height: dimension)
                Spacer()
            @unknown default:
                ProgressView()
            }
        }
    }
}

extension Image {
    func resize(to size: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size, height: size)
    }
    
    func headerImage() -> some View {
        self
            .frame(width: 16, height: 16)
            .padding(6)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 5)
            .foregroundColor(.black)
    }
}
