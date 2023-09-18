//
//  ProfileHost.swift
//  Landmarks
//
//  Created on 7/22/23.
//

import SwiftUI

struct ProfileHost: View {
    // swiftUI provides storage in the environment for values
    @Environment(\.editMode) var editMode
    // read profile data from the environ to pass control data to profile host
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // toggles the editMode value on and off
            HStack {
                // add a cancel buttom
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            // add conditional view for display profile or Edit mode
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                // edit profile view display when you tap Edit
                ProfileEditor(profile: $draftProfile)
                // modifiers to populate the editor with the correct profile data
                    .onAppear() {
                        draftProfile = modelData.profile
                    }
                    .onDisappear() {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

//#Preview {
//    ProfileHost()
//}
struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            // add model data
            .environmentObject(ModelData())
    }
}
