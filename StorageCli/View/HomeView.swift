//
//  HomeView.swift
//  StorageCli
//
//  Created by Ahmet OZBERK on 17.07.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader{size in
            VStack(alignment: .center){
                HomeAppBar()
                Spacer()
                List{
                    
                }.cornerRadius(12).padding()
            }.frame(width: size.size.width, height: size.size.height)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct HomeAppBar: View {
    var body: some View {
        HStack{
            Button(action: {}){
                Image(systemName: "gear").resizable().frame(width: 25, height: 25)
            }
            Spacer()
            Text("Storage Cli")
                .font(.title)
            Spacer()
            Button(action: {}){
                Image(systemName: "plus.app").resizable().frame(width: 25, height: 25)
            }
        }.padding(.horizontal,12)
    }
}
