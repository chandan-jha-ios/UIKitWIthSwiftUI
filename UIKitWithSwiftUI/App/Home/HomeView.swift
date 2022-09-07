//
//  HomeView.swift
//  UIKitWithSwiftUI
//
//  Created by Chandan Jha on 07/09/22.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView {
                    Text("Welcome Guest")
                        .padding()
                        .navigationBarTitle("Home", displayMode: .inline)
                    Spacer()
                }
            }
            .foregroundColor(.black)
            .navigationBarItems(trailing: logoutBtn)
            
        }
        .navigationBarColor(backgroundColor: AppColor.theme.value)
    }
    
    private var logoutBtn: some View {
        Button(action: handleLogout) {
            Text("Logout")
                .foregroundColor(.white)
        }
    }
    
    private func handleLogout() {
        UserDefaults.standard.removeObject(forKey: "user")
        (UIApplication.shared.delegate as? AppDelegate)?.showHomeOrLogin()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
