//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by Hassan Sohail Dar on 11/12/21.
//

import SwiftUI

struct FrameworkGridView: View {
    @State var maximumSubViewWidth: CGFloat = 0
    
    var body: some View {
        ZStack {
            BackgroundView()
            HStack {
                
                AppView(imageName: "app-clip", appName: "App Christine", maximumSubViewWidth: $maximumSubViewWidth)
                
                
                
                VStack {
                    Image(systemName: "cloud.sun.fill")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Text("App Christine")
                        .foregroundColor(.blue)
                        .padding()
                        .frame(minWidth: maximumSubViewWidth)
                }
                .overlay(DetermineWidth())

                VStack {
                    Image(systemName: "cloud.sun.fill")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Text("App")
                        .foregroundColor(.blue)
                        .padding()
                        .frame(minWidth: maximumSubViewWidth)
                }
                .overlay(DetermineWidth())

            }
        }
        .onPreferenceChange(DetermineWidth.Key.self)
                {
                    maximumSubViewWidth = $0
                }
        
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
    }
}

struct BackgroundView: View {
    //binding forces the state to stay the same
//    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.white, .orange]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

////////////////////////CODE USED TO DETERMINE WIDTH/////////////////////
struct MaximumWidthPreferenceKey: PreferenceKey
{
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat)
    {
        value = max(value, nextValue())
    }
}

// determines the width of the text for single item.
struct DetermineWidth: View
{
    typealias Key = MaximumWidthPreferenceKey
    var body: some View
    {
        GeometryReader
        {
            proxy in
            Color.clear
                .anchorPreference(key: Key.self, value: .bounds)
                {
                    anchor in proxy[anchor].size.width
                }
        }
    }
}
////////////////////////CODE USED TO DETERMINE WIDTH/////////////////////

struct AppView: View {
    var imageName: String
    var appName: String
    @Binding var maximumSubViewWidth: CGFloat
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 70, height: 70)
            Text(appName)
//                .font(.title2)
//                .fontWeight(.semibold)
//                .scaledToFit()
//                .minimumScaleFactor(0.5)
                .foregroundColor(.blue)
                .padding()
                .frame(minWidth: maximumSubViewWidth)
        }
        .overlay(DetermineWidth())
    }
}
