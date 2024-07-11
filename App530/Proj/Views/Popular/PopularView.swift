//
//  PopularView.swift
//  App530
//
//  Created by IGOR on 05/05/2024.
//

import SwiftUI

struct PopularView: View {
    
    @StateObject var viewModel = ResultViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("A popular winning combination")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding()
                
                if viewModel.random == "1" {
                    
                    Text("Straight")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .padding(.bottom)
                    
                } else if viewModel.random == "2" {
                    
                    Text("Three of a kind")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .padding(.bottom)
                    
                } else if viewModel.random == "3" {
                    
                    Text("Flush")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .padding(.bottom)
                    
                }
                
                Text("Five cards of different suits, following the rank one after another.")
                    .foregroundColor(.gray.opacity(0.7))
                    .font(.system(size: 13, weight: .regular))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom)
                
                if viewModel.results.isEmpty {
                    
                    HStack {
                        
                        VStack {
                            
                            Image("empty")
                            
                        }
                        .frame(width: 50, height: 80)
                        .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                        
                        VStack {
                            
                            Image("empty")
                            
                            
                        }
                        .frame(width: 50, height: 80)
                        .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                        
                        VStack {
                            
                            Image("empty")
                            
                        }
                        .frame(width: 50, height: 80)
                        .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                        
                        VStack {
                            
                            Image("empty")
                            
                        }
                        .frame(width: 50, height: 80)
                        .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                        
                        VStack {
                            
                            Image("empty")
                            
                            
                        }
                        .frame(width: 50, height: 80)
                        .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                        
                    }
                    .padding(.bottom)
                    
                } else {
                    
                    HStack {
                        
                        VStack {
                            
                            Text(viewModel.random6)
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .semibold))
                            
                            Image("piki")
                            
                            
                        }
                        .frame(width: 50, height: 80)
                        .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                        
                        VStack {
                            
                            Text(viewModel.random7)
                                .foregroundColor(.red)
                                .font(.system(size: 17, weight: .semibold))
                            
                            Image("chervi")
                            
                        }
                        .frame(width: 50, height: 80)
                        .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                        
                        VStack {
                            
                            Text(viewModel.random8)
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .semibold))
                            
                            Image("kresti")
                        }
                        .frame(width: 50, height: 80)
                        .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                        
                        VStack {
                            
                            Text(viewModel.random9)
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .semibold))
                            
                            Image("piki")
                        }
                        .frame(width: 50, height: 80)
                        .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                        
                        VStack {
                            
                            Text(viewModel.random10)
                                .foregroundColor(.red)
                                .font(.system(size: 17, weight: .semibold))
                            
                            Image("bubi")
                            
                        }
                        .frame(width: 50, height: 80)
                        .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                        
                    }
                    .padding(.bottom)
                }
                
                if viewModel.results.isEmpty {
                    
                    VStack(spacing: 15) {
                        
                        Text("History")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text("You haven't added any entries")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .semibold))
                        
                        Image("joker")
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 350)
                    .background(RoundedRectangle(cornerRadius: 25.0).fill(.white))
                    .padding()
                    
                    Spacer()
                    
                } else {
                
                VStack {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        Text("History")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                        
                        LazyVStack {
                            
                            ForEach(viewModel.results, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedResult = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDelete = true
                                    }
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        if index.resResult == "Defeat" {
                                            
                                            Image(systemName: "arrowtriangle.down.fill")
                                                .foregroundColor(.red)
                                                .font(.system(size: 16, weight: .regular))
                                            
                                        } else if index.resResult == "Victory" {
                                            
                                            Image(systemName: "arrowtriangle.up.fill")
                                                .foregroundColor(.green)
                                                .font(.system(size: 16, weight: .regular))
                                        }
                                        
                                        Text(index.resCombination ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .semibold))
                                        
                                        Spacer()
                                        
                                        if index.resResult == "Defeat" {
                                            
                                            Text("\(index.resSum ?? "")")                                            .foregroundColor(.red)
                                                .font(.system(size: 16, weight: .regular))
                                            
                                        } else if index.resResult == "Victory" {
                                            
                                            Text("\(index.resSum ?? "")")
                                                .foregroundColor(.green)
                                                .font(.system(size: 16, weight: .semibold))
                                        }
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(.gray.opacity(0.15)))
                                })
                            }
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                .ignoresSafeArea()
            }
            }
        }
        .onAppear {
            
            viewModel.fetchResults()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteResult(withGoalName: viewModel.selectedResult?.resSum ?? "", completion: {
                            
                            viewModel.fetchResults()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            
                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("lbg")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    PopularView()
}
