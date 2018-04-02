/**
Copyright 2018 Timofey Solonin

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import CryptoSwift
import Nimble
import Quick
@testable import Web3Swift

//swiftlint:disable file_length

final class ABIIT: XCTestCase {

    func testTwoDimensionalDynamicArrayOfTwoEncoding() {
        expect{
            try ConcatenatedBytes(
                bytes: ABITuple(
                    parameters: [
                        ABIDynamicCollection(
                            parameters: [
                                ABIDynamicCollection(
                                    parameters: [
                                        ABIAddress(
                                            address: EthAddress(
                                                hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c5"
                                            )
                                        )
                                    ]
                                ),
                                ABIDynamicCollection(
                                    parameters: [
                                        ABIAddress(
                                            address: EthAddress(
                                                hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c3"
                                            )
                                        )
                                    ]
                                )
                            ]
                        ),
                    ]
                ).heads(offset: 0)
            ).value()
        }.to(
            equal(
                Data(
                    hex:"0000000000000000000000000000000000000000000000000000000000000020" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "0000000000000000000000000000000000000000000000000000000000000080" +
                        "00000000000000000000000000000000000000000000000000000000000000c0" +
                        "0000000000000000000000000000000000000000000000000000000000000001" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c5" +
                        "0000000000000000000000000000000000000000000000000000000000000001" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c3"
                )
            ),
            description: "address[][]"
        )
    }

    func testTwoDimensionalDynamicArrayOfFourEncoding() {
        expect{
            try ConcatenatedBytes(
                bytes: ABITuple(
                    parameters: [
                        ABIDynamicCollection(
                            parameters: [
                                ABIDynamicCollection(
                                    parameters: [
                                        ABIAddress(
                                            address: EthAddress(
                                                hex: "0x407d73d8a49eeb85d32cf465507dd71d507100cf"
                                            )
                                        ),
                                        ABIAddress(
                                            address: EthAddress(
                                                hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c2"
                                            )
                                        )
                                    ]
                                ),
                                ABIDynamicCollection(
                                    parameters: [
                                        ABIAddress(
                                            address: EthAddress(
                                                hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c3"
                                            )
                                        ),
                                        ABIAddress(
                                            address: EthAddress(
                                                hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c4"
                                            )
                                        )
                                    ]
                                )
                            ]
                        ),
                    ]
                ).heads(offset: 0)
            ).value()
        }.to(
            equal(
                Data(
                    hex:"0000000000000000000000000000000000000000000000000000000000000020" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "0000000000000000000000000000000000000000000000000000000000000080" +
                        "00000000000000000000000000000000000000000000000000000000000000e0" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100cf" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c2" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c3" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c4"
                )
            ),
            description: "address[][]"
        )
    }

    func testSingleAddress() {
        expect{
            try ConcatenatedBytes(
                bytes: ABITuple(
                    parameters: [
                        ABIAddress(
                            address: EthAddress(
                                hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c1"
                            )
                        )
                    ]
                ).heads(offset: 0)
            ).value()
        }.to(
            equal(
                Data(hex: "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c1")
            ),
            description: "address"
        )
    }

    func testAddressFixedArrayOfTwo() {
        expect{
            try ConcatenatedBytes(
                bytes: ABITuple(
                    parameters: [
                        ABITuple(
                            parameters: [
                                ABIAddress(
                                    address: EthAddress(
                                        hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c1"
                                    )
                                ),
                                ABIAddress(
                                    address: EthAddress(
                                        hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c3"
                                    )
                                )
                            ]
                        )
                    ]
                ).heads(offset: 0)
            ).value()
        }.to(
            equal(
                Data(
                    hex:"000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c1" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c3"
                )
            ),
            description: "address[2]"
        )
    }

    func testAddressDynamicArrayOfTwo() {
        expect{
            try ConcatenatedBytes(
                bytes: ABITuple(
                    parameters: [
                        ABIDynamicCollection(
                            parameters: [
                                ABIAddress(
                                    address: EthAddress(
                                        hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c1"
                                    )
                                ),
                                ABIAddress(
                                    address: EthAddress(
                                        hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c3"
                                    )
                                )
                            ]
                        )
                    ]
                ).heads(offset: 0)
            ).value()
        }.to(
            equal(
                Data(
                    hex:"0000000000000000000000000000000000000000000000000000000000000020" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c1" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c3"
                )
            ),
            description: "address[]"
        )
    }

    func testAddressStaticArrayOfDynamicArraysOf2() {
        expect{
            try ConcatenatedBytes(
                bytes: ABITuple(
                    parameters: [
                        ABIDynamicCollection(
                            parameters: [
                                ABIAddress(
                                    address: EthAddress(
                                        hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c1"
                                    )
                                ),
                                ABIAddress(
                                    address: EthAddress(
                                        hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c2"
                                    )
                                )
                            ]
                        ),
                        ABIDynamicCollection(
                            parameters: [
                                ABIAddress(
                                    address: EthAddress(
                                        hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c3"
                                    )
                                ),
                                ABIAddress(
                                    address: EthAddress(
                                        hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c4"
                                    )
                                )
                            ]
                        )
                    ]
                ).heads(offset: 0)
            ).value()
        }.to(
            equal(
                Data(
                    hex:"0000000000000000000000000000000000000000000000000000000000000040" +
                        "00000000000000000000000000000000000000000000000000000000000000a0" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c1" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c2" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c3" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c4"
                )
            ),
            description: "address[][2]"
        )
    }

    func testAddressDynamicArrayOfStaticArraysOf2() {
        expect{
            try ConcatenatedBytes(
                bytes: ABITuple(
                    parameters: [
                        ABIDynamicCollection(
                            parameters: [
                                ABITuple(
                                    parameters: [
                                        ABIAddress(
                                            address: EthAddress(
                                                hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c1"
                                            )
                                        ),
                                        ABIAddress(
                                            address: EthAddress(
                                                hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c2"
                                            )
                                        )
                                    ]
                                ),
                                ABITuple(
                                    parameters: [
                                        ABIAddress(
                                            address: EthAddress(
                                                hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c3"
                                            )
                                        ),
                                        ABIAddress(
                                            address: EthAddress(
                                                hex: "0x407d73d8a49eeb85d32cf465507dd71d507100c4"
                                            )
                                        )
                                    ]
                                )
                            ]
                        )
                    ]
                ).heads(offset: 0)
            ).value()
        }.to(
            equal(
                Data(
                    hex:"0000000000000000000000000000000000000000000000000000000000000020" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c1" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c2" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c3" +
                        "000000000000000000000000407d73d8a49eeb85d32cf465507dd71d507100c4"
                )
            ),
            description: "address[2][]"
        )
    }

    func testFixedBytesAndVariableBytes() {
        expect{
            try ConcatenatedBytes(
                bytes: ABITuple(
                    parameters: [
                        ABIFixedBytes(
                            origin: BytesFromHexString(
                                hex: "0xcf0011"
                            )
                        ),
                        ABIVariableBytes(
                            origin: BytesFromHexString(
                                hex:"0x4d00000000000000000000000000000000000000000000000000000000000012"
                            )
                        )
                    ]
                ).heads(offset: 0)
            ).value()
        }.to(
            equal(
                Data(
                    hex:"cf00110000000000000000000000000000000000000000000000000000000000" +
                        "0000000000000000000000000000000000000000000000000000000000000040" +
                        "0000000000000000000000000000000000000000000000000000000000000020" +
                        "4d00000000000000000000000000000000000000000000000000000000000012"
                )
            ),
            description: "bytes3, bytes"
        )
    }

    func testNumberBytesNumberBytes() {
        expect{
            try ConcatenatedBytes(
                bytes: ABITuple(
                    parameters: [
                        ABIUnsignedNumber(
                            origin: BigEndianNumber(
                                uint: 5
                            )
                        ),
                        ABIVariableBytes(
                            origin: BytesFromHexString(
                                hex:"0x131a3afc00d1b1e3461b955e53fc866dcf303b3eb9f4c16f89e388930f48134b231a3afc00d1b1e3461b955e53fc866dcf303b3eb9f4c16f89e388930f48134b"
                            )
                        ),
                        ABIUnsignedNumber(
                            origin: BigEndianNumber(
                                uint: 3
                            )
                        ),
                        ABIVariableBytes(
                            origin: BytesFromHexString(
                                hex:"0x331a3afc00d1b1e3461b955e53fc866dcf303b3eb9f4c16f89e388930f48134b431a3afc00d1b1e3461b955e53fc866dcf303b3eb9f4c16f89e388930f48134b"
                            )
                        )
                    ]
                ).heads(offset: 0)
            ).value()
        }.to(
            equal(
                Data(
                    hex:"0000000000000000000000000000000000000000000000000000000000000005" +
                        "0000000000000000000000000000000000000000000000000000000000000080" +
                        "0000000000000000000000000000000000000000000000000000000000000003" +
                        "00000000000000000000000000000000000000000000000000000000000000e0" +
                        "0000000000000000000000000000000000000000000000000000000000000040" +
                        "131a3afc00d1b1e3461b955e53fc866dcf303b3eb9f4c16f89e388930f48134b" +
                        "231a3afc00d1b1e3461b955e53fc866dcf303b3eb9f4c16f89e388930f48134b" +
                        "0000000000000000000000000000000000000000000000000000000000000040" +
                        "331a3afc00d1b1e3461b955e53fc866dcf303b3eb9f4c16f89e388930f48134b" +
                        "431a3afc00d1b1e3461b955e53fc866dcf303b3eb9f4c16f89e388930f48134b"
                )
            ),
            description: "int, bytes, int, bytes"
        )
    }

    func testNumberBytesNumberNumberNumberDynamicNumbersArray() {
        expect{
            try ConcatenatedBytes(
                bytes: ABITuple(
                    parameters: [
                        ABIUnsignedNumber(
                            origin: BigEndianNumber(
                                uint: 1
                            )
                        ),
                        ABIString(
                            origin: SimpleString(
                                string: "gavofyork"
                            )
                        ),
                        ABIUnsignedNumber(
                            origin: BigEndianNumber(
                                uint: 2
                            )
                        ),
                        ABIUnsignedNumber(
                            origin: BigEndianNumber(
                                uint: 3
                            )
                        ),
                        ABIUnsignedNumber(
                            origin: BigEndianNumber(
                                uint: 4
                            )
                        ),
                        ABIDynamicCollection(
                            parameters: [
                                ABIUnsignedNumber(
                                    origin: BigEndianNumber(
                                        uint: 5
                                    )
                                ),
                                ABIUnsignedNumber(
                                    origin: BigEndianNumber(
                                        uint: 6
                                    )
                                ),
                                ABIUnsignedNumber(
                                    origin: BigEndianNumber(
                                        uint: 7
                                    )
                                )
                            ]
                        )
                    ]
                ).heads(offset: 0)
            ).value()
        }.to(
            equal(
                Data(
                    hex:"0000000000000000000000000000000000000000000000000000000000000001" +
                        "00000000000000000000000000000000000000000000000000000000000000c0" +
                        "0000000000000000000000000000000000000000000000000000000000000002" +
                        "0000000000000000000000000000000000000000000000000000000000000003" +
                        "0000000000000000000000000000000000000000000000000000000000000004" +
                        "0000000000000000000000000000000000000000000000000000000000000100" +
                        "0000000000000000000000000000000000000000000000000000000000000009" +
                        "6761766f66796f726b0000000000000000000000000000000000000000000000" +
                        "0000000000000000000000000000000000000000000000000000000000000003" +
                        "0000000000000000000000000000000000000000000000000000000000000005" +
                        "0000000000000000000000000000000000000000000000000000000000000006" +
                        "0000000000000000000000000000000000000000000000000000000000000007"
                )
            ),
            description: "int, string, int, int, int, int[]"
        )
    }

    func testTwoDynamicIntArrays() {
        func testNumberBytesNumberBytes() {
            expect{
                try ConcatenatedBytes(
                    bytes: ABITuple(
                        parameters: [
                            ABIDynamicCollection(
                                parameters: [
                                    ABIUnsignedNumber(
                                        origin: BigEndianNumber(
                                            uint: 1
                                        )
                                    ),
                                    ABIUnsignedNumber(
                                        origin: BigEndianNumber(
                                            uint: 2
                                        )
                                    )
                                ]
                            ),
                            ABIDynamicCollection(
                                parameters: [
                                    ABIUnsignedNumber(
                                        origin: BigEndianNumber(
                                            uint: 3
                                        )
                                    ),
                                    ABIUnsignedNumber(
                                        origin: BigEndianNumber(
                                            uint: 4
                                        )
                                    )
                                ]
                            )
                        ]
                    ).heads(offset: 0)
                ).value()
            }.to(
                equal(
                    Data(
                        hex:"0000000000000000000000000000000000000000000000000000000000000040" +
                            "00000000000000000000000000000000000000000000000000000000000000a0" +
                            "0000000000000000000000000000000000000000000000000000000000000002" +
                            "0000000000000000000000000000000000000000000000000000000000000001" +
                            "0000000000000000000000000000000000000000000000000000000000000002" +
                            "0000000000000000000000000000000000000000000000000000000000000002" +
                            "0000000000000000000000000000000000000000000000000000000000000003" +
                            "0000000000000000000000000000000000000000000000000000000000000004"
                    )
                ),
                description: "int[], int[]"
            )
        }
    }

}