//
//  CommunicationService.swift
//  OperationQueueTests
//
//  Created by Miguel Figueroa on 4/14/22.
//

import Foundation
import UIKit

class CommunicationService {
    var delegate: CommunicationDelegate? = nil
    
    private static var instance: CommunicationService? = nil
    var commandsQueue: OperationQueue = OperationQueue()
    
    let connectOperation = BlockOperation {
        print("library function running")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            NotificationCenter.default.post(name: .deviceSet, object: nil)
        }
    }
    
    let secondOperation = BlockOperation {
        print("this second operation needs to depnd on the first thing being done")
    }
    
    
    
    
    
    public static func getInstance() -> CommunicationService {
        if instance == nil {
            instance = CommunicationService()
        }
        return instance!
    }
    
    public func setDelegate(_ delegate: CommunicationDelegate) {
        self.delegate = delegate
    }
    
}

let theConnectedDevice: Device = Device(id: 4, name: "AwesomeDevice")




public protocol CommunicationDelegate {
    func onConnection()
}




public class Device: Identifiable {
    public let id: Int
    public var name: String
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    func sendCallback() {
        
    }
}
