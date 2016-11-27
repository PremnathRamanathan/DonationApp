//
//  AWSConstants.swift
//  PoundWishes
//
//  Created by Ramanathan, Premnath on 11/26/16.
//  Copyright © 2016 Group7. All rights reserved.
//

import Foundation

class AWSConstants {
    
    static let COGNITO_REGIONTYPE = AWSRegionType.usEast1   // Set the COGNITO_REGIONTYPE
    static let COGNITO_IDENTITY_POOL_ID = "us-east-1:656e4f56-c578-49dd-b4ef-cbd4bad65033"   // Set the YOUR_COGNITO_IDENTITY_POOL_ID
    static let DEFAULT_SERVICE_REGION = AWSRegionType.usEast1    // Set the DEFAULT_SERVICE_REGION
    static let S3BUCKET_USERS = "arn:aws:s3:::poundwishesapp_USERS"   // Set the YOUR_S3BUCKET_USERS
    static let DYNAMODB_USERS_TABLE = "arn:aws:dynamodb:us-east-1:141590245734:table/User_Info"   // Set the YOUR_DYNAMODB_USERS_TABLE
}
