//
//  GetBalanceRequest.swift
//  EtherKit
//
//  Created by Cole Potrocky on 3/21/18.
//

import BigInt
import JSONRPCKit

struct GetBalanceRequest: Request {
  typealias Response = UInt256
  
  let address: Address
  let blockNumber: BlockNumber

  var method = "eth_getBalance"
  
  var parameters: Any? {
    return [address, blockNumber]
  }
  
  func response(from resultObject: Any) throws -> Response {
    guard let balance = UInt256(describing: resultObject) else {
      throw JSONRPCError.unexpectedTypeObject(resultObject)
    }
    return balance
  }
}
