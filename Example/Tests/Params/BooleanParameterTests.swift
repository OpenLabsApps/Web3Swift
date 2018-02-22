//
// This source file is part of the Web3Swift.io open source project.
// Copyright 2018 The Web3Swift Authors.
// Licensed under Apache License v2.0
//
// BooleanParameterTests.swift
//
// Created by Vadim Koleoshkin on 21/02/2018
//

import Nimble
import Quick
@testable import Web3Swift
import XCTest

class BooleanParameterTests: XCTestCase {
    
    /// BooleanParameter should return 'true' if it was passed into it
    func testBooleanParameterToTrue() {
        
        expect{
            try BooleanParameter(
                value: true
                ).value() as! Bool // swiftlint:disable:this force_cast
        }.to(
                equal(true)
        )
        
    }
    
    /// BooleanParameter should return 'false' if it was passed into it
    func testBooleanParameterToFalse() {
        
        expect{
            try BooleanParameter(
                value: false
                ).value() as! Bool // swiftlint:disable:this force_cast
        }.to(
                equal(false)
        )
        
    }
    
    /// BooleanParameter should NOT return 'false' if 'true' was passed into it
    func testBooleanParameterNotToTrue() {
        
        expect{
            try BooleanParameter(
                value: true
                ).value() as! Bool // swiftlint:disable:this force_cast
        }.notTo(
                equal(false)
        )
        
    }
    
}
