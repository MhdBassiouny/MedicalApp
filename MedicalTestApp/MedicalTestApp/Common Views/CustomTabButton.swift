//
//  CustomTabButton.swift
//  MedicalTestApp
//
//  Created by Muhammad Bassiouny on 31/08/2024.
//

import SwiftUI

struct CustomTabButton: View {
    @Binding var selectedItem: Int
    let text: String
    let currentSelection: Int
    
    var body: some View {
        Button(action: {
            selectedItem = currentSelection
        }) {
            VStack {
                Text(text)
                    .font(.headline)
                    .foregroundStyle(selectedItem == currentSelection ? Color.blue : Color.gray)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)

                Divider()
                    .frame(height:selectedItem == currentSelection ? 3 : 1)
                    .background(selectedItem == currentSelection ? Color.blue : Color.gray)
            }
        }    }
}

#Preview {
    CustomTabButton(selectedItem: .constant(0), text: "Reviews", currentSelection: 0)
}
