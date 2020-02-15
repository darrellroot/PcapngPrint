# PcapngPrint
Command-line tool to print out structure of pcap or pcapng file

## How to use

   PcapngPrint [files...]
   
## Package dependencies and related repositories

[PackageSwiftPcapng](https://github.com/darrellroot/PackageSwiftPcapng)
[Apple SwiftLog API](https://github.com/apple/swift-log)
   
## Sample output for pcap format

```
% ./PcapngPrint ~/test/a.pcap
File /Users/droot/test/a.pcap Format: pcap
  MagicNumber: 0xa1b2c3d4
  Version: 2.(pcap.versionMinor)
  TimeZone correction: 0
  Timestamp accuracy: 0
  Snaplen: 262144
  Network type: 1
  10 packets
  Little Endian
  Packet 0 60 bytes
    2020-02-15 00:18:13 +0000
    capturedLength 60 originalLength 60
  Packet 1 66 bytes
    2020-02-15 00:18:13 +0000
    capturedLength 66 originalLength 66
  Packet 2 60 bytes
    2020-02-15 00:18:13 +0000
    capturedLength 60 originalLength 60
```

## Sample output for pcapng format

```
% ./PcapngPrint ~/test/e.pcapng
File /Users/droot/test/e.pcapng Format: pcapng
PcapngPrint: info PcapngShb options data count 100
PcapngPrint: info code 1 length 21 startIndex 24
PcapngPrint: info PcapngOption.init code 1 length 21 data 21 bytes
PcapngPrint: info code 2 length 7 startIndex 0
PcapngPrint: info PcapngOption.init code 2 length 7 data 7 bytes
PcapngPrint: info code 3 length 14 startIndex 0
PcapngPrint: info PcapngOption.init code 3 length 14 data 14 bytes
PcapngPrint: info code 4 length 32 startIndex 0
PcapngPrint: info PcapngOption.init code 4 length 32 data 32 bytes
PcapngPrint: info code 0 length 0 startIndex 0
PcapngPrint: info PcapngOption.init code 0 length 0 data 0 bytes
PcapngPrint: info PcapngShg blockType 0xa0d0d0a blockTotalLength 128 byteOrderMagic 0x1a2b3c4d majorVersion 1 minorVersion 0 sectionLength -1 options.count 5
 interfaces.count 0 interfaceStatistics 0 nameResolutions 0 packetBlocks.count 0 customBlocks 0  comment section header block
  hardware x86_64
  os Darwin 19.3.0
  userappl tcpdump (libpcap version 1.9.1)
  endofopt

PcapngPrint: info PcapngIdb options data count 12
PcapngPrint: info code 2 length 4 startIndex 16
PcapngPrint: info PcapngOption.init code 2 length 4 data 4 bytes
PcapngPrint: info code 0 length 0 startIndex 0
PcapngPrint: info PcapngOption.init code 0 length 0 data 0 bytes
PcapngPrint: info PcapngIdb blockType 0x1 blockLength 32 linkType 1 snaplen 40000 options.count 2
  name en0
)  endofopt
)
PcapngPrint: info PcapngEpb options data count 20
PcapngPrint: info code 2 length 4 startIndex 204
PcapngPrint: info PcapngOption.init code 2 length 4 data 4 bytes
PcapngPrint: info code 32770 length 4 startIndex 0
PcapngPrint: info PcapngOption.init code 32770 length 4 data 4 bytes
PcapngPrint: error unimplemented option code 32770
PcapngPrint: info code 0 length 0 startIndex 0
PcapngPrint: info PcapngOption.init code 0 length 0 data 0 bytes
PcapngPrint: info PcapngEpb blockType 0x6 blockLength 228 interfaceId 0 timestamp -420524922 capturedLength 174 originalLength 174 packetData.count 174 options.count 2
  flags 1
)  endofopt
)
PcapngPrint: info Pcapng: Darwin process event block, ignoring
PcapngPrint: info PcapngEpb options data count 36
PcapngPrint: info code 32769 length 4 startIndex 464
PcapngPrint: info PcapngOption.init code 32769 length 4 data 4 bytes
PcapngPrint: error unimplemented option code 32769
PcapngPrint: info code 2 length 4 startIndex 0
PcapngPrint: info PcapngOption.init code 2 length 4 data 4 bytes
PcapngPrint: info code 32770 length 4 startIndex 0
PcapngPrint: info PcapngOption.init code 32770 length 4 data 4 bytes
PcapngPrint: error unimplemented option code 32770
PcapngPrint: info code 32772 length 4 startIndex 0
PcapngPrint: info PcapngOption.init code 32772 length 4 data 4 bytes
PcapngPrint: error unimplemented option code 32772
PcapngPrint: info code 0 length 0 startIndex 0
PcapngPrint: info PcapngOption.init code 0 length 0 data 0 bytes
PcapngPrint: info PcapngEpb blockType 0x6 blockLength 504 interfaceId 0 timestamp -420255314 capturedLength 433 originalLength 433 packetData.count 433 options.count 2
  flags 1
)  endofopt
)
PcapngPrint: info PcapngEpb options data count 36
PcapngPrint: info code 32769 length 4 startIndex 484
PcapngPrint: info PcapngOption.init code 32769 length 4 data 4 bytes
PcapngPrint: error unimplemented option code 32769
PcapngPrint: info code 2 length 4 startIndex 0
PcapngPrint: info PcapngOption.init code 2 length 4 data 4 bytes
PcapngPrint: info code 32770 length 4 startIndex 0
PcapngPrint: info PcapngOption.init code 32770 length 4 data 4 bytes
PcapngPrint: error unimplemented option code 32770
PcapngPrint: info code 32772 length 4 startIndex 0
PcapngPrint: info PcapngOption.init code 32772 length 4 data 4 bytes
PcapngPrint: error unimplemented option code 32772
PcapngPrint: info code 0 length 0 startIndex 0
PcapngPrint: info PcapngOption.init code 0 length 0 data 0 bytes
PcapngPrint: info PcapngEpb blockType 0x6 blockLength 524 interfaceId 0 timestamp -420253794 capturedLength 453 originalLength 453 packetData.count 453 options.count 2
  flags 1
)  endofopt
)
PcapngPrint: info Pcapng segments 1  segment0 options 5 interfaces 1 packetBlocks 3
  File /Users/droot/test/e.pcapng segment 0
    blockLength 128
    byteOrderMagic 0x1a2b3c4d
    majorVersion 1
    minorVersion 0
    sectionLength 18446744073709551615
    Segment option comment section header block
    Segment option hardware x86_64
    Segment option os Darwin 19.3.0
    Segment option userappl tcpdump (libpcap version 1.9.1)
    Segment option endofopt
    Segment 0 Interface 0
      Interface blockType 1
      Interface blockLength 32
      Interface linkType 1
      Interface snaplen 262144
        Interface option name en0
        Interface option endofopt
    Segment 0 Packet 0 enhanced packet block
      blockType 6
      blockLength 228
      interfaceId 0
      timestamp 1581805969820806
      date Optional(2020-02-15 22:32:49 +0000)
      capturedLength 174
      originalLength 174
      packet data 174 bytes
      packet option flags 1
      packet option endofopt
    Segment 0 Packet 1 enhanced packet block
      blockType 6
      blockLength 504
      interfaceId 0
      timestamp 1581805970090414
      date Optional(2020-02-15 22:32:50 +0000)
      capturedLength 433
      originalLength 433
      packet data 433 bytes
      packet option flags 1
      packet option endofopt
    Segment 0 Packet 2 enhanced packet block
      blockType 6
      blockLength 524
      interfaceId 0
      timestamp 1581805970091934
      date Optional(2020-02-15 22:32:50 +0000)
      capturedLength 453
      originalLength 453
      packet data 453 bytes
      packet option flags 1
      packet option endofopt
```
