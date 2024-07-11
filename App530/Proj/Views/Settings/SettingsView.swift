//
//  SettingsView.swift
//  App530
//
//  Created by IGOR on 05/05/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    VStack(spacing: 10) {

                        Image(systemName: "star.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .regular))
                        
                        Text("Rate Us")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                })
                
                Button(action: {

                    guard let url = URL(string: "https://docs.google.com/document/d/11IDQnhAo1gOM08j8FtqxUFh405kGEjKWZZL7bPC4vO0/edit?usp=sharing") else { return }
                    
                    UIApplication.shared.open(url)
                    
                }, label: {
                    
                    VStack(spacing: 10) {
                        
                        Image(systemName: "doc.text.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .regular))
                        
                        Text("Usage Policy")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                })
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
