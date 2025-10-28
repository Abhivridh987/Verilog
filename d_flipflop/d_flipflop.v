module d_flipflop(D, clk, Q, Q_NOT);
    input D,clk;
    output Q_NOT;
    output reg Q;
    
    assign Q_NOT = ~Q;
    
    always @(posedge clk)
    begin
        Q<=D;
    end
endmodule

module testing();
    reg D, clk;
    wire Q_NOT, Q;

    d_flipflop ff(D,clk, Q ,Q_NOT);
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        $dumpfile("testing.vcd");
        $dumpvars(1, testing);
        $display("Time | D | Q | ~Q ");
        $monitor("%0dns | %b | %b | %b ", $time, D, Q,Q_NOT);
        
        D=0; #10;
        D=1; #10;
        $finish;
    end
endmodule
