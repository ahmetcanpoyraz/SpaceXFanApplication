//
//  UpcomingsView.swift
//  SpaceXFanApplication
//
//  Created by İzmir İnovasyon ve Teknoloji on 10.12.2024.
//

import Foundation
import SwiftUI

struct UpcomingsView: View {
    @StateObject private var viewModel = UpcomingsViewModel()
    
    var body: some View {
        
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading rockets...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else {
                VStack{
                    Text("UPCOMİNG LAUNCHES")
                        .font(.title3)
                    ScrollView {
                        VStack(spacing: 5) {
                            ForEach(viewModel.upcomingLaunches) { upcomingLaunches in
                                VStack {
                                    Text(upcomingLaunches.name)
                                        .font(.headline)
                                        .padding()
                                
                                        .frame(minWidth: 300,alignment: .leading)
                                }
                         
                            }
                        }
                    }
                    .background(Color.clear)
                }
            }
        }
    }
}

#Preview {
    UpcomingsView()
}
