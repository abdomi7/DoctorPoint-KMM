//
//  SigninScreen.swift
//  DoctorPoint
//
//  Created by AbdelHalim Mahmoud on 01/04/2022.
//

import SwiftUI

@available(iOS 15.0, *)
struct SigninScreen: View {
    @State var selection: Int? = nil
    @State private var email: String = ""
    @State private var password: String = ""
    @FocusState private var focusedField: Field?
    enum Field: Hashable {
        case myField
    }
    var body: some View {
        ScrollView{
            VStack{
                Group{
                    Image("logo").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 130, height: 100)
                    Spacer().frame(height: 30)
                    HStack {
                        Image("mail_ico").resizable().frame(width: 25,height: 20)
                        Spacer().frame(width: 20)
                        Text("Email")
                            .fontWeight(.semibold)
                            .font(.body)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity,maxHeight: 28,alignment: .leading)
                    .padding(.horizontal).padding(.vertical,5)
                    .foregroundColor(.gray)
                    .cornerRadius(15)
                    HStack {
                        
                        TextField("example@example.com", text: $email).multilineTextAlignment(.leading).textContentType(.oneTimeCode)
                            .keyboardType(.emailAddress).focused($focusedField, equals: .myField).autocapitalization(.none)
                            .disableAutocorrection(true)
                    }.textFieldStyle(DefaultTextFieldStyle()).padding(.horizontal)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    HStack {
                        Image("pass_ico").resizable().frame(width: 20,height: 25)
                        Spacer().frame(width: 20)
                        Text("Password")
                            .fontWeight(.semibold)
                            .font(.body)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity,maxHeight: 28,alignment: .leading)
                    .padding(.horizontal).padding(.bottom,5).padding(.top)
                    .foregroundColor(.gray)
                    .cornerRadius(15)
                    HStack {
                        
                        SecureField("Enter password", text: $password).multilineTextAlignment(.leading).textContentType(.oneTimeCode)
                            .keyboardType(.emailAddress).focused($focusedField, equals: .myField).autocapitalization(.none)
                            .disableAutocorrection(true)
                    }.textFieldStyle(DefaultTextFieldStyle()).padding(.horizontal)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    Spacer().frame(height: 40)
                    NavigationLink(destination: SigninScreen(), tag: 1, selection: $selection) {
                        Button(action: {
                            print("tapped!")
                            self.selection = 1
                        }) {
                            HStack {
                                Text("Sign In")
                                    .fontWeight(.semibold)
                                    .font(.body).padding()
                            }
                            .frame(minWidth: 0, maxWidth: .infinity,maxHeight: 28)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("green"))
                            .cornerRadius(15)
                        }.padding(.horizontal).padding(.bottom,5)
                    }
                }
                
                Text("Forgot Password?").fontWeight(.ultraLight).foregroundColor(Color.gray).font(.subheadline).multilineTextAlignment(.center).frame( maxWidth: .infinity, alignment: .center)
                Spacer().frame(height: 40)
                HStack{
                    Text("Or Sign in With").fontWeight(.ultraLight).foregroundColor(Color.gray).font(.subheadline).multilineTextAlignment(.leading).frame( alignment: .center)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .padding(.leading)
                }.padding().frame(maxWidth:.infinity,alignment: .leading)
                
                HStack{
                    Image("facebook").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 55).padding(.trailing)
                    Image("google").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 55).padding(.trailing)
                    Image("twitter").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 55).padding(.trailing)
                    Image("instagram").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 55).padding(.trailing)
                }.frame(maxWidth:.infinity,alignment:.leading).padding(.horizontal)
            }.frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top).offset(y:-30).padding(.horizontal,5)
            
            HStack{
                Text("Haven't any account?").fontWeight(.ultraLight).foregroundColor(Color.gray).font(.subheadline).multilineTextAlignment(.center).frame( alignment: .center)
                NavigationLink(destination: CreateAccountScreen(), tag: 1, selection: $selection) {
                    Text("Create account").foregroundColor(Color("green")).font(.body).multilineTextAlignment(.center).frame(alignment: .center).offset(x:-2).onTapGesture(perform: {
                        self.selection = 1
                    })}
            }.padding().frame(alignment:.bottom)
            
        }.frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top).background(Color("white"))
        
    }
}

@available(iOS 15.0, *)
struct SigninScreen_Previews: PreviewProvider {
    static var previews: some View {
        SigninScreen()
    }
}
