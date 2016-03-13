//: Playground - noun: a place where people can play

import UIKit
import GLKit
import OpenGLES

let frame = CGRect(x: 0, y: 0, width: 500, height: 300)

class MyView: GLKView {
    override func drawRect(rect: CGRect) {
        glClearColor(0.0, 0.0, 0.1, 1.0)
    }
}









