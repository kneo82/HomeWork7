//
//  JobQueue.swift
//  HomeWork7
//
//  Created by Vitaliy Voronok on 22.05.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

enum JobQueueError: Error {
    case badTimeStart
    case unknownError
}

class JobQueue {
    
    let jobs:[() -> Void]
    var complitionHandler: (_ result: Result<Any, Error>) -> Void
    
    private var startTime: Date?
    private var group: DispatchGroup
    
    init(jobs: [() -> Void]) {
        self.group = DispatchGroup()
        self.jobs = jobs
        
        for _ in self.jobs {
            self.group.enter()
        }
        
        complitionHandler = { _ in  }
        configureNotify()
    }
    
    func run(complitionHandler: @escaping (_ result: Result<Any, Error>) -> Void) {
        startTime = Date()
        self.complitionHandler = complitionHandler
        
        for job in jobs {
            DispatchQueue.global(qos: .userInitiated).async {
                job()
                self.group.leave()
            }
        }
    }
    
    private func configureNotify(){
        self.group.notify(queue: .main) {
            if let startTime = self.startTime {
                let workTime = Date().timeIntervalSince1970 - startTime.timeIntervalSince1970
                self.complitionHandler(.success(workTime))
            } else {
                self.complitionHandler(.failure(JobQueueError.badTimeStart))
            }
        }
    }
    
}
