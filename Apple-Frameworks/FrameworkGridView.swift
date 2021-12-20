//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by Hassan Sohail Dar on 11/12/21.
//

import SwiftUI

struct FrameworkGridView: View {
    //    @State var maximumSubViewWidth: CGFloat = 0
    //
    //    var body: some View {
    //        ZStack {
    //            BackgroundView()
    //            HStack {
    //
    //                FrameworkTitleView(imageName: "app-clip", appName: "App Christine", maximumSubViewWidth: $maximumSubViewWidth)
    //                FrameworkTitleView(imageName: "app-clip", appName: "App Jamy", maximumSubViewWidth: $maximumSubViewWidth)
    //                FrameworkTitleView(imageName: "app-clip", appName: "App William", maximumSubViewWidth: $maximumSubViewWidth)
    //
    //
    //
    //            }
    //        }
    //        .onPreferenceChange(DetermineWidth.Key.self)
    //                {
    //                    maximumSubViewWidth = $0
    //                }
    //
    let columns : [GridItem] = [GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            FrameworkTitleView(imageName: "app-clip", appName: "App Clips")
            FrameworkTitleView(imageName: "app-clip", appName: "App Clips")
            FrameworkTitleView(imageName: "app-clip", appName: "App Clips")
            FrameworkTitleView(imageName: "app-clip", appName: "App Clips")
            FrameworkTitleView(imageName: "app-clip", appName: "App Clips")
            FrameworkTitleView(imageName: "app-clip", appName: "App Clips")

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

struct FrameworkTitleView: View {
    var imageName: String
    var appName: String
//    @Binding var maximumSubViewWidth: CGFloat
    
//    var body: some View {
//        VStack {
//            Image(imageName)
//                .resizable()
//                .frame(width: 90, height: 90)
//            Text(appName)
//                .font(.title2)
//                .fontWeight(.semibold)
//                .scaledToFit()
//                .minimumScaleFactor(0.6)
////                .frame(minWidth: maximumSubViewWidth)
//        }
////        .overlay(DetermineWidth())
//    }
/////SOLUTION BY SEAN ALLEN//////
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(appName)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.5)
        }
    }
    /////SOLUTION BY SEAN ALLEN//////

    
}


