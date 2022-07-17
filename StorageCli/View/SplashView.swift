//
//  SplashView.swift
//  StorageCli
//
//  Created by Ahmet OZBERK on 17.07.2022.
//

import SwiftUI

struct SplashView: View {
    
    @State var changePage:Bool = false
    
    var body: some View {
            NavigationView{
            GeometryReader{ size in
                    Spacer ().overlay{
                        NavigationLink(destination: LoginView(), isActive: $changePage) {
                            Image("appLogo")
                                    .resizable()
                                .frame(width: size.size.width/2, height: size.size.width/2)
                        }
                    }
                }.navigationBarHidden(true)
                    .navigationTitle("")
                    .navigationBarBackButtonHidden(false)
            }.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    changePage = true
                }
            }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
