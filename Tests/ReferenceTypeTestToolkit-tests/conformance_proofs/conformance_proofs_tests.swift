//
//  conformance_proofs_tests.swift
//  
//
//  Created by Jeremy Bannister on 3/23/23.
//

///
extension ReferenceType_tests {
    
    ///
    func proofOfExistenceOf_proofOfConformanceTo_ReferenceType() {
        func imagine<T: ReferenceType>(t: T) {
            t.proofOfConformanceTo_ReferenceType()
            T.proofOfConformanceTo_ReferenceType()
        }
    }
}
