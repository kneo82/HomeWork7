//
//  JobScheduler.swift
//  HomeWork7
//
//  Created by Vitaliy Voronok on 22.05.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

enum JobState {
    case wait
    case runing
    case finished
}

class JobScheduler {
    
    var timeOfWork: Double?
    var jobs = [Job]()
    
    private var state: JobState = .wait
    private var complitionHandler: () -> Void

    init() {
        complitionHandler = { }
    }

    func addJobQueue(queue: JobQueue, nameQueue: String) {
        self.jobs.append(Job(jobQueue: queue, nameQueue: nameQueue))
        if state == .finished {
            state = .wait
        }
    }
    
    func getResult() -> [String : Double]? {
        switch state {
        case .finished:
            let maxTime = jobs.map({ $0.getWorkTime() }).max()
            self.timeOfWork = maxTime
            
            if let maxTime = maxTime {
                guard maxTime != 0 else { return nil }
                
                var dict = [String : Double]()
                
                for j in jobs {
                    dict[j.nameQueue] = (j.getWorkTime() / maxTime)
                }
                
                return dict
                
            } else {
                return nil
            }
        default:
            return nil
        }
    }

    func start(complitionHandler: @escaping () -> Void) {
        self.complitionHandler = complitionHandler
        for jobQueue in jobs {
            if jobQueue.state == .wait {
                jobQueue.state = .runing
                
                jobQueue.jobQueue.run() {
                    result in
                    switch result {
                    case .success(let workTime):
                        jobQueue.state = .finished
                        jobQueue.workTime = workTime as? TimeInterval
                        
                    case .failure(_):
                        jobQueue.state = .finished
                        jobQueue.workTime = 0
                    }
                    
                    self.setFinished()
                }
            }
        }
    }
    
    private func setFinished() {
        var allJobsFinished = true
        
        for job in jobs {
            if job.state != .finished {
                allJobsFinished = false
            }
        }
        
        if allJobsFinished {
            self.state = JobState.finished
            
            DispatchQueue.main.async {
                self.complitionHandler()
            }
        }
    }

    class Job {
        var nameQueue: String
        var jobQueue: JobQueue
        var state: JobState
        var workTime: TimeInterval?
        
        init(jobQueue: JobQueue, nameQueue: String) {
            self.jobQueue = jobQueue
            self.nameQueue = nameQueue
            self.state = .wait
        }

        open func getWorkTime()-> Double {
            var result = 0.0
            if self.workTime != nil {
                result = Double(self.workTime!)
            }
            
            return result
        }
    }
}
