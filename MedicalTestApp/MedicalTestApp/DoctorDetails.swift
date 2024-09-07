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
    }
}

//MARK: - SubViews
extension DoctorDetails {
    private func headerView() -> some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "chevron.backward")
                    .headerImage()
            }
            
            Spacer()
            
            Text("Dr. Randy Wigham")
                .font(.title2)
                .fontWeight(.semibold)
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "ellipsis")
                    .headerImage()
            }
        }
    }
    
    private func doctorProfile() -> some View {
        HStack(alignment: .center) {
            CustomAsyncImage(
                imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH8EPl9l4DGlpG72PLVF8OSWVM3zhvXxk1Iw&s",
                dimension: 80,
                placeholder: "person"
            )
            
            VStack (alignment: .leading) {
                Text("Dr. Randy Wigham")
                    .bold()
                Spacer()
                Text("General | RSUD Gatot Subroto")
                    .font(.subheadline)
                    .foregroundStyle(Color.gray)
                Spacer()
                HStack(alignment: .center) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("4.9 (4,231 Review)")
                        .foregroundColor(.secondary)
                }.font(.caption)
            }
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "text.bubble")
                    .resize(to: 20)
            }
        }
        .frame(height: 80)
        .frame(maxWidth: .infinity)
    }
    
    private func selectionButtons() -> some View {
        HStack(spacing: 0) {
            CustomTabButton(selectedItem: $selectedTab, text: "About", currentSelection: 0)
            CustomTabButton(selectedItem: $selectedTab, text: "Location", currentSelection: 1)
            CustomTabButton(selectedItem: $selectedTab, text: "Reviews", currentSelection: 2)
        }.padding(.vertical, 20)
    }
    
    private func overview() -> some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("About Me")
                    .bold()
                    .padding(.vertical, 8)
                
                Text("Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Working Time")
                    .bold()
                    .padding(.vertical, 8)
                
                Text("Monday - Friday, 08.00 AM - 20.00 PM")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("STR")
                    .bold()
                    .padding(.vertical, 8)
                
                Text("4726482464")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Pengalaman Praktik")
                    .bold()
                    .padding(.vertical, 8)
                
                Text("RSPAD Gatot Soebroto")
                    .font(.subheadline)
                
                Text("2017 - sekarang")
                    .font(.subheadline)
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
        Button("Make An Appointment") {
            print("Make An Appointment")
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
