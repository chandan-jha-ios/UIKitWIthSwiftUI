//
//  HomeView.swift
//  UIKitWithSwiftUI
//
//  Created by Chandan Jha on 07/09/22.
//

import SwiftUI

struct HomeView: View {
    @State var webData: WebData
    
    var body: some View {
        NavigationView {
            ZStack{
                    Text("Welcome Abroad")
                        .padding()
                        .navigationBarTitle("Home", displayMode: .inline)
                    WebViewWrapper(data: $webData)
            }
            .foregroundColor(.black)
            .navigationBarItems(trailing: logoutBtn)
        }
        .navigationBarColor(backgroundColor: AppColor.theme.value, titleColor: .black)
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
