//
//  DetailView.swift
//  Hacker News
//
//  Created by Julio Errecart on 31/1/26.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    var body: some View {
        
        WebView(urlString: url)
        
    }
    
}

#Preview {
    DetailView(url: "http://www.google.com")
}
