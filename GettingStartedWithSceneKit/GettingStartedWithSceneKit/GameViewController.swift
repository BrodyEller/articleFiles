import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = SCNScene()
        let scnView = self.view as! SCNView
        scnView.scene = scene
        //scnView.allowsCameraControl = true
        //scnView.autoenablesDefaultLighting = true
        scnView.showsStatistics = true
        scnView.backgroundColor = UIColor.blackColor()
        
        let sphereGeometry = SCNSphere(radius: 2)
        sphereGeometry.firstMaterial?.diffuse.contents = UIImage(named: "world.topo.bathy.200412.3x5400x2700.png")
        let sphereNode = SCNNode(geometry: sphereGeometry)
        sphereNode.position = SCNVector3Zero
        scene.rootNode.addChildNode(sphereNode)
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 8)
        scene.rootNode.addChildNode(cameraNode)
        
        let omniLight = SCNLight()
        omniLight.type = SCNLightTypeOmni
        let omniLightNode = SCNNode()
        omniLightNode.light = omniLight
        omniLightNode.position = SCNVector3Make(10, 10, 10)
        scene.rootNode.addChildNode(omniLightNode)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        
        return true
        
    }
    
}