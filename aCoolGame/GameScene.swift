//
//  GameScene.swift
//  aCoolGame
//
//  Created by JAYDEN SAWYER on 2/20/25.
//


import SpriteKit
import GameplayKit



class GameScene: SKScene, SKPhysicsContactDelegate{
    var ball: SKSpriteNode!
    let cam = SKCameraNode()
    var death: SKSpriteNode!
    



    override func didMove(to view: SKView) {
        self.camera = cam
        ball = (self.childNode(withName: "ball") as! SKSpriteNode)
        physicsWorld.contactDelegate = self
        death = (self.childNode(withName: "death") as! SKSpriteNode)
    }

    func didBegin(_ contact: SKPhysicsContact) {
        print("collision happened")
        print("collision happened")
        if contact.bodyA.node?.name == "death" {
            reset()
        } else if contact.bodyB.node?.name == "death" {
            reset()
        }
           if contact.bodyA.node?.name == "coin" {
               contact.bodyA.node?.removeFromParent()
           }
           else if contact.bodyB.node?.name == "coin" {
               contact.bodyB.node?.removeFromParent()
           }
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        cam.position.x =  ball.position.x + 300

    }
    func reset() {
        ball.position = CGPoint(x: 0, y: -960)
    }


func jump() {
        print("Does this work")
        ball.physicsBody?.applyImpulse(CGVector(dx: 250, dy: 425))
      
}
}
