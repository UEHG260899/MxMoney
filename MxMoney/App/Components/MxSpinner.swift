//
//  MxSpinner.swift
//  MxMoney
//
//  Created by Uriel Hernandez Gonzalez on 29/03/23.
//

import SwiftUI
import Lottie

struct MxSpinner: UIViewRepresentable {
    let animationView = LottieAnimationView(frame: .zero)

    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)

        animationView.animation = LottieAnimation.named("loading")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()

        view.addSubview(animationView)

        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
}
