//
//  ContentView.swift
//  TemperatureControl
//
//  Created by Anik on 10/9/20.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.init(red: 34/255, green: 30/255, blue: 47/255))
                .edgesIgnoringSafeArea(.all)
            
            TemperatureControlView()
        }
    }
}

struct TemperatureControlView: View {
    @ObservedObject var picIsland = PicIslandViewModel()
    @State var indexOfTopIcon: Int = 0
    @State var angleValue: CGFloat = 0.0
    let config = Config(minimumValue: 0.0,
                        maximumValue: 12.0,
                        totalValue: 12.0,
                        knobRadius: 5.0,
                        radius: 125.0)
    var body: some View {
        
            
        ZStack {
//            Circle()
//                .background()
//                .frame(width: config.radius * 2, height: config.radius * 2)
//                .scaleEffect(1.2)
            Image("GlobeEarth1").resizable().scaledToFit()
//            Circle()
//                .stroke(Color.gray,
//                        style: StrokeStyle(lineWidth: 3, lineCap: .butt, dash: [3, 23.18]))
//                .frame(width: config.radius * 2, height: config.radius * 2)
            
//            Circle()
//                .trim(from: 0.0, to: CGFloat(indexOfTopIcon)/config.totalValue)
//                .stroke(CGFloat(indexOfTopIcon) < config.maximumValue/2 ? Color.blue : Color.red, lineWidth: 4)
//                .frame(width: config.radius * 2, height: config.radius * 2)
//                .rotationEffect(.degrees(-90))
                
            circleIcons
            
            Circle()
                .fill( Color.red)
                .frame(width: config.knobRadius * 2, height: config.knobRadius * 2)
                .padding(10)
                .offset(y: -config.radius)
                .rotationEffect(Angle.degrees(Double(angleValue)))
                .gesture(DragGesture(minimumDistance: 0.0)
                            .onChanged({ value in
                                change(location: value.location)
                            }))
            
            Text("\( indexOfTopIcon) ")
                            .font(.system(size: 60))
                            .foregroundColor(.white)
        }
       
        
    }
    
    private func change(location: CGPoint) {
        // creating vector from location point
        let vector = CGVector(dx: location.x, dy: location.y)
        
        // geting angle in radian need to subtract the knob radius and padding from the dy and dx
        let angle = atan2(vector.dy - (config.knobRadius + 10), vector.dx - (config.knobRadius + 10)) + .pi/2.0
        
        // convert angle range from (-pi to pi) to (0 to 2pi)
        let fixedAngle = angle < 0.0 ? angle + 2.0 * .pi : angle
        // convert angle value to temperature value
        let value = fixedAngle / (2.0 * .pi) * config.totalValue
        
        if value >= config.minimumValue && value <= config.maximumValue {
            indexOfTopIcon = Int(value)
            
            angleValue = fixedAngle * 180 / .pi // converting to degree
        }
    }
    var positions = [CGPoint(x: 0,y: 1)
                     , CGPoint(x: 0.5, y: 0.866)
                     , CGPoint(x: 0.866, y: 0.5)
                     , CGPoint(x: 1,y: 0)
                     , CGPoint(x: 0.886,y: -0.5)
                     , CGPoint(x: 0.5,y: -0.886)
                     , CGPoint(x: 0,y: -1)
                     , CGPoint(x: -0.5,y: -0.886)
                     , CGPoint(x: -0.886,y: -0.6)
                     , CGPoint(x: -1,y: 0)
                     , CGPoint(x: -0.886,y: 0.5)
                     , CGPoint(x: -0.5,y: 0.886)
    ]
   
    var circleIcons : some View {
        GeometryReader{ geo in
            ForEach(0..<picIsland.icons.count){ i in
                let iAfterRotate : Int = rotateN(i)
                var centerX : CGFloat = geo.size.width / 2
                var centerY : CGFloat = geo.size.height / 2
                Image(systemName: picIsland.icons[i].systemName)
                    
                    .position(x: positions[iAfterRotate].x * config.radius + centerX, y: -positions[iAfterRotate].y * config.radius + centerY)
                    .foregroundColor(.orange)
            }
        }
    }
    func rotateN(_ i : Int) -> Int{
        if i + indexOfTopIcon > 11 {
            
            return i + indexOfTopIcon - 12
        }else{
            return i + indexOfTopIcon
        }
    }
}

struct Config {
    let minimumValue: CGFloat
    let maximumValue: CGFloat
    let totalValue: CGFloat
    let knobRadius: CGFloat
    let radius: CGFloat
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
