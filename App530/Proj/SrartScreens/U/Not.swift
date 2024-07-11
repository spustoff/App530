//
//  Not.swift
//  App530
//
//  Created by IGOR on 04/05/2024.
//

import SwiftUI

struct Not: View {

    @AppStorage("status") var status = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Not")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {

                        Button(action: {
                            
                            status = true
                            
                        }, label: {
                            
                            Text("Enable notifications")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                        })
                        .padding()

                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 120)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
            }
            .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .font(.system(size: 13, weight: .regular))
                        .padding(6)
                        .background(Circle().fill(.white))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                })
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    Not()
}
