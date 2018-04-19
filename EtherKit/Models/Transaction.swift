//
//  Transaction.swift
//  EtherKit
//
//  Created by Cole Potrocky on 3/23/18.
//

import Marshal

public struct Transaction {
  let hash: Hash
  let nonce: UInt256
  let blockHash: Hash
  let blockNumber: UInt256
  let transactionIndex: UInt256?
  let from: Address
  let to: Address
  let value: UInt256
  let gasPrice: UInt256
  let gas: UInt256
  let input: GeneralData
}

extension Transaction: Unmarshaling {
  public init(object: MarshaledObject) throws {
    hash = try object.value(for: "hash")
    nonce = try object.value(for: "nonce")
    blockHash = try object.value(for: "blockHash")
    blockNumber = try object.value(for: "blockNumber")
    transactionIndex = try object.value(for: "transactionIndex")
    from = try object.value(for: "from")
    to = try object.value(for: "to")
    value = try object.value(for: "value")
    gasPrice = try object.value(for: "gasPrice")
    gas = try object.value(for: "gas")
    input = try object.value(for: "input")
  }
}

extension Transaction: Marshaling {
  public func marshaled() -> [String: Any] {
    let toDict: [String: CustomStringConvertible?] = [
      "hash": hash,
      "nonce": nonce,
      "blockHash": blockHash,
      "blockNumber": blockNumber,
      "transactionIndex": transactionIndex,
      "from": from,
      "to": to,
      "value": value,
      "gasPrice": gasPrice,
      "gas": gas,
      "input": input,
    ]

    return toDict.filter { _, value in value != nil }.mapValues { String(describing: $0) }
  }
}
