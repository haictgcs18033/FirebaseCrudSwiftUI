//
//  InstagramView.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/06.
//

import SwiftUI

struct InstagramView: View {
    @State var vehicle = 0
    // lay kich co hinh bang 1/3 man hinh
    let imageDimension = UIScreen.main.bounds.width / 3
    var columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {
       
            HStack{
                Image(systemName: "chevron.left")
                Spacer()
                Text("Black Panther")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.subheadline)
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.blue)
                Spacer()
            }
            .padding(.horizontal,20)
            HStack{
                Image("post4")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100,height: 100)
                    .clipShape(Circle())
                Spacer()
                HStack(spacing:32){
                    VStack{
                        Text("Like")
                            .fontWeight(.bold)
                        Text("123")
                    }
                    VStack{
                        Text("Like")
                            .fontWeight(.bold)
                        Text("123")
                    }
                    VStack{
                        Text("Like")
                            .fontWeight(.bold)
                        Text("123")
                    }
                    
                }
            }
            .padding(.horizontal)
            VStack(alignment:.leading,spacing: 10){
                Text("John")
                Text("123456")
                    .foregroundColor(.blue)
            }
            .frame(maxWidth:.infinity,alignment: .leading)
            .padding(.horizontal)
            HStack{
                HStack(spacing:-15){
                    Image("post4")
                        .resizable()
                        .frame(width: 50,height: 50)
                        .scaledToFill()
                        .clipShape(Circle())
                        .overlay{
                            Circle()
                                .stroke(Color.white,lineWidth: 2)
                        }
                    Image("post4")
                        .resizable()
                        .frame(width: 50,height: 50)
                        .scaledToFill()
                        .clipShape(Circle())
                        .overlay{
                            Circle()
                                .stroke(Color.white,lineWidth: 2)
                        }
                    Image("post4")
                        .resizable()
                        .frame(width: 50,height: 50)
                        .scaledToFill()
                        .clipShape(Circle())
                        .overlay{
                            Circle()
                                .stroke(Color.white,lineWidth: 2)
                        }
                }
                
                Text("follower")
                Spacer()
            }
            .padding(.horizontal)
            HStack{
                Text("Following")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .frame(width: 152,height: 32)
                    .overlay(
                        RoundedRectangle(cornerRadius:4)
                            .stroke()
                        
                    )
                Text("Message")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .frame(width: 152,height: 32)
                    .overlay(
                        RoundedRectangle(cornerRadius:4)
                            .stroke()
                        
                    )
                Image(systemName: "person.badge.plus")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .frame(width: 34,height: 32)
                    .overlay(
                        RoundedRectangle(cornerRadius:4)
                            .stroke()
                    )
            }
            ScrollView{
                LazyVGrid(columns: columns,spacing: 0){
                    ForEach (0..<30,id: \.self){item in
                        Image("post4")
                            .resizable()
                            .frame(width:imageDimension ,height:imageDimension)
                            .border(Color.white)
                            .scaledToFill()
                           
                    }
                }
            }
           
            .padding(4)
            
            
            
            
        
    }
}

#Preview {
    InstagramView()
}
