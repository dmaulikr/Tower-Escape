//
//  GameScene.swift
//  Tower Escape
//
//  Created by Ikram and Aaqil on 29/12/16.
//  Copyright © 2016 Ikram. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var left: SKShapeNode?
    var right: SKShapeNode?
    var jump: SKShapeNode?
    
    let player = SKSpriteNode(imageNamed: "player")

    let moveRight = SKAction.moveBy(x: 30, y: 0, duration: 1.0)
    let moveLeft = SKAction.moveBy(x: -30, y: 0, duration: 1.0)
    let jumpUp = SKAction.moveBy(x: 0, y: 40, duration: 1.0)
    
    override func didMove(to view: SKView) {
        self.scaleMode = .aspectFill
        
        self.anchorPoint = CGPoint(x:0, y:0)
        
        
        left = SKShapeNode(rect: CGRect(x:0, y:0, width:size.width/4, height:size.height/2))
        right = SKShapeNode(rect: CGRect(x:size.width/4, y:0, width:size.width/4, height:size.height/2))
        jump =  SKShapeNode(rect: CGRect(x:size.width/2, y:0, width:size.width/2, height:size.height/2))
        jump?.fillColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        
        player.position = CGPoint(x:size.width/2, y:size.height/2)
        player.physicsBody = SKPhysicsBody()
        player.physicsBody?.affectedByGravity = true
        
        self.physicsBody? = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        
        addChild(left!)
        addChild(right!)
        addChild(player)
        
        
    }
    
    func touched(at point:CGPoint) {
        if (right?.contains(point))! {
            player.run(moveRight)
        }
        if (left?.contains(point))! {
            player.run(moveLeft)
        }
        if (jump?.contains(point))! {
            player.run(jumpUp)
        }
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for n in touches {
            touched(at:n.location(in: self))
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for n in touches {
            touched(at:n.location(in: self))
        }
    }
}
