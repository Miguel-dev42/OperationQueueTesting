//
//  ViewModel.swift
//  OperationQueueTests
//
//  Created by Miguel Figueroa on 4/14/22.
//

import Foundation

class ViewModel: NSObject, ObservableObject {
    
    @Published var service = CommunicationService.getInstance()
    @Published var text: String = "Not Connected"
    var connectedDevice: Device?
    
    func connectToDevice() {
        service.commandsQueue.addOperation(self.service.connectOperation)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.connectedDevice = theConnectedDevice
        }
    }
    
    let connectionCallback = BlockOperation {
        print("runningCallbackBlock")
    }
    
    @objc func connectedSuccessfully() {
        print("device \(String(describing: connectedDevice?.name)) connected succesfully")
        service.secondOperation.addDependency(connectionCallback)
        service.commandsQueue.addOperation(connectionCallback)
        service.commandsQueue.addOperation(service.secondOperation)
    }
    
    override init() {
        super.init()
        service.setDelegate(self)
        NotificationCenter.default.addObserver(self, selector: #selector(connectedSuccessfully), name: .deviceSet, object: nil)
    }
    
}



extension ViewModel: CommunicationDelegate {
    
    func onConnection() {
        print("update connection stuff")
    }
    
    
}



extension Notification.Name {
    static let deviceSet = Notification.Name("deviceSet")
}
