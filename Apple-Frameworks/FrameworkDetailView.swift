//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Hassan Sohail Dar on 21/12/21.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework : Framework
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button{
                    isShowingDetailView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }
            .padding()
            
            Spacer()
            
            FrameworkTitleView(selectedFramework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            Spacer()
            
            Button {
                
            } label: {
                APButton(title: "Learn More")
            }
            Spacer()
        }
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.sampleDataFramework, isShowingDetailView: .constant(false))
            .preferredColorScheme(.dark)
    }
}

// my solution initial. but wrong.
//struct DetailView: View {
//    var body: some View {
//        VStack {
//            Image("carplay")
//                .resizable()
//                .frame(width: 180, height: 180)
//            Text("Lorep sum text")
//                .multilineTextAlignment(.leading)
//            Spacer()
//            VStack {
//                Button {
//
//                } label: {
//                    Text("Learn More")
//                        .frame(width: 280, height: 50)
////                        .background(.systemRed)
////                        .foregroundColor(.systemCyan)
//                        .font(.system(size: 20, weight: .bold, design: .default))
//                        .cornerRadius(10)
//
//                }
//            }
//            Spacer() //basically used to move the text to the top of the frame
//        }
//    }
//}
