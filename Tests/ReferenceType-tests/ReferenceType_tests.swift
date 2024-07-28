//
//  ReferenceType_tests.swift
//  
//
//  Created by Jeremy Bannister on 3/23/23.
//

///
@_exported import ReferenceTypeTestToolkit


///
extension ReferenceType_tests {
    
    ///
    func test_objectID() throws {
        
        /// Since `ReferenceType.objectID` is an action with side-effects we test all permutations of assertions about the two object IDs
        func assertions<
            Object1: ReferenceType,
            Object2: ReferenceType
        >(
            _ object1: Object1,
            _ object2: Object2
        ) throws {
            
            ///
            try object1.objectID.assertEqual(to: object1.objectID)
            try object1.objectID.assertNotEqual(to: object2.objectID)
            try object2.objectID.assertNotEqual(to: object1.objectID)
            try object2.objectID.assertEqual(to: object2.objectID)
        }
        
        /// Repeat the assertions twice because side-effects involved
        func repeatedAssertions<
            Object1: ReferenceType,
            Object2: ReferenceType
        >(
            _ object1: Object1,
            _ object2: Object2
        ) throws {
            
            ///
            try assertions(object1, object2)
            try assertions(object1, object2)
        }
        
        ///
        final class Foo: ReferenceType { }
        
        ///
        let foo1 = Foo()
        let foo2 = Foo()
        
        ///
        try repeatedAssertions(foo1, foo2)
        
        /// Check that a second type does not cause problems
        final class Bar: ReferenceType { }
        
        ///
        let bar1 = Bar()
        let bar2 = Bar()
        
        ///
        try repeatedAssertions(foo1, bar1)
        try repeatedAssertions(bar1, bar2)
        try repeatedAssertions(bar1, foo2)
        try repeatedAssertions(foo1, bar2)
        
        /// Check that subclassing does not cause problems
        class Baz: ReferenceType { }
        class Bop: Baz { }
        
        ///
        let baz = Baz()
        let bop = Bop()
        
        ///
        try repeatedAssertions(baz, bop)
        try repeatedAssertions(baz, foo1)
        try repeatedAssertions(bop, bar2)
    }
}
