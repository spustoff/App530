//
//  LoadingView.swift
//  App530
//
//  Created by IGOR on 04/05/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("lbg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 270)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding(.bottom, 100)
            }
        }
    }
}

#Preview {
    LoadingView()
}
