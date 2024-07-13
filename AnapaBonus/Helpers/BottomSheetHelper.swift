//
//  BottomSheetHelper.swift
//  AnapaBonus
//
//  Created by Дмитрий Цепилов on 13.07.2024.
//

import SwiftUI

extension View {
  @ViewBuilder
    
    func bottomMaskForSheet(mask: Bool = true,_ height: CGFloat = 49) -> some View{
        self
            .background(SheetRootViewFinder(mask: mask, height: height))
    }
}

// Helpers
fileprivate struct SheetRootViewFinder: UIViewRepresentable {
    var mask: Bool
    var height: CGFloat
    
    func makeUIView(context: Context) ->  UIView {
        return.init()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
            
        
            
            if let rootView = uiView.viewBeforWindow, let window  = rootView.window{
                let safeArea = window.safeAreaInsets
                // Измение высоты образом, чтобы в нижней части появилось пустое пространство
                rootView.frame = .init(
                    origin: .zero,
                    size: .init(
                        width: window.frame.width,
                        height: window.frame.height - (mask ? (height + safeArea.bottom) : 0)
                    )
                )
                rootView.clipsToBounds = true
                for view in rootView.subviews{
                    view.layer.shadowColor = UIColor.clear.cgColor
                    
                    if view.layer.animationKeys() != nil {
                        if let cornerRadiusView = view.allSubView.first(where: {
                            $0.layer.animationKeys()?.contains("cornerRadius") ?? false
                        }) {
                            cornerRadiusView.layer.maskedCorners = []
                        }
                    }
                    
                }
            }
        }
    }
    
    
}
    fileprivate extension UIView{
        var viewBeforWindow: UIView? {
            if let superview, superview is UIWindow{
                return self
            }
            return superview?.viewBeforWindow
        }
        
        var allSubView: [UIView]{
            return subviews.flatMap{ [$0] + $0.subviews }
        }
        
    }
    


#Preview {
    ContentView()
}

