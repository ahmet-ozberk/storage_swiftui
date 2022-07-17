//
//  LoginView.swift
//  StorageCli
//
//  Created by Ahmet OZBERK on 17.07.2022.
//

import SwiftUI

struct LoginView: View {
    @State private var changePage:Bool = false
    @State private var email:String = ""
    @State private var password:String = ""
    @State private var toastMessage:String = ""
    @State private var isToast:Bool = false
    var body: some View {
        GeometryReader{size in
            
            VStack(alignment: .center){
                Text("Giriş Yap")
                    .foregroundColor(.black)
                    .font(.system(size: 46))
                    .fontWeight(.semibold)
                    .padding([.top],30)
                    .frame(width: size.size.width,alignment: .center)
                VStack(alignment: .leading){
                    Text("Email").font(.callout).padding(.leading,5)
                    TextField("email@email.com",text: $email)
                        .padding(.horizontal,8)
                        .frame(height: 45)
                        .background(.white)
                        .cornerRadius(10)
                    Text("Şifre").font(.callout).padding(.leading,5).padding(.top,20)
                    SecureField("********",text: $password)
                        .padding(.horizontal,8)
                        .frame(height: 45)
                        .background(.white)
                        .cornerRadius(10)
                }.padding(.all,20)
                    .background(.bar)
                    .cornerRadius(15)
                    .padding()
                    .padding(.top,size.size.height*0.15)
                    .padding(.bottom,40)
                Button(action: {
                    toastMessage = "Google şuan aktif değil"
                    isToast = true
                }) {
                    AsyncImage(url: URL(string: "https://kgo.googleusercontent.com/profile_vrt_raw_bytes_1587515358_10512.png")) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 30,height: 30)
                    Text("Google ile Kayıt Ol")
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                }.padding(.bottom,40)
                NavigationLink(destination: HomeView(),isActive: $changePage){
                Button(action: {
                    if email.isEmpty && password.isEmpty{
                        toastMessage = "Lütfen bilgileri doldurun"
                        isToast = true
                    }else{
                        toastMessage = "Giriş başarılı.\nYönlendiriliyorsunuz.."
                        isToast = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            changePage = true
                        }
                    }
                }){
                    Text("Giriş Yap")
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .frame(width: size.size.width*0.8, height: 45)
                        .padding(.horizontal,20)
                        .background(Color.yellow.opacity(0.8))
                        .cornerRadius(7)
                }}
                Spacer()
            }.navigationBarHidden(true)
                .navigationBarBackButtonHidden(false)
                .onTapGesture {KeyboardClose.fetch()}
        }.toast(message: toastMessage, isShowing:$isToast , duration: Toast.short)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
        }
    }
}
