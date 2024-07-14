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
            switch activeTab {
            case .device:
                // Одна вью
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 10) {
                        Spacer()
                        Text(activeTab.displayName)
                                               .font(.title2)
                                               .foregroundColor(Color(#colorLiteral(red: 0.2823529541, green: 0.2862745225, blue: 0.6156862974, alpha: 1)))
                                               .fontWeight(.semibold)
                                               .padding(.leading, 20)
                        Spacer()
                        Spacer()
                        
                        VStack {
                                    // Ваши другие элементы интерфейса здесь

                                    Rectangle()
                                        .fill(Color.purple)
                                        .frame(width: 200, height: 120)
                                        .cornerRadius(10)
                                        
                                        .padding(.leading, 20)
                                        .overlay(
                                                            VStack {
                                                                Text("Баланс")
                                                                    .foregroundColor(.white)
                                                                    .font(.system(size: 15, weight: .bold))
                                                                    .offset(x: 15, y: -10)
                                                                
                                                                Text("3650")
                                                                    .foregroundColor(.white)
                                                            
                                                                    .font(.system(size: 24, weight: .bold))
                                                                    .offset(x: -30, y: 15)
                                                                
                                                                Image(systemName: "star.fill") // Замените на ваше изображение
                                                                    .resizable()
                                                                    .frame(width: 30, height: 30)
                                                                    .foregroundColor(.white)
                                                                    .offset(x: 40, y: -31)
                                                               
                                                            }
                                                        )

                                    
                                }
                        
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .presentationDetents([.height(60), .medium, .large])
                .presentationCornerRadius(20)
                .presentationBackground(.regularMaterial)
                .presentationBackgroundInteraction(.enabled(upThrough: .large))
                .interactiveDismissDisabled()
                .bottomMaskForSheet(mask: !ignoreTabBar)
            case .me:
                // Другая вью
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 10) {
                        Spacer()
                        Text(activeTab.displayName)
                                               .font(.title2)
                                               .foregroundColor(Color(#colorLiteral(red: 0.2823529541, green: 0.2862745225, blue: 0.6156862974, alpha: 1)))
                                               .fontWeight(.semibold)
                                               .padding(.leading, 20)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .presentationDetents([.height(60), .medium, .large])
                .presentationCornerRadius(20)
                .presentationBackground(.regularMaterial)
                .presentationBackgroundInteraction(.enabled(upThrough: .large))
                .interactiveDismissDisabled()
                .bottomMaskForSheet(mask: !ignoreTabBar)
            case .people:
                // Третья
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(activeTab.displayName)
                                               .font(.title2)
                                               .foregroundColor(Color(#colorLiteral(red: 0.2823529541, green: 0.2862745225, blue: 0.6156862974, alpha: 1)))
                                               .fontWeight(.semibold)
                                               .padding(.leading, 20)
                        Spacer()
                        Spacer()
                        
                        ZStack(alignment: .topLeading) {
                            
                            Image("123123") // Replace with your actual image name
                                .resizable()
                                .scaledToFit()
                                .frame(width: 400, height: 200) // Adjust size as needed
                                .cornerRadius(10)
                            
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
                                                    Text("Спектакль")
                                                        .foregroundColor(.black)
                                                        .font(Font.system(size: 8))
                                                        .fontWeight(.bold) // Adjust font weight as needed
                                                        .padding(8)
                                                        .background(Color.white)
                                                        .cornerRadius(10)
                                                        .padding(10)
                                                        .offset(x: 10, y: 10) // Adjust offset for positioning
                            
                                                    // Second overlay text (lower left corner)
                                                   Text("14 июля")
                                                        .foregroundColor(.black)
                                                        .font(Font.system(size: 8))
                                                        .fontWeight(.bold) // Adjust font weight as needed
                                                        .padding(8)
                                                        .background(Color.white)
                                                        .cornerRadius(10)
                                                        .padding(10)
                                                        .offset(x: 10, y: 150) // Adjust offset for positioning
                            
                                                    Text("от 1400₽")
                                                        .foregroundColor(.black)
                                                        .font(Font.system(size: 8))
                                                        .fontWeight(.bold) // Adjust font weight as needed
                                                        .padding(8)
                                                        .background(Color.white)
                                                        .cornerRadius(10)
                                                        .padding(10)
                                                        .offset(x: 80, y: 150) // Adjust offset for positioning
                                                }
                        
                        Spacer()
      
                          ZStack(alignment: .topLeading) {
                              Image("1") // Replace with your actual image name
                                  .resizable()
                                  .scaledToFit()
                                  .frame(width: 400, height: 200) // Adjust size as needed
                                  .cornerRadius(10) // Optional: if you want rounded corners
      
                              // First overlay text (upper left corner)
                              Text("Концерт")
                                  .foregroundColor(.black)
                                  .font(Font.system(size: 8))
                                  .fontWeight(.bold) // Adjust font weight as needed
                                  .padding(8)
                                  .background(Color.white)
                                  .cornerRadius(10)
                                  .padding(10)
                                  .offset(x: 10, y: 10) // Adjust offset for positioning
                              
                              Text("Григорий Лепс")
                                  .foregroundColor(.black)
                                  .font(Font.system(size: 8))
                                  .fontWeight(.bold) // Adjust font weight as needed
                                  .padding(8)
                                  .background(Color.white)
                                  .cornerRadius(10)
                                  .padding(10)
                                  .offset(x: 80, y: 10)
      
                              // Second overlay text (lower left corner)
                             Text("6 августа 20:00")
                                  .foregroundColor(.black)
                                  .font(Font.system(size: 8))
                                  .fontWeight(.bold) // Adjust font weight as needed
                                  .padding(8)
                                  .background(Color.white)
                                  .cornerRadius(10)
                                  .padding(10)
                                  .offset(x: 10, y: 150) // Adjust offset for positioning
      
                              Text("от 3500₽")
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
                              Image("2") // Replace with your actual image name
                                  .resizable()
                                  .scaledToFit()
                                  .frame(width: 400, height: 200) // Adjust size as needed
                                  .cornerRadius(10) // Optional: if you want rounded corners
      
                              // First overlay text (upper left corner)
                              Text("Новости")
                                  .foregroundColor(.black)
                                  .font(Font.system(size: 8))
                                  .fontWeight(.bold) // Adjust font weight as needed
                                  .padding(8)
                                  .background(Color.white)
                                  .cornerRadius(10)
                                  .padding(10)
                                  .offset(x: 10, y: 10)
                              
                             Text("20.06.2024")
                                  .foregroundColor(.black)
                                  .font(Font.system(size: 8))
                                  .fontWeight(.bold) // Adjust font weight as needed
                                  .padding(8)
                                  .background(Color.white)
                                  .cornerRadius(10)
                                  .padding(10)
                                  .offset(x: 10, y: 150) 
                              
                              Text("Новая выставка")
                                   .foregroundColor(.black)
                                   .font(Font.system(size: 8))
                                   .fontWeight(.bold) // Adjust font weight as needed
                                   .padding(8)
                                   .background(Color.white)
                                   .cornerRadius(10)
                                   .padding(10)
                                   .offset(x: 80, y: 150)
                              // Adjust offset for positioning
      
        
                          }
                        
                        Spacer()
      
                          ZStack(alignment: .topLeading) {
                              Image("3") // Replace with your actual image name
                                  .resizable()
                                  .scaledToFit()
                                  .frame(width: 400, height: 200) // Adjust size as needed
                                  .cornerRadius(10) // Optional: if you want rounded corners
      
                              // First overlay text (upper left corner)
                              Text("Кино")
                                  .foregroundColor(.black)
                                  .font(Font.system(size: 8))
                                  .fontWeight(.bold) // Adjust font weight as needed
                                  .padding(8)
                                  .background(Color.white)
                                  .cornerRadius(10)
                                  .padding(10)
                                  .offset(x: 10, y: 10)
                              
                              Text("Унесенные призраками")
                                  .foregroundColor(.black)
                                  .font(Font.system(size: 8))
                                  .fontWeight(.bold) // Adjust font weight as needed
                                  .padding(8)
                                  .background(Color.white)
                                  .cornerRadius(10)
                                  .padding(10)
                                  .offset(x: 55, y: 10)
                              
                              Text("8.6")
                                  .foregroundColor(.green)
                                  .font(Font.system(size: 8))
                                  .fontWeight(.bold) // Adjust font weight as needed
                                  .padding(8)
                                  .background(Color.white)
                                  .cornerRadius(10)
                                  .padding(10)
                                  .offset(x: 185, y: 10)
                              
                             Text("21 июля")
                                  .foregroundColor(.black)
                                  .font(Font.system(size: 8))
                                  .fontWeight(.bold) // Adjust font weight as needed
                                  .padding(8)
                                  .background(Color.white)
                                  .cornerRadius(10)
                                  .padding(10)
                                  .offset(x: 10, y: 150)
                              
                              Text("Мультфильм")
                                   .foregroundColor(.black)
                                   .font(Font.system(size: 8))
                                   .fontWeight(.bold) // Adjust font weight as needed
                                   .padding(8)
                                   .background(Color.white)
                                   .cornerRadius(10)
                                   .padding(10)
                                   .offset(x: 65, y: 150)
                              
                              Text("от 300₽")
                                   .foregroundColor(.black)
                                   .font(Font.system(size: 8))
                                   .fontWeight(.bold) // Adjust font weight as needed
                                   .padding(8)
                                   .background(Color.white)
                                   .cornerRadius(10)
                                   .padding(10)
                                   .offset(x: 140, y: 150)
                              // Adjust offset for positioning
      
        
                          }
      
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
                
                //            ScrollView(.vertical) {
                //                VStack(alignment: .leading, spacing: 10) {
                //                    // Text above Image
                //                    Text(activeTab.displayName)
                //                        .font(.title2)
                //                        .foregroundColor(Color(#colorLiteral(red: 0.2823529541, green: 0.2862745225, blue: 0.6156862974, alpha: 1)))
                //                        .fontWeight(.semibold)
                //
                //                    Spacer()
                //
                //                    // Image with overlay texts
                //                    ZStack(alignment: .topLeading) {
                //                        Image("123123") // Replace with your actual image name
                //                            .resizable()
                //                            .scaledToFit()
                //                            .frame(width: 400, height: 200) // Adjust size as needed
                //                            .cornerRadius(10) // Optional: if you want rounded corners
                //
                //                        // First overlay text (upper left corner)
                //                        Text(" ШОУ ОДНАЖДЫ В РОССИИ")
                //                            .foregroundColor(.black)
                //                            .font(Font.system(size: 8))
                //                            .fontWeight(.bold) // Adjust font weight as needed
                //                            .padding(8)
                //                            .background(Color.white)
                //                            .cornerRadius(10)
                //                            .padding(10)
                //                            .offset(x: 10, y: 10) // Adjust offset for positioning
                //
                //                        // Second overlay text (lower left corner)
                //                        Text("13 июля 20:00")
                //                            .foregroundColor(.black)
                //                            .font(Font.system(size: 8))
                //                            .fontWeight(.bold) // Adjust font weight as needed
                //                            .padding(8)
                //                            .background(Color.white)
                //                            .cornerRadius(10)
                //                            .padding(10)
                //                            .offset(x: 10, y: 150) // Adjust offset for positioning
                //
                //                        Text("от 2400₽")
                //                            .foregroundColor(.black)
                //                            .font(Font.system(size: 8))
                //                            .fontWeight(.bold) // Adjust font weight as needed
                //                            .padding(8)
                //                            .background(Color.white)
                //                            .cornerRadius(10)
                //                            .padding(10)
                //                            .offset(x: 100, y: 150) // Adjust offset for positioning
                //                    }
                //
                //                    Spacer()
                //
                //                    ZStack(alignment: .topLeading) {
                //                        Image("1212") // Replace with your actual image name
                //                            .resizable()
                //                            .scaledToFit()
                //                            .frame(width: 400, height: 200) // Adjust size as needed
                //                            .cornerRadius(10) // Optional: if you want rounded corners
                //
                //                        // First overlay text (upper left corner)
                //                        Text(" ШОУ ОДНАЖДЫ В РОССИИ")
                //                            .foregroundColor(.black)
                //                            .font(Font.system(size: 8))
                //                            .fontWeight(.bold) // Adjust font weight as needed
                //                            .padding(8)
                //                            .background(Color.white)
                //                            .cornerRadius(10)
                //                            .padding(10)
                //                            .offset(x: 10, y: 10) // Adjust offset for positioning
                //
                //                        // Second overlay text (lower left corner)
                //                        Text("13 июля 20:00")
                //                            .foregroundColor(.black)
                //                            .font(Font.system(size: 8))
                //                            .fontWeight(.bold) // Adjust font weight as needed
                //                            .padding(8)
                //                            .background(Color.white)
                //                            .cornerRadius(10)
                //                            .padding(10)
                //                            .offset(x: 10, y: 150) // Adjust offset for positioning
                //
                //                        Text("от 2400₽")
                //                            .foregroundColor(.black)
                //                            .font(Font.system(size: 8))
                //                            .fontWeight(.bold) // Adjust font weight as needed
                //                            .padding(8)
                //                            .background(Color.white)
                //                            .cornerRadius(10)
                //                            .padding(10)
                //                            .offset(x: 100, y: 150) // Adjust offset for positioning
                //                    }
                //
                //
                //                    // Custom image instead of text
                //                    Image("your_custom_image_name") // Replace with your actual image name
                //                        .resizable()
                //                        .scaledToFit() // Adjusts the size to fit within the frame preserving aspect ratio
                //                        .frame(width: 200, height: 200) // Set the desired width and height
                //                        .cornerRadius(10) // Optional: if you want rounded corners
                //
                //                }
                //                .padding()
                //            }
                //            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                //            .presentationDetents([.height(60), .medium, .large])
                //            .presentationCornerRadius(20)
                //            .presentationBackground(.regularMaterial)
                //            .presentationBackgroundInteraction(.enabled(upThrough: .large))
                //            .interactiveDismissDisabled()
                //            .bottomMaskForSheet(mask: !ignoreTabBar)
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

