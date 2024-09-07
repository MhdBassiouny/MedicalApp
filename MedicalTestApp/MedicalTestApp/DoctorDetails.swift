//
//  ContentView.swift
//  MedicalApp
//
//  Created by Muhammad Bassiouny on 27/08/2024.
//

import SwiftUI

struct DoctorDetails: View {
    let doctor: Doctor
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
            
            Text(doctor.name)
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
                imageURL: doctor.imageurl,
                dimension: 80,
                placeholder: "person"
            )
            
            VStack (alignment: .leading) {
                Text(doctor.name)
                    .bold()
                Spacer()
                Text(doctor.title)
                    .font(.subheadline)
                    .foregroundStyle(Color.gray)
                Spacer()
                HStack(alignment: .center) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text(String(format: "%.2f", doctor.rating) + " (\(doctor.numberOfReviews.formatted(.number)) Review)")
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
                
                Text(doctor.about)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Working Time")
                    .bold()
                    .padding(.vertical, 8)
                
                Text(doctor.workingTime)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("STR")
                    .bold()
                    .padding(.vertical, 8)
                
                Text(doctor.str)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Pengalaman Praktik")
                    .bold()
                    .padding(.vertical, 8)
                
                Text(doctor.details1)
                    .font(.subheadline)
                
                Text(doctor.details2)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private func reviewsList() -> some View {
        List(doctor.reviews) { review in
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
    DoctorDetails(doctor: doctor)
}



