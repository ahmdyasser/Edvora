//
//  FilterView.swift
//  Edvora
//
//  Created by Ahmad Yasser on 04/02/2022.
//

import SwiftUI

struct FilterView: View {
    var items: [String]
    @State var placeholer = ""
    @State var productsFilter = 0
    @State var stateFilter = 0
    @State var cityFilter = 0
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color("card"))
            VStack(spacing: 10) {
                TextField("", text: $placeholer)
                    .placeholder(when: placeholer.isEmpty, placeholder: {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Filters")
                                .opacity(0.6)
                                .font(.system(size: 20))
                        }
                        
                    })
                    .padding(.horizontal)
                HStack {
                    Rectangle()
                        .frame(width: 200, height: 0.7)
                        .foregroundColor(.white)
                        .padding(.vertical, 6)
                    Spacer()
                }.padding(.horizontal)
                
                FilterOption(filterName: "Products")
                FilterOption(filterName: "State")
                FilterOption(filterName: "City")
                
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        }
        .cornerRadius(10)
        .padding()
    }
}

struct FilterView_Previews: PreviewProvider {
    static let sampleData = ["a", "a", "a", "a", "a", "a"]
    static var previews: some View {
        
        FilterView(items: sampleData)
    }
}

struct FilterOption: View {
    var filterName: String
    var body: some View {
        Button {
            print("hi")
        } label: {
            ZStack {
                Rectangle()
                    .foregroundColor(Color("darker"))
                    .frame(height: 60)
                    .cornerRadius(10)
                HStack {
                    
                    Text(filterName)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "arrowtriangle.down.fill")
                        .foregroundColor(.white)
                    
                }.padding()
            }  .padding()
        }
        
        
    }
}


extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
