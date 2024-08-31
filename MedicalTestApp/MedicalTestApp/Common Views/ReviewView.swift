//
//  ReviewView.swift
//  MedicalTestApp
//
//  Created by Muhammad Bassiouny on 31/08/2024.
//

import SwiftUI

struct ReviewView: View {
    var rating: Int
    var name: String
    var comment: String
    var imageName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.headline)
                    HStack {
                        ForEach(1...5, id: \.self) { index in
                            Image(systemName: "star.fill")
                                .foregroundColor(index <= rating ? .yellow : .gray)
                        }
                    }
                }
                Spacer()
            }
            
            Text(comment)
                .font(.body)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
