//
//  MessagesManager.swift
//  Polite Chat
//
//  Created by Roberto Gakiya Cruz on 21/09/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseFunctions

class MessagesManager: ObservableObject{
    
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId = ""
    let db = Firestore.firestore()
    
    // Initialize Cloud Functions
    lazy var functions = Functions.functions()
    
    
    init(){
        getMessages()
    }
    
    // Call Cloud Function
    
    func callCloud(message: String){
        
        print("Inside Cloud Call");
        
        functions.httpsCallable("retrieveData").call(["id": "\(UUID())", "text": message, "timestamp": Date().millisecondsSince1970]){
        
        // Handling Errors
        result, error in if let error = error as NSError? {
            if error.domain == FunctionsErrorDomain{
                /*let code = FunctionsErrorCode(rawValue: error.code)
                let message = error.localizedDescription
                let details = error.userInfo[FunctionsErrorDetailsKey]
            */}
        }
        
        // Retrieving result data
        if let data = result?.data as? [String: Any], let text = data["text"] as? String{
            print("In result return")
            print(data)
        }
    }
    }//callCloud()
    
    func getMessages(){
        db.collection("messages").addSnapshotListener{ querySnapshot, error in
            guard let documents = querySnapshot?.documents else{
            print("Error fetching Document: \(String(describing: error))")
            return
        }
            
            self.messages = documents.compactMap{
                document -> Message? in
                do{
                    return try document.data(as: Message.self)
                }catch{
                    print("Error decoding document into Message: \(error)")
                    return nil
                }
            }
            
            self.messages.sort {$0.timestamp < $1.timestamp }
            
            if let id = self.messages.last?.id {
                self.lastMessageId = id
            }
        }
        
    }//getMessages()
    
    func sendMessage(text: String){
        
        // Here I need to call the Cloud Function
        do{
            let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date().millisecondsSince1970)
            try db.collection("messages").document().setData(from: newMessage)
        }catch{
            print("Error sending Message: \(error)")
        }
    }
    
}
