//
//  NotesView.swift
//  App530
//
//  Created by IGOR on 05/05/2024.
//

import SwiftUI

struct NotesView: View {
    
    @StateObject var viewModel = NotesViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Your notes")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                     Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                    })
                }
                
                
                Text("Thoughts are always at hand")
                    .foregroundColor(.white.opacity(0.6))
                    .font(.system(size: 15, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Rectangle()
                    .fill(.white.opacity(0.5))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .padding(.vertical)
                
                if viewModel.notes.isEmpty {
                    
                    VStack(spacing: 15) {

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
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(spacing: 18) {
                            
                            ForEach(viewModel.notes, id: \.self) { index in
                                
                                Button(action: {

                                        viewModel.selNote.append(index)
                                    
                                }, label: {
                                    
                                    VStack {
                                        
                                        HStack {
                                            
                                            ZStack {
                                                
                                                Circle()
                                                    .stroke(viewModel.selNote.contains(index) ? Color.green : .white, lineWidth: 1)
                                                    .frame(width: 13, height: 13)
                                                    .padding(1)
                                                
                                                Image(systemName: "checkmark")
                                                    .foregroundColor(.green)
                                                    .font(.system(size: 10, weight: .regular))
                                                    .opacity(viewModel.selNote.contains(index) ? 1 : 0)
                                                
                                            }
                                            
                                            Text(index)
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .regular))
                                            
                                            Spacer()
                                        }
                                        
                                        Rectangle()
                                            .fill(.white.opacity(0.2))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 1)
                                    }
                                })
                            }
                        }
                    }
                }
                                
                Spacer()
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAdd ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Record")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Write something")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addingNote.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addingNote)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .semibold))
                        
                    })
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.addingNote = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color.white))

                            
                        })
                        
                        Button(action: {
                            
                            viewModel.notes.append(viewModel.addingNote)
                            
                            viewModel.addingNote = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                            
                        })
                        .opacity(viewModel.addingNote.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.addingNote.isEmpty ? true : false)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isAdd ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    NotesView()
}
