//
//  GridsTutorial.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/06.
//

import SwiftUI

struct GridsTutorial: View {
    //so trong ham fix la width cua element
//    let columns = [GridItem(.fixed(50)),GridItem(.fixed(50))]
    // flexible se mo rong do lon cua phan tu den kich co toi da ma no co the
    let columns = [GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns){
                ForEach(0..<20000,id:\.self){item in
                    Rectangle()
                        .frame(height:50)
                  
                }
            }
        }
        
        
    }
}

#Preview {
    GridsTutorial()
}
