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
        if contact.bodyA.node?.name == "ball" && contact.bodyB.node?.name == "death" {
            reset()
        } else if contact.bodyA.node?.name == "death" && contact.bodyB.node?.name == "ball" {
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
        
        cam.position.x =  ball.position.x + 300
        
    }
    func reset() {
        ball.position = CGPoint(x: -960, y: 0)
        print("Am I DED")
        
    }
    
    
    func jump() {
        print("Does this work")
        ball.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 425))
        
    }
    
}
