//
//  MxErrorView.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 21/06/23.
//

import SwiftUI

struct MxErrorView: View {

    let errorDescription: String
    var scheme: MxErrorViewScheme = .init()

    var body: some View {
        VStack(spacing: scheme.containerVerticalSpacing) {
            Image(systemName: "xmark.octagon.fill")
                .resizable()
                .frame(
                    width: scheme.imageSize.width,
                    height: scheme.imageSize.height
                )
                .foregroundColor(scheme.imageForegroundColor)

            VStack(spacing: scheme.textsVerticalSpacing) {
                Text("Error.View.Title.Text")
                    .mxFont(scheme.titleFont, size: scheme.titleFontSize)
                    .foregroundColor(scheme.titleFontColor)

                Text(errorDescription)
                    .mxFont(scheme.subtitleFont, size: scheme.subtitleFontSize)
                    .multilineTextAlignment(scheme.subtitleMultilineAlignment)
                    .foregroundColor(scheme.subtitleFontColor)

            }
        }
        .padding(.horizontal, scheme.containerHorizontalPadding)
    }
}

struct MxErrorView_Previews: PreviewProvider {
    static var previews: some View {
        let devices = ["iPhone SE (3rd generation)", "iPhone 11", "iPhone 14 Pro Max"]

        ForEach(devices, id: \.self) { deviceName in
            MxErrorView(errorDescription: "Something Happened")
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
