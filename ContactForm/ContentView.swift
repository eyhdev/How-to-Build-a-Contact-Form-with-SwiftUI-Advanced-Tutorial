//
//  ContentView.swift
//  ContactForm
//
//  Created by eyh.mac on 29.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var city: String = ""
    @State var message: String = ""
    @State var firstNameEnable: Bool = false
    @State var showAlert: Bool = false
    @State var isMessageVisible: Bool = false
    @State var messageOpacity: CGFloat = 0
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                VStack(alignment: .leading){
                    HStack(spacing: 5){
                        Text("First Name")
                            .bold()
                      }
                    TextField("First Name", text: $firstName)
                        .padding(.horizontal)
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 57)
                                .foregroundColor(Color.gray.opacity(0.2))
                        }
                        .padding(.top)
                }
                VStack(alignment: .leading){
                    HStack(spacing: 5){
                        Text("Last Name")
                            .bold()
                      }
                    TextField("Last Name", text: $lastName)
                        .padding(.horizontal)
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 57)
                                .foregroundColor(Color.gray.opacity(0.2))
                        }
                        .padding(.top)
                }
                .padding(.top)
                VStack(alignment: .leading){
                    HStack(spacing: 5){
                        Text("City")
                            .bold()
                      }
                    TextField("City", text: $city)
                        .padding(.horizontal)
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 57)
                                .foregroundColor(Color.gray.opacity(0.2))
                        }
                        .padding(.top)
                }
                .padding(.top)
                VStack(alignment: .leading){
                    HStack(spacing: 5){
                        Text("Message")
                            .bold()
                      }
                    
                    TextEditor(text: $message)
                        .foregroundColor(Color.white)
                }
                .padding(.top)
                Button{
                    if(isEnabled()){
                        clearFields()
                        showAlert.toggle()
                    }
                }label: {
                    Text("Send")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isEnabled() ? Color.blue.cornerRadius(10) : Color.secondary.cornerRadius(10))
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(10)
                }
                .alert(isPresented: $showAlert){
                    getAlert()
                }
            }
            .navigationTitle("Contact Form")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
            .padding(.horizontal, 5)
         }
    }
    func isEnabled() -> Bool {
        if firstName.count >= 1 && lastName.count >= 1 && message.count >= 1{
            return true
        }
        return false
    }
    func clearFields(){
        firstName = ""
        lastName = ""
        city = ""
        message = ""
    }
    func getAlert()-> Alert{
        return Alert(
        title: Text("Message Sent Succesfully")
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
