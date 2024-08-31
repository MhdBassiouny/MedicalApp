//
//  ContentView.swift
//  MedicalApp
//
//  Created by Muhammad Bassiouny on 27/08/2024.
//

import SwiftUI

struct DoctorDetails: View {
    @State private var selectedTab: Int = 0
    
    
    
    var body: some View {
        VStack {
            headerView()
            doctorProfile()
            selectionButtons()
            if selectedTab == 0 {
                overview()
            } else if selectedTab == 1 {
                VStack {
                    Text("Map")
                    Spacer()
                }
            } else if selectedTab == 2 {
                reviewsList()
            }
            appointmentButton()
        }
        .padding()
        .navigationTitle("Andy Wain")
    }
}

extension DoctorDetails {
    private func headerView() -> some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "chevron.backward")
                    .headerImage()
            }
            
            Spacer()
            
            Text("Andy Wain")
                .font(.title)
                .bold()
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "ellipsis")
                    .headerImage()
            }
        }
    }
    
    private func doctorProfile() -> some View {
        HStack(alignment: .top, spacing: 16) {
            CustomAsyncImage(
                imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH8EPl9l4DGlpG72PLVF8OSWVM3zhvXxk1Iw&s",
                dimension: 80,
                placeholder: "person"
            )
            
            VStack (alignment: .leading) {
                Text("Andy Wain")
                    .font(.title2)
                    .bold()
                
                Text("General | RSUD Gatot Subroto")
                
                HStack(alignment: .center) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("4.9 (4,231 Review)")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
        }
        .frame(height: 80)
        .frame(maxWidth: .infinity)
    }
    
    private func selectionButtons() -> some View {
        HStack(spacing: 0) {
            CustomTabButton(selectedItem: $selectedTab, text: "Overview", currentSelection: 0)
            CustomTabButton(selectedItem: $selectedTab, text: "Details", currentSelection: 1)
            CustomTabButton(selectedItem: $selectedTab, text: "Reviews", currentSelection: 2)
        }
    }
    
    private func overview() -> some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("About Me")
                    .font(.title3)
                    .bold()
                    .padding(.vertical, 8)
                
                Text("Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation.")
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Text("Working Time")
                    .font(.title3)
                    .bold()
                    .padding(.vertical, 8)
                
                Text("Monday - Friday, 08.00 AM - 20.00 PM")
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Text("STR")
                    .font(.title3)
                    .bold()
                    .padding(.vertical, 8)
                
                Text("4726482464")
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Text("Pengalaman Praktik")
                    .font(.title3)
                    .bold()
                    .padding(.vertical, 8)
                
                Text("2017 - sekarang")
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private func reviewsList() -> some View {
        List(reviews) { review in
            ReviewView(
                rating: review.rating,
                name: review.name,
                comment: review.content,
                imageName: review.image
            )
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
    
    private func appointmentButton() -> some View {
        Button("Make Appointment") {
            print("Make Appointment")
        }
        .buttonStyle(SubmitButtonStyle(isValid: true, color: .blue))
    }
    
    
}

#Preview {
    DoctorDetails()
}



struct Review: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let rating: Int
    let content: String
}

let reviews: [Review] = [
    Review(name: "Ali Tarek", image: "person.circle.fill", rating: 4, content: "Good doctor and good listener"),
    Review(name: "Khaled Ahmed", image: "person.circle.fill", rating: 5, content: "The doctor is patient and give a details explaination of the case.")
]
