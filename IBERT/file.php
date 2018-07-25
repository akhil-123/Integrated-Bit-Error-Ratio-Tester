<?php
 $file = 'file_to_edit.v';

$input1 = $_REQUEST['input1'];
$input2 = $_REQUEST['input2'];
$tap1 = $_REQUEST['tap1'];
$tap2 = $_REQUEST['tap2'];
$tap3 = $_REQUEST['tap3'];
$clock = $_REQUEST['clock'] * 1000000;
// echo $clock;die;
$fp = fopen($file, 'w');
 $str = '`timescale 1ps / 1ps 
module final_testbench;
 reg control;
 reg sel;
 reg [2:0] ctrl_sig ;
reg [2:0] val ;
reg [24:0]wanted_cl_val ;
reg clock ;
reg signed [2:0] taps ;
 reg [12:0] normal_input;

wire [12:0] error;
 wire [12:0] total_error;
 wire [31:0] count;
 
 // Instantiate the Unit Under Test (UUT)
 combined uut (
.control(control),
.sel(sel),
.ctrl_sig(ctrl_sig), 
.val(val), 
.wanted_cl_val(wanted_cl_val),
.clock(clock),
.taps(taps),
.normal_input(normal_input), 
.error(error),
.total_error(total_error),
.count(count)
 );

 initial begin
clock = 0;
forever
 #50 clock = ~clock;
end
 
 initial begin



taps[0] = '.$tap1.';
taps[1] = '.$tap2.';
taps[2] = '.$tap3.';
control='.$input2.';
sel = 1;
ctrl_sig = 1 ;
val = 7 ;
wanted_cl_val = '.$clock.';
#10000000 ;



control='.$input2.' ;
 
taps[0] = '.$tap1.';
taps[1] = '.$tap2.';
taps[2] = '.$tap3.';
sel = 1;
ctrl_sig = '.$input1.' ;
val = 7 ;
wanted_cl_val ='.$clock.' ;
#10000000 ;


control='.$input2.' ;

taps[0] = '.$tap1.';
taps[1] = '.$tap2.';
taps[2] = '.$tap3.';
sel = 1;
ctrl_sig = 2 ;
val = 7 ;
wanted_cl_val ='.$clock.' ;
#30000000 ;

$display("%d",total_error);
$display("%d", count);
 #300000 $finish;
 end
 
endmodule
';
 $fwrite = fwrite($fp, $str);

// sleep(2);

// function exec_callback($command, $callback){
//     $array = array();
//     exec($command, $array, $ret);
//     if(!empty($array)){
//         foreach ($array as $line){
//             call_user_func($callback, $line);
//         }
//     }
// }

// // example to use
// function print_lines($line){
//     echo "> $line\n";
// }

// exec_callback("iverilog -o simple.vvp transmit.v mux.v error.v comp.v DFF.v seven.v thirteen.v choose.v preemph.v test_control.v DCW.v combined.v file_to_edit.v | vvp simple.vvp", 'print_lines');
unlink('simple.vvp');
system("iverilog -o simple.vvp transmit.v mux.v error.v comp.v DFF.v seven.v thirteen.v choose.v preemph.v test_control.v DCW.v combined.v file_to_edit.v");
 
 // die;
 // print_r(shell_exec('./file.sh'));
// die;
// sleep(2);
system('vvp simple.vvp > file.txt');
// print_r($x);


// die;

exec('column -t file.txt > file1.txt');

$fh = fopen('file1.txt','r');
$i = 1;
$input1 = '';
$input2 = '';
while ($line = fgets($fh)) {
// <... Do your work with the line ...>
if($i == 1) {
$input1 = $line;
} else {
$input2 = $line;
}
$i++;
}
echo $input1/$input2*100; 
// exec('chmod -R 777 .');
// unlink(file.txt);
// unlink(file1.txt);

fclose($fh);die;


// exec('line=$(head -n 1 file1.txt)');
// exec('line1=$(tail -n 1 file1.txt)');
// exec('echo $line1',$output,$x);
// print_r($x);
// exec('echo " scale=2 ;$line/$line1*100" | bc > file2.txt');
// exec('');
?>