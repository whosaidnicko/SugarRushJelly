//
//  GameView.swift
//  SugarRushJelly
//
//  Created by Nicolae Chivriga on 12/12/2024.
//

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    @State var loadingStart: Bool = false
    @State var finishLoad: Bool = false 
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Image("logotip")
                
                Image("shikoladki")
                    .rotationEffect(.degrees(loadingStart ? 720 : 0))
            }
            .opacity(finishLoad ? 0 : 1)
            
            WKWebViewRepresentable(url: URL(string: "https://plays.org/game/little-world-jellys/")!, onLoadCompletion: {
                withAnimation {
                    finishLoad = true
                }
            })
            .opacity(!finishLoad ? 0 : 1)
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: Image("backbtn")
            .resizable()
            .frame(width: 30, height: 30)
            .onTapGesture {
                dismiss()
            })
        .onAppear() {
            withAnimation(Animation.linear(duration: 3.5).repeatForever()) {
                loadingStart = true
            }
        }
    }
}
import WebKit
struct WKWebViewRepresentable: UIViewRepresentable {

   typealias UIViewType = WKWebView
   var url: URL
   var webView: WKWebView
   var onLoadCompletion: (() -> Void)?

   init(url: URL, webView: WKWebView = WKWebView(), onLoadCompletion: (() -> Void)? = nil) {
       self.url = url
       
       self.webView = webView
       self.webView.layer.opacity = 0
       self.onLoadCompletion = onLoadCompletion
   }

   func makeUIView(context: Context) -> WKWebView {
       webView.uiDelegate = context.coordinator
       webView.navigationDelegate = context.coordinator
       return webView
   }

   func updateUIView(_ uiView: UIViewType, context: Context) {
       let request = URLRequest(url: url)
       uiView.load(request)
       uiView.scrollView.isScrollEnabled = true
       uiView.scrollView.bounces = true
   }

   func makeCoordinator() -> Coordinator {
       Coordinator(self)
   }
}

extension WKWebViewRepresentable {

   final class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
       var parent: WKWebViewRepresentable
       private var webViews: [WKWebView]

       init(_ parent: WKWebViewRepresentable) {
           self.parent = parent
           
           self.webViews = []
       }

       func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
       
           if navigationAction.targetFrame == nil {
               let popupWebView = WKWebView(frame: .zero, configuration: configuration)
               popupWebView.navigationDelegate = self
               popupWebView.uiDelegate = self

               parent.webView.addSubview(popupWebView)
               popupWebView.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                   popupWebView.topAnchor.constraint(equalTo: parent.webView.topAnchor),
                   popupWebView.bottomAnchor.constraint(equalTo: parent.webView.bottomAnchor),
                   popupWebView.leadingAnchor.constraint(equalTo: parent.webView.leadingAnchor),
                   popupWebView.trailingAnchor.constraint(equalTo: parent.webView.trailingAnchor)
               ])

               self.webViews.append(popupWebView)
               return popupWebView
           }
           return nil
       }

       func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
           // Notify when page loading has finished
           parent.onLoadCompletion?()
           webView.layer.opacity = 1
       }

       func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
           decisionHandler(navigationAction.request.url == URL(string: "https://plays.org/game/little-world-jellys/") ? .allow : .cancel)
       }
   }

   func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
       return .all
   }
}
