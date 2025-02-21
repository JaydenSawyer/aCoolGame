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

    



    override func didMove(to view: SKView) {
        self.camera = cam
        ball = (self.childNode(withName: "ball") as! SKSpriteNode)
        physicsWorld.contactDelegate = self
    }

    func didBegin(_ contact: SKPhysicsContact) {
        print("collision happened")
        if contact.bodyA.node?.name == "coin" {
            
        }
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        cam.position.x =  ball.position.x + 300

    }
    
}
