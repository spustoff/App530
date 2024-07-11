//
//  CombinationsView.swift
//  App530
//
//  Created by IGOR on 04/05/2024.
//

import SwiftUI

struct CombinationsView: View {
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Combinations")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 18) {
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text("High card")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Text("The cards are different in suit and dignity.")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            Image("High card")
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text("Pair")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Text("Two cards of the same rank.")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            Image("Pair")
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text("Two pair")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Text("Two pairs of cards of the same value.")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            Image("Two pair")
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text("Three of a kind")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Text("Three cards of the same rank and two other cards.")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            Image("Three of a kind")
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text("Straight")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Text("Five cards of different suits, following the rank one after another.")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            Image("Straight")
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text("Flush")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Text("Five cards of the same suit.")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            Image("Flush")
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text("Full house")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Text("Three cards of one value and two cards of another.")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            Image("Full house")
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text("Four of a kind")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Text("Four cards of the same value and any fifth card.")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            Image("Four of a kind")
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text("Straight flush")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                                
                                Text("Five cards of the same suit, starting from the king and below.")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Image("Straight flush")
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text("Royal flush")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                                
                                Text("Ace, king, queen, jack and ten of the same suit.")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Image("Royal flush")
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                }
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    CombinationsView()
}
