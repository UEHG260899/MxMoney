//
//  MxBackButton.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 28/03/23.
//

import SwiftUI

struct MxBackButton: View {

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Button(action: { dismiss() }, label: {
            Image(systemName: "arrow.backward")
                .foregroundColor(.white)
        })
    }
}
