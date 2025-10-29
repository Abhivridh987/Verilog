module n_mod_counter #(parameter N=5, WIDTH=3)(clk, reset, Q);
    input clk, reset;
    output reg [WIDTH - 1: 0] Q;
    
    always @(posedge clk)
    begin
        if(reset == 1)
            Q <= 3'b000;
        else if(Q == N-1)
            Q <= 0;
        else
            Q <= Q + 1;
    end
endmodule

module testing();
    reg clk, reset;
    wire [2:0] Q;
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    n_mod_counter #(5, 3) g(clk, reset, Q);
    
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
        
        
