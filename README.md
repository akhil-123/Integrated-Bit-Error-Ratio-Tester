# Integrated-Bit-Error-Ratio-Tester

In this repository you can find the modules of Integrated Bit error ratio tester both seprate as well as combined together. 
This repository has following files :


Individual Modules :<br />
1. [PRBS-7](https://github.com/akhil-123/Integrated-Bit-Error-Ratio-Tester/tree/master/Individual%20Modules/PRBS-7) : This folder contains the PRBS-7 generator (LFSR.v) and the testbench for same (test.v)
2. [PRBS-13](https://github.com/akhil-123/Integrated-Bit-Error-Ratio-Tester/tree/master/Individual%20Modules/PRBS-13) : This folder contains the PRBS-13 generator (LFSR.v) and the testbench for same (test.v)
3. [Data Channel Wrapper Module](https://github.com/akhil-123/Integrated-Bit-Error-Ratio-Tester/tree/master/Individual%20Modules/Data_channel_wrappper) : This folder contains the data channel wrapper module (DCW.v) which generates reference clock and also decides whether to reset the channel or not. It also contains the testbench for the same (test_DCW.v).
4. [Error Adder](https://github.com/akhil-123/Integrated-Bit-Error-Ratio-Tester/tree/master/Individual%20Modules/Adding_error) : This folder contains pattern generator module (LFSR.v), error adding module (error.v) and test banch for same (test_error.v).
5. [Error checker](https://github.com/akhil-123/Integrated-Bit-Error-Ratio-Tester/tree/master/Individual%20Modules/error-checker) : This folder contains the comparator to check for error (comp.v) and testbench for same (test_bench.v).
6. [Pre-emphasis](https://github.com/akhil-123/Integrated-Bit-Error-Ratio-Tester/tree/master/Individual%20Modules/pre-emphasis) : This module contains the pre-emphasis module (preemph.v) and test bench for same (test.v).
7. [Test Controller](https://github.com/akhil-123/Integrated-Bit-Error-Ratio-Tester/tree/master/Individual%20Modules/test_controller) : This module serves as top module for pattern generator, error checker, error adder. It also contains the testbench to verify it's working (test_combined.v).
8. [Pre-emphasis + LFSR](https://github.com/akhil-123/Integrated-Bit-Error-Ratio-Tester/tree/master/Individual%20Modules/Pre-emphasis%20%2B%20LFSR) : This modules verfies how the patterns look after passing them through pre emphasis filter. Testbench (test_bench.v) verifies the performance.
9. [Top Module](https://github.com/akhil-123/Integrated-Bit-Error-Ratio-Tester/tree/master/Individual%20Modules/Top_Module) : This folder contains top module combined.v and all other modules only for PRBS-7.
10. [GUI](https://github.com/akhil-123/Integrated-Bit-Error-Ratio-Tester/tree/master/Individual%20Modules/GUI) : This folder contains the html and css file i.e only frontend of the GUI made to change the parameters.


Final Combined Module :<br /> 
[IBERT](https://github.com/akhil-123/Integrated-Bit-Error-Ratio-Tester/tree/master/Combined%20Module) : 
This folder contains all modules connected. To use these files follow these steps :
1. If you haven't php and apache installed on you machine, follow this [link](https://www.vultr.com/docs/how-to-install-apache-mysql-and-php-on-ubuntu-16-04)
2. If you haven't iverilog installed in your machine, type command :
sudo apt-get install iverilog
3. Now clone this repository [IBERT](https://github.com/akhil-123/Integrated-Bit-Error-Ratio-Tester/tree/master/Combined%20Module).
4. Unzip all the files to /var/www/html
5. Type command to grant permission : sudo chmod -R 777 .
6. Now open the browser and type localhost/home.html
7. Now set the parameters that you want and click on submit button
8. On clicking the button you can see the BER as output.

Apart from this if you want to synthesize the codes, follow this link to install [yosys](http://www.clifford.at/yosys/download.html) , after installing yosys type command on terminal :<br />
yosys synth.ys

Project files: It contains the codes, xdc files, implemented design and run summary of vivado.<br /> 
1. [Cmod A7 t-15](https://github.com/akhil-123/Integrated-Bit-Error-Ratio-Tester/tree/master/Cmod-A7-t15)
2. [Cmod A7 t-35](https://github.com/akhil-123/Integrated-Bit-Error-Ratio-Tester/blob/master/Cmod-A7-t35.zip)
