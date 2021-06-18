//
//  WalkTroughView.swift
//  VIPPattern
//
//  Created by Andres Felipe Ocampo Eljaiek on 18/6/21.
//

import SwiftUI


struct WalkTroughView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        ZStack{
            if currentPage == 1 {
                ScreenView(image: "Image1", title: "Step 1", detail: "Welcome to Inditex App in SwiftUI", bgColor: Color.white)
                    .transition(.scale)
            }
            if currentPage == 2 {
                ScreenView(image: "Image2", title: "Step 2", detail: "Welcome to Inditex App", bgColor: Color.red)
                    .transition(.scale)
            }
            if currentPage == 3 {
                ScreenView(image: "Image3", title: "Step 3", detail: "Welcome to Inditex", bgColor: Color.blue)
                    .transition(.scale)
            }
        }.overlay(
            Button(action: {
                //here a will change a currentPage
                withAnimation(.easeInOut){
                    if currentPage <= Constants.totalPages {
                        currentPage += 1
                    } else {
                        currentPage = 1
                    }
                }
            }, label: {
                Image(systemName: "chevron.right").font(.system(size: 20, weight: .semibold)).foregroundColor(.black).frame(width: 30, height: 30)
                    .background(Color.gray)
                    .clipShape(Circle())
                    .overlay(
                        ZStack{
                            Circle().stroke(Color.black.opacity(0.2), lineWidth: 2)
                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage) / CGFloat(Constants.totalPages))
                                .stroke(Color.black, lineWidth: 3)
                                .rotationEffect(.degrees(-90))
                        }
                        .padding(-15)
                    )
            })
            .padding(.bottom, 20), alignment: .bottom
        )
    }
}

struct ScreenView: View {
    
    var image: String
    var title: String
    var detail: String
    var bgColor: Color
    
    @AppStorage("currentPage") var currentPage = 2
    
    var body: some View {
        VStack(spacing: 20) {
            HStack{
                // show if is only first page
                if currentPage == 1 {
                    Text("Welcome to Inditex").font(.title).fontWeight(.semibold).kerning(1.4)
                } else {
                    Button(action: {
                        withAnimation(.easeInOut){
                            currentPage -= 1
                        }
                    }, label: {
                        Image(systemName: "chevron.left").foregroundColor(.black).padding(.vertical, 10).padding(.horizontal)
                            .background(Color.black.opacity(0.2)).clipShape(Circle())
                    })
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut) {
                        currentPage = 4
                    }
                }, label: {
                    Text("Skip").fontWeight(.semibold).kerning(1.4)
                })
            }
            .foregroundColor(.black)
            .padding()
            
            Spacer()
            
            Image(image).resizable().aspectRatio(contentMode: .fit)
            Text(title).font(.title).fontWeight(.bold).foregroundColor(.black).padding(.top)
            Text(detail).fontWeight(.semibold).kerning(1.4).multilineTextAlignment(.center)
            
            Spacer(minLength: 120)
        }
        .background(bgColor.ignoresSafeArea())
    }
}

struct WalkTroughView_Previews: PreviewProvider {
    static var previews: some View {
        WalkTroughView()
    }
}
