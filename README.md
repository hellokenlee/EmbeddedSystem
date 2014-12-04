Embedded System Architecture Design
==============

Labs for EmbeddedSystem, wirte with verilog

==============

Lab Environment:
    - Xilinx ISE 12.3 in Ubuntu 14.4LTS
    - Digilent NEXYS3 Board(with Xilinx Spartan -6)

==============

FileSystem:
  -projectName/
  |
  ------------project.v
  |
  ------------projectTest.v
  |
  ------------projectConstrains.ufc

==============

Build Method:
  - in Xilinx ISE 12.3 new a project
  - new a source, choose Verilog Module
  - copy project.v to the new file
  - (optional) new a source, choose Verilog Test Fixture
  - (optional) copy projectTest.v to the new file
  - (optional) choose the TestFile, click ISIM Simulator to run Test
  - new a source, choose Implementation Constraints
  - copy the projectConstrains.ucf to the file
  - click Generate Programming File and wait...
  - if the light turn Green,it success
  - open a terminal, cd to your project dir
  - connect to the NEXYS3 Board
  - run "djtgcfg prog -d Nexys3 -i 0 -f project.bit" to download the programm
  - then you will see the design is onBoard working!
  
