/*
	Copyright 2020 Efabless Corp.

	Author: Mohamed Shalan (mshalan@efabless.com)
	
	Licensed under the Apache License, Version 2.0 (the "License"); 
	you may not use this file except in compliance with the License. 
	You may obtain a copy of the License at:
	http://www.apache.org/licenses/LICENSE-2.0
	Unless required by applicable law or agreed to in writing, software 
	distributed under the License is distributed on an "AS IS" BASIS, 
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
	See the License for the specific language governing permissions and 
	limitations under the License.
*/

`timescale          1ns/1ps
`default_nettype    none

module sky130_ef_ip__xtal_osc_16M_DI (
`ifdef USE_POWER_PINS
    input   wire    vdda1,
    input   wire    vssa1,
    input   wire    vccd1,
    input   wire    vssd1,
`endif
    input   wire    in,
    input   wire    ena,
    output  wire    dout,
    output  wire    out,
    input   wire    stdby
);

    reg clk=0;
    
    // period/2
    real period16 = 31.25;
 
    always #period16 clk = (!clk & ena);
    assign dout = clk;

endmodule