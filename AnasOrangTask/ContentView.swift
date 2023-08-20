//
//  ContentView.swift
//  AnasOrangTask
//
//  Created by mac on 20/08/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("darkModeEnabled") private var darkModeEnabled = false
    @AppStorage("systemThemeEnabled") private var systemThemeEnabled = false
    
    private let themeManager = ThemeManager()
    var body: some View {
        TabView{
            HomeScreen()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            SettingsView(darkModeEnabled: $darkModeEnabled,
                         systemThemeEnabled: $systemThemeEnabled,
                         themeManager: themeManager)
            .tabItem {
                Image(systemName: "gearshape")
                Text("Settings")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
