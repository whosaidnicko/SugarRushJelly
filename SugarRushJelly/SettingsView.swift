//
//  SettingsView.swift
//  SugarRushJelly
//
//  Created by Nicolae Chivriga on 18/12/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    @Environment(\.requestReview) var requestReview
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .ignoresSafeArea()
            
           Image("rules")
                .overlay {
                    VStack {
                        Button {
                            requestReview()
                        } label: {
                            Image("rectbn")
                                .overlay {
                                    StrokeText(text: "Rate Us", width: 4, color: .purple)
                                        .foregroundStyle(.white)
                                        .font(.custom(Font.alfaSlab, size: 48))
                                }
                        }

                        
                    }
                }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: Image("backbtn")
            .resizable()
            .frame(width: 30, height: 30)
            .onTapGesture {
                dismiss()
            })
    }
}
import WebKit
import SwiftUI
extension View {
    @ViewBuilder
    func allCeoer(orientation: UIInterfaceOrientationMask) -> some View {
        self.onAppear() {
            AppDelegate.eroskei = orientation
        }
        // Reset orientation to previous setting
        let currentOrientation = AppDelegate.eroskei
        self.onDisappear() {
            AppDelegate.eroskei = currentOrientation
        }
    }
//    func adaptModifre() -> some View {
//        self.modifier(AdapterDevicesModifer())
//    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    static var eroskei = UIInterfaceOrientationMask.portrait {
        didSet {
            if #available(iOS 16.0, *) {
                UIApplication.shared.connectedScenes.forEach { scene in
                    if let windowScene = scene as? UIWindowScene {
                        windowScene.requestGeometryUpdate(.iOS(interfaceOrientations: eroskei))
                    }
                }
                UIViewController.attemptRotationToDeviceOrientation()
            } else {
                if eroskei == .landscape {
                    UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
                } else {
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                }
            }
        }
    }

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.eroskei
    }
}
