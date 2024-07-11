//
//  R2.swift
//  App530
//
//  Created by IGOR on 04/05/2024.
//

import SwiftUI

struct R2: View {
    
    @AppStorage("status") var status = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    Text("Accurately plan your family budget and control")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    HStack {

                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 8, height: 8)
                        
                        Circle()
                            .fill(Color("prim"))
                            .frame(width: 8, height: 8)
                        
                        Spacer()
                        
                        Button(action: {
                            
                            status = true
                            
                        }, label: {
                            
                            Text("Next")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(width: 140, height: 50)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                        })
                    }
                    .padding()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 230)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    R2()
}
