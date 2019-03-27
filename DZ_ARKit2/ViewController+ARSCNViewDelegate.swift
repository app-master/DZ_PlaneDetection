//
//  ViewController+ARSCNViewDelegate.swift
//  DZ_ARKit2
//
//  Created by user on 27/03/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import ARKit

extension ViewController: ARSCNViewDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        guard let anchor = anchor as? ARPlaneAnchor else { return }
        guard let karambitNode = loadKarambit(for: anchor) else { return }
        
        node.addChildNode(karambitNode)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        
        guard let anchor = anchor as? ARPlaneAnchor else { return }
        guard let childNode = node.childNodes.first else { return }
        guard childNode.name == "Karambit" else { return }
        
        updateKarambit(childNode, for: anchor)
    }
    
    // MARK: --Methods
    
    func loadKarambit(for anchor: ARPlaneAnchor) -> SCNNode? {
        
        guard let scene = SCNScene(named: "art.scnassets/karambit.scn") else { return nil }
        let karambitNode = scene.rootNode.clone()
        karambitNode.position = SCNVector3(anchor.center.x, 0, anchor.center.z)
        karambitNode.name = "Karambit"
        
        return karambitNode
    }
    
    func updateKarambit(_ karambit:SCNNode, for anchor: ARPlaneAnchor) {
         karambit.position = SCNVector3(anchor.center.x, 0, anchor.center.y)
    }
    
}
