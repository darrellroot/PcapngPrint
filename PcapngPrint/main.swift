//
//  main.swift
//  PcapngPrint
//
//  Created by Darrell Root on 2/5/20.
//  Copyright © 2020 net.networkmom. All rights reserved.
//

import Foundation
import PackageSwiftPcapng
import Logging

var arguments = ArgumentParser(CommandLine.arguments)
//var logger: DarrellLogHandler?

if arguments.help || arguments.files.count == 0 {
    arguments.usage()
    exit(EXIT_SUCCESS)
}
if arguments.version {
    arguments.printVersion()
    exit(EXIT_SUCCESS)
}

LoggingSystem.bootstrap(DarrellLogHandler.init)
if arguments.showLogs {
    Pcapng.logger.logLevel = .debug
} else {
    Pcapng.logger.logLevel = .info
}

func decodePcapng(data: Data, file: String) {
    
}

for file in arguments.files {
    let fileManager = FileManager()
    guard let data = fileManager.contents(atPath: file) else {
        debugPrint("PcapngPrint: unable to open file \(file)")
        continue
    }
    let pcapType = PcapType.detect(data: data)
    
    switch pcapType {
        
    case .pcap:
        <#code#>
    case .pcapng:
        decodePcapng(data: data, file: file)
        
    case .neither:
        print("PcapngPrint: File \(file) does not appear to be pcap or pcapng")
        exit(EXIT_FAILURE)
    }
    guard let pcapng = Pcapng(data: data) else {
        print("PcapngPrint: unable to decode file \(file) as pcapng")
        continue
    }
    print("File \(file)")
    for (segmentCount,segment) in pcapng.segments.enumerated() {
        print("  File \(file) segment \(segmentCount)")
        print("    blockLength \(segment.blockLength)")
        print(String(format:"    byteOrderMagic 0x%x",segment.byteOrderMagic))
        print("    majorVersion \(segment.majorVersion)")
        print("    minorVersion \(segment.minorVersion)")
        print("    sectionLength \(segment.sectionLength)")
        for option in segment.options {
            print("    Segment option \(option.description)")
        }
        for (interfaceCount,interface) in segment.interfaces.enumerated() {
            print("    Segment \(segmentCount) Interface \(interfaceCount)")
            print("      Interface blockType \(interface.blockType)")
            print("      Interface blockLength \(interface.blockLength)")
            print("      Interface linkType \(interface.linkType)")
            print("      Interface snaplen \(interface.snaplen)")
            for option in interface.options {
                print("        Interface option \(option)")
            }
        }// for interface
        for (statisticCount, statistic) in segment.interfaceStatistics.enumerated() {
            print("    Segment \(segmentCount) Interface Statistic block \(statisticCount)")
            print("      blockType \(statistic.blockType)")
            print("      blockLength \(statistic.blockLength)")
            print("      interfaceID \(statistic.interfaceId)")
            print("      timestampHigh \(statistic.timestampHigh)")
            print("      timestampLow \(statistic.timestampLow)")
            for option in statistic.options {
                print("      Statistic option \(option)")
            }
        }// for statistic
        for (resolutionCount, resolution) in segment.nameResolutions.enumerated() {
            print("    Segment \(segmentCount) Name Resolution block \(resolutionCount)")
            print("      blockType \(resolution.blockType)")
            print("      blockLength \(resolution.blockLength)")
            for ipv4record in resolution.ipv4records {
                var output = ipv4record.key.debugDescription
                for value in ipv4record.value {
                    output.append(" \(value)")
                }
                print("      \(output)")
            }
            for ipv6record in resolution.ipv6records {
                var output = ipv6record.key.debugDescription
                for value in ipv6record.value {
                    output.append(" \(value)")
                }
                print("      \(output)")
            }
            for option in resolution.options {
                print("      Name resolution option \(option)")
            }
        } // for name resolution
        for (customCount, custom) in segment.customBlocks.enumerated() {
            print("    Segment \(segmentCount) Custom block \(customCount)")
            print(String(format:"      blockType 0x%x",custom.blockType))
            print("      blockLength \(custom.blockLength)")
            print("      enterpriseNumber \(custom.enterpriseNumber)")
            print("      custom data and options \(custom.customDataAndOptions.count) bytes")
        } // for custom
        for (packetCount, packet) in segment.packetBlocks.enumerated() {
            if let packet = packet as? PcapngEpb {
                print("    Segment \(segmentCount) Packet \(packetCount) enhanced packet block")
                print("      blockType \(packet.blockType)")
                print("      blockLength \(packet.blockLength)")
                print("      interfaceId \(packet.interfaceId)")
                print("      timestamp \(packet.timestamp)")
                print("      date \(packet.date)")
                print("      capturedLength \(packet.capturedLength)")
                print("      originalLength \(packet.originalLength)")
                print("      packet data \(packet.packetData.count) bytes")
                for option in packet.options {
                    print("      packet option \(option)")
                }
            } else if let packet = packet as? PcapngSpb {
                print("    Segment \(segmentCount) Packet \(packetCount) simple packet block")
                print("      blockType \(packet.blockType)")
                print("      blockLength \(packet.blockLength)")
                print("      originalLength \(packet.originalLength)")
                print("      packet data \(packet.packetData.count) bytes")
            } else {
                fatalError("unknown packet type detected, add coverage")
            }
        }
    }
}
exit(EXIT_SUCCESS)

