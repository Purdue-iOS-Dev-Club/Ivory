//
//  WebSocketClient.swift
//  Ivory
//
//  Created by George Lo on 4/21/16.
//  Copyright © 2016 Purdue iOS Dev Club. All rights reserved.
//

import UIKit
import Starscream

class WebSocketClient: NSObject, WebSocketDelegate {
    
    private var socket: WebSocket
    static let sharedInstance = WebSocketClient()
    
    override init() {
        socket = WebSocket(url: NSURL(string: "ws://162.243.22.154:3939/")!)
        super.init()
        socket.delegate = self
        socket.connect()
    }

    // MARK: WebSocketDelegate
    
    func websocketDidConnect(socket: WebSocket) {
        print("websocket is connected")
    }
    
    func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        print("websocket is disconnected: \(error?.localizedDescription)")
    }
    
    func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        print("got some text: \(text)")
    }
    
    func websocketDidReceiveData(socket: WebSocket, data: NSData) {
        print("got some data: \(data.length)")
    }
    
    // MARK: Write functions
    
    func writeObject(object: AnyObject) {
        socket.writeData(NSKeyedArchiver.archivedDataWithRootObject(object))
    }
    
    func writeString(string: String) {
        socket.writeString(string)
    }
    
    func writePing(data: NSData) {
        socket.writePing(data)
    }
}
