module sync_down_counter(clk,reset,Q);
    input clk, reset;
    output reg [2:0] Q;
    
    always @(posedge clk)
    begin
        if(reset == 1)
            Q <= 3'b000;
        else
            Q <= Q - 1;
    end
endmodule

module testing();
    reg clk, reset;
    wire [2:0] Q;
    
    sync_down_counter g(clk, reset, Q);
    
    initial begin
        clk = 0; 
        forever #5 clk = ~clk;
    end
    
    initial begin
        $dumpfile("testing.vcd");
        $dumpvars(1, testing);
        $monitor("Time : %0dns %b%b%b", $time, Q[2], Q[1], Q[0]);
        
        reset = 1;
        #10;
        reset = 0;
        
        #100;
        $finish;
    end
endmodule
