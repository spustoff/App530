//
//  ResultView.swift
//  App530
//
//  Created by IGOR on 04/05/2024.
//

import SwiftUI

struct ResultView: View {
    
    @StateObject var viewModel = ResultViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Result")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                ZStack(alignment: .leading, content: {
                    
                    Text("Sum")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .opacity(viewModel.resSum.isEmpty ? 1 : 0)
                    
                    TextField("", text: $viewModel.resSum)
                        .foregroundColor(Color.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                })
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], alignment: .leading, spacing: 25, content: {
                        
                        ForEach(viewModel.combinations, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentCombination = index
                                
                            }, label: {
                                
                                VStack(alignment: .leading) {
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                    HStack {
                                        
                                        ZStack {
                                            
                                            Circle()
                                                .stroke(viewModel.currentCombination == index ? .green : .white)
                                                .frame(width: 15)
                                         
                                            Image(systemName: "checkmark")
                                                .foregroundColor(.green)
                                                .font(.system(size: 10, weight: .regular))
                                                .opacity(viewModel.currentCombination == index ? 1 : 0)
                                        }
                                        
                                        Image(index)
                                    }
                                }
                            })
                            
                        }
                    })
                    .padding(1)
                }

                HStack {
                    
                    Button(action: {
                        
                        viewModel.resCombination = viewModel.currentCombination
                        
                        viewModel.resResult = "Defeat"
                        
                        viewModel.addResult()
                        
                        viewModel.resSum = ""
                        viewModel.currentCombination = ""
                        
                        viewModel.fetchResults()
                        
                    }, label: {
                        
                        Text("Defeat")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 20).stroke(.white))
                    })
                    .opacity(viewModel.resSum.isEmpty || viewModel.currentCombination.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.resSum.isEmpty || viewModel.currentCombination.isEmpty ? true : false)
                    
                    Button(action: {
                        
                        viewModel.resCombination = viewModel.currentCombination
                        
                        viewModel.resResult = "Victory"
                        
                        viewModel.addResult()
                        
                        viewModel.resSum = ""
                        viewModel.currentCombination = ""
                        
                        viewModel.fetchResults()
                        
                    }, label: {
                        
                        Text("Victory")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                    })
                    .opacity(viewModel.resSum.isEmpty || viewModel.currentCombination.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.resSum.isEmpty || viewModel.currentCombination.isEmpty ? true : false)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ResultView()
}
