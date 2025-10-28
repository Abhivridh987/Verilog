module s_r_flipflop(S,R,Q,Q_NOT,clk);
    input S,R, clk;
    output Q_NOT;
    output reg Q;
    
    assign Q_NOT = ~Q;
    
    always @(posedge clk)
    begin
        if(S == 0 && R == 0)begin
            Q <= Q;
        end
        else if(S == 1 && R == 0)begin
            Q <= 1;
        end
        else if(S == 0 && R  == 1)begin
            Q <= 0;
        end
        else if(S == 1 && R == 1)begin
            Q <= 1'bx;
        end
    end
endmodule

module testbench();
    reg S,R, clk;
    wire Q, Q_NOT;
    
    s_r_flipflop srff(S,R,Q,Q_NOT,clk);

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns period
    end
    
    // Stimulus
    initial begin
        $dumpfile("testing.vcd");
        $dumpvars(1, testbench);
        $display("Time  : S R Q Q_NOT");
        $monitor("%0dns\t%b %b %b %b", $time, S,R,Q,Q_NOT);
        S=0; R=0; #10;
        S=0; R=1; #10;  // Reset
        S=1; R=0; #10;  // Set
        S=1; R=1; #10;  // Invalid
        S=0; R=1; #10;  // Reset again
        
        $finish;
    end

endmodule

    
