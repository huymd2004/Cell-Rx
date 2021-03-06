//
//  DispatchQueue+Extension.swift
//  Pods
//
//  Created by Zhou Hao on 03/09/16.
//
//

import Foundation

public extension DispatchQueue {
  
  private static var _onceTracker = [Int]()
  
  /**
   Executes a block of code, associated with a unique token, only once.  The code is thread safe and will
   only execute the code once even in the presence of multithreaded calls.
   
   - parameter token: A unique reverse DNS style name such as com.vectorform.<name> or a GUID
   - parameter block: Block to execute once
   */
  public class func once(token: inout Int, block:@noescape(Void)->Void) {
    objc_sync_enter(self); defer { objc_sync_exit(self) }
    
    if _onceTracker.contains(token) {
      return
    }
    
    _onceTracker.append(token)
    block()
  }
}
