# Integrated-Bit-Error-Ratio-Tester

In this repository you can find the modules of Integrated Bit error ratio tester both seprate as well as combined together. 
This repository has following files :


Individual Modules :
1. [PRBS-7](https://github.com/akhil-123/Integrated-Bit-Error-Ratio-Tester/tree/master/PRBS-7) : This folder contains the PRBS-7 generator (LFSR.v) and the testbanch for same (test.v)
2. [PRBS-13](https://github.com/akhil-123/Integrated-Bit-Error-Ratio-Tester/tree/master/PRBS-13) : This folder contains the PRBS-13 generator (LFSR.v) and the testbanch for same (test.v)
3. [Data Channel Wrapper Module](https://github.com/akhil-123/Integrated-Bit-Error-Ratio-Tester/tree/master/Data_channel_wrappper) : This folder contains the data channel wrapper module (DCW.v) which generated reference clock and also decides whether to reset the channel or not. It also contains the testbench for the same (test_DCW.v).
4. [Error Adder](https://github.com/akhil-123/Integrated-Bit-Error-Ratio-Tester/tree/master/Adding_error) : This folder contains pattern generator module (LFSR.v), error adding module (error.v) and test banch for same (test_error.v).
5. [Error checker](https://github.com/akhil-123/Integrated-Bit-Error-Ratio-Tester/tree/master/error-checker) : This folder contains the comparator to check for error (comp.v) and testbench for same (test_bench.v).
6. [Pre-emphasis](https://github.com/akhil-123/Integrated-Bit-Error-Ratio-Tester/tree/master/pre-emphasis) : This module contains the pre-emphasis module (preemph.v) and test bench for same (test.v).
7. [Test Controller](https://github.com/akhil-123/Integrated-Bit-Error-Ratio-Tester/tree/master/test_controller) : This module serves as top module for pattern generator, error checker, error adder. It also contains the testbench to verify it's working (test_combined.v).
8. [Pre-emphasis + LFSR](https://github.com/akhil-123/Integrated-Bit-Error-Ratio-Tester/tree/master/Pre-emphasis%20%2B%20LFSR) : This modules verfies how the patterns look after passing them through preemph filter. Testbench (test_bench.v) verifies the performance.

