//
//  FavoriteButton.swift
//  Landmarks
//
//  Created  on 7/20/23.
//

import SwiftUI

struct FavoriteButton: View {
    // button's current state
    @Binding var isSet: Bool
    
    var body: some View {
        // Button changes appearance based on state
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

//#Preview {
//    FavoriteButton()
//}
struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        // provide a constant value for the preview
        FavoriteButton(isSet: .constant(true))
    }
}
