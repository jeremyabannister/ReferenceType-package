//
//  ReferenceType.swift
//  
//
//  Created by Jeremy Bannister on 3/23/23.
//

///
public protocol ReferenceType: AnyObject { }

///
private let accessQueue = DispatchQueue(label: "objectIDAccessQueue")
private var nextObjectID = ObjectID(number: 0)
private var claimedObjectIDs: [ObjectIdentifier: ObjectID] = [:]

///
extension ReferenceType {
    
    ///
    public var systemObjectIdentifier: ObjectIdentifier {
        ObjectIdentifier(self)
    }
    
    ///
    public var objectID: ObjectID {
        
        ///
        let systemIdentifier = self.systemObjectIdentifier
            
        ///
        return accessQueue.sync {
            
            ///
            if let objectID = claimedObjectIDs[systemIdentifier] {
                
                ///
                return objectID
                
            } else {
                
                ///
                let nextID = nextObjectID
                
                ///
                claimedObjectIDs[systemIdentifier] = nextID
                
                ///
                nextObjectID.increment()
                
                ///
                return nextID
            }
        }
    }
}

///
public struct ObjectID: ValueType {
    
    ///
    fileprivate let number: Int
    
    ///
    fileprivate mutating func increment() {
        self = ObjectID(number: number.plus(1))
    }
}

///
extension ObjectID: CustomStringConvertible {
    
    ///
    public var description: String {
        "ObjectID(\(number))"
    }
}
