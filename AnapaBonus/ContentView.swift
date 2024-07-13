//
//  ContentView.swift
//  AnapaBonus
//
//  Created by Дмитрий Цепилов on 13.07.2024.
//

import SwiftUI
import MapKit

struct ContentView: View {
    // View Properties
    @State private var showSheet: Bool = false
    @State private var activeTab: Tab = .device
    @State private var ignoreTabBar: Bool = false
    var body: some View {
        ZStack(alignment: .bottom) {
            if #available(iOS 17, *) {
                Map(initialPosition: .region(.applePark))
                
                
            } else {
                Map(coordinateRegion: .constant(.applePark))
            }
            TabBar()
                .frame(height: 49)
                .background(.regularMaterial)
        }
        .task {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 10) {
                    // Text above Image
                    Text(activeTab.displayName)
                        .font(.title2)
                        .foregroundColor(Color(#colorLiteral(red: 0.2823529541, green: 0.2862745225, blue: 0.6156862974, alpha: 1)))
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    // Image with overlay texts
                    ZStack(alignment: .topLeading) {
                        Image("123123") // Replace with your actual image name
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400, height: 200) // Adjust size as needed
                            .cornerRadius(10) // Optional: if you want rounded corners
                        
                        // First overlay text (upper left corner)
                        Text(" ШОУ ОДНАЖДЫ В РОССИИ")
                            .foregroundColor(.black)
                            .font(Font.system(size: 8))
                            .fontWeight(.bold) // Adjust font weight as needed
                            .padding(8)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(10)
                            .offset(x: 10, y: 10) // Adjust offset for positioning
                        
                        // Second overlay text (lower left corner)
                        Text("13 июля 20:00")
                            .foregroundColor(.black)
                            .font(Font.system(size: 8))
                            .fontWeight(.bold) // Adjust font weight as needed
                            .padding(8)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(10)
                            .offset(x: 10, y: 150) // Adjust offset for positioning
                        
                        Text("от 2400₽")
                            .foregroundColor(.black)
                            .font(Font.system(size: 8))
                            .fontWeight(.bold) // Adjust font weight as needed
                            .padding(8)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(10)
                            .offset(x: 100, y: 150) // Adjust offset for positioning
                    }
                    
                    Spacer()
                    
                    ZStack(alignment: .topLeading) {
                        Image("1212") // Replace with your actual image name
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400, height: 200) // Adjust size as needed
                            .cornerRadius(10) // Optional: if you want rounded corners
                        
                        // First overlay text (upper left corner)
                        Text(" ШОУ ОДНАЖДЫ В РОССИИ")
                            .foregroundColor(.black)
                            .font(Font.system(size: 8))
                            .fontWeight(.bold) // Adjust font weight as needed
                            .padding(8)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(10)
                            .offset(x: 10, y: 10) // Adjust offset for positioning
                        
                        // Second overlay text (lower left corner)
                        Text("13 июля 20:00")
                            .foregroundColor(.black)
                            .font(Font.system(size: 8))
                            .fontWeight(.bold) // Adjust font weight as needed
                            .padding(8)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(10)
                            .offset(x: 10, y: 150) // Adjust offset for positioning
                        
                        Text("от 2400₽")
                            .foregroundColor(.black)
                            .font(Font.system(size: 8))
                            .fontWeight(.bold) // Adjust font weight as needed
                            .padding(8)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(10)
                            .offset(x: 100, y: 150) // Adjust offset for positioning
                    }
                    
                    
                    // Custom image instead of text
                    Image("your_custom_image_name") // Replace with your actual image name
                        .resizable()
                        .scaledToFit() // Adjusts the size to fit within the frame preserving aspect ratio
                        .frame(width: 200, height: 200) // Set the desired width and height
                        .cornerRadius(10) // Optional: if you want rounded corners
                    
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .presentationDetents([.height(60), .medium, .large])
            .presentationCornerRadius(20)
            .presentationBackground(.regularMaterial)
            .presentationBackgroundInteraction(.enabled(upThrough: .large))
            .interactiveDismissDisabled()
            .bottomMaskForSheet(mask: !ignoreTabBar)
        }
        
    }
        
    @ViewBuilder
    func TabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Button(action: { activeTab = tab }, label: {
                    VStack(spacing: 2) {
                        Spacer()
                        Spacer()
                        tab.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color(#colorLiteral(red: 0.2823529541, green: 0.2862745225, blue: 0.6156862974, alpha: 1)))
                            .frame(height: 25) // Adjust the height as needed
                            .scaleEffect(tab == activeTab ? 1.5 : 1)
                            
                            
                            
                        Spacer()
                        
                        Text(tab.displayName)
                            
                            .font(.caption2)
                    }
                    .foregroundColor(activeTab == tab ? Color.accentColor : .gray)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(Rectangle())
                })
                .buttonStyle(.plain)
            }
            
        }
        .accentColor(Color(#colorLiteral(red: 0.2823529541, green: 0.2862745225, blue: 0.6156862974, alpha: 1)))
    }
        
    }

    

    



#Preview {
    ContentView()
}

extension MKCoordinateRegion {
    //Apple MArk
    static var applePark: MKCoordinateRegion {
        let center = CLLocationCoordinate2D(latitude: 44.892789, longitude: 37.316780)
        return .init(center: center, latitudinalMeters: 10000, longitudinalMeters: 10000)
    }
}
