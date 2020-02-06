//
//  ArgumentParser.swift
//  PcapngPrint
//
//  Created by Darrell Root on 2/5/20.
//  Copyright © 2020 net.networkmom. All rights reserved.
//

import Foundation
import PackageSwiftPcapng

class ArgumentParser {
    
    enum ArgumentState {
        case begin
        case PcapngPrint
    }
    var argumentState = ArgumentState.begin
    var help = false
    var version = false
    var showLogs = false
    var files: [String] = []
    init(_ arguments: [String]) {
        ARGUMENTS: for argument in arguments {
            switch argumentState {
            case .begin:
                self.argumentState = .PcapngPrint
            case .PcapngPrint:
                switch argument {
                case "-l":
                    self.showLogs = true
                case "-h":
                    self.help = true
                case "-v":
                    self.version = true
                default:
                    self.files.append(argument)
                } // switch argument
            } // switch argumentState
        } // for argument in arguments
    }
    func printVersion() {
        //let pcapngVersion = Pcapng.version
        print("PcapngPrint version 0.0.1")
        //print("\(pcapngVersion)")
    }
    func usage() {
        let usageString = """
SOURCE: https://github.com/darrellroot/etherdump/PcapngPrint

USAGE: PcapngPrint [-v] [-l] [-h] [filenames]...
       -v: show version
       -l: show debug logs
       -h: show help
"""
        printVersion()
        print(usageString)
    }
}
