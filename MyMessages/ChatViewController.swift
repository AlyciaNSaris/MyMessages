//
//  ChatViewController.swift
//  MyMessages
//
//  Created by Alycia Saris on 11/11/20.
//  Copyright © 2020 Alycia Saris. All rights reserved.
//

import UIKit
import MessageKit

struct Sender: SenderType {
    var senderId: String
    
    var displayName: String
}

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
    
    
}

class ChatViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    
    let currentUser = Sender(senderId: "self", displayName: "iOS")
    
    let otherUser = Sender(senderId: "other", displayName: "John Smith")
    
    var messages = [MessageType]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        messages.append(Message(sender: currentUser,
                                messageId: "1",
                                sentDate: Date().addingTimeInterval(-86400),
                                kind: .text("Hello World")))
        messages.append(Message(sender: otherUser,
                                       messageId: "2",
                                       sentDate: Date().addingTimeInterval(-70000),
                                       kind: .text("How is it going?")))
        messages.append(Message(sender: currentUser,
                                       messageId: "3",
                                       sentDate: Date().addingTimeInterval(-66400),
                                       kind: .text("her is a super long reply about the woes of my life")))
        messages.append(Message(sender: otherUser,
                                       messageId: "4",
                                       sentDate: Date().addingTimeInterval(-56400),
                                       kind: .text("This thing works")))
        messages.append(Message(sender: currentUser,
                                       messageId: "5",
                                       sentDate: Date().addingTimeInterval(-46400),
                                       kind: .text("I am having so much fun making apps")))
        messages.append(Message(sender: otherUser,
                                       messageId: "5",
                                       sentDate: Date().addingTimeInterval(-26400),
                                       kind: .text("Peace out!!")))
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
