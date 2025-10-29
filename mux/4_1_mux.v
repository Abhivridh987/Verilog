module mux(I, S, O);
    input [3:0] I;
    input [1:0] S;
    output reg O;
    
    always @(*)
    begin
        if(S == 2'b00)
            O = I[0];
        else if(S == 2'b01)
            O = I[1];
        else if(S == 2'b10)
            O = I[2];
        else
            O = I[3];
    end
endmodule

module testing();
    reg [3:0] I;
    reg [1:0] S;
    wire O;
    
    mux g(I,S, O);
    initial begin
        $dumpfile("testing.vcd");
        $dumpvars(1, testing);
        I = 4'b0110; #10;
        $display("Input Signal I : %b%b%b%b", I[3], I[2], I[1], I[0]);
        $monitor("Selection : %b%b   Output : %d", S[1], S[0], O);
        
        
        S = 2'b00; #10;
        S = 2'b01; #10;
        S = 2'b10; #10;
        S = 2'b11; #10;
        
    end
endmodule
