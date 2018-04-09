//
//  QuestionBank.swift
//  Quizzler
//
//  Created by Faizuddin Shaik on 4/7/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation


class QuestionBank {
    
    var listOfQuestions = [Question] ()
    
    init() {
        
        listOfQuestions.append (Question(text: "You can have multiple SSL certificates for multiple domains on ELB?", correctAnswer: false))
        listOfQuestions.append(Question(text: "It is possible to transfer one reserved instance from one Availability zone to another", correctAnswer: true))
        listOfQuestions.append(Question(text: "You can select a specific Availability Zone in which to place your DynamoDB Table.", correctAnswer: false))
        listOfQuestions.append(Question(text: "If you make an AMI public, this AMI is immediately available across all regions, by default.", correctAnswer: false))
        listOfQuestions.append(Question(text: "When you create new subnets within a custom VPC, by default they can communicate with each other, across availability zones.", correctAnswer: true))
        listOfQuestions.append(Question(text: "The AWS sign-in endpoint for SAML is https://signin.aws.amazon.com/saml.", correctAnswer: true))
        listOfQuestions.append(Question(text: "SNS messages cannot be customised by protocol type.", correctAnswer: false))
        listOfQuestions.append(Question(text: "True or false: A multi-part upload can be executed while the file is still being created.", correctAnswer: true))
        listOfQuestions.append(Question(text: "True or false: DynamoDB supports cross-table joins.", correctAnswer: false))
        listOfQuestions.append((Question(text: "True or false: A unit of read capacity represents one strongly consistent read per second or two eventually consistent reads per second.", correctAnswer: true)))
        listOfQuestions.append(Question(text: "When the buckets have versioning enabled, completing a multipart upload always creates a new version.  TRUE/FALSE", correctAnswer: true))
        listOfQuestions.append(Question(text: "Throughout its lifetime, you are billed for all storage, bandwidth, and requests for this multipart upload and its associated parts. TRUE/FALSE", correctAnswer: true))
        listOfQuestions.append(Question(text: "True or False: You can use your existing Microsoft Windows Server licenses with an Amazon EC2 shared tenancy instance", correctAnswer: false))
        listOfQuestions.append(Question(text: "True or Flase: The only SNS notification event supported by S3 is S3:ReducedRedundancyLostObject.", correctAnswer: false))
        listOfQuestions.append(Question(text: "True or False: Amazon S3 does not generally handle error codes with HTTP responses.", correctAnswer: false))
    
    }
    
    
    
    
}
