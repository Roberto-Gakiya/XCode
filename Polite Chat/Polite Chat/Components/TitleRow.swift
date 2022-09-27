//
//  TitleRow.swift
//  Polite Chat
//
//  Created by Roberto Gakiya Cruz on 20/09/22.
//

import SwiftUI

struct TitleRow: View {
    
    var imageURL = URL(string: "https://media.gettyimages.com/photos/actress-ashley-benson-poses-at-a-portrait-session-for-instyle-in-los-picture-id106531019?s=2048x2048");
    var name = "Ashley Benson";
    
    var body: some View {
    
        HStack(spacing: 20){
            AsyncImage(url: imageURL){
                image in image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }// AsyncImage
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title).bold()
                
                Text("Online")
                    .font(.caption)
                    .foregroundColor(.gray)
            }// VStack()
            
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "phone.fill")
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }//HStack
    
        .padding()
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
            .background(Color("Green"))
    }
}
