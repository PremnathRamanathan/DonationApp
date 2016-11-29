//
//  RemoteServiceControl.swift
//  PoundWishes
//
//  Created by Ramanathan, Premnath on 11/27/16.
//  Copyright © 2016 Group7. All rights reserved.
//

import Foundation

class RemoteServiceControl {
    
    static func getDefaultService() -> RemoteService {
        return AWSConfig.defaultService()
    }
}
