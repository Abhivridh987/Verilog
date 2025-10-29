module demux(D, S, O);
    input D;
    input [1:0] S;
    output reg [3:0] O;
    
    always @(*)
    begin
        O = 4'b0000;
        if(S == 2'b00)
            O[0] = D;
        else if(S == 2'b01)
            O[1] = D;
        else if(S == 2'b10)
            O[2] = D;
        else if(S == 2'b11)
            O[3] = D;
    end
endmodule

module testing();
    reg D;
    reg [1:0] S;
    wire [3:0] O;
    
    demux g(D, S, O);
    
    initial begin
        $dumpfile("testing.vcd");
        $dumpvars(1, testing);
        D = 1;
        $display("Input Signal D : %b", D);
        $monitor("Selection : %b%b  Output : %b%b%b%b", S[1], S[0], O[3], O[2], O[1], O[0]);
        
        S = 2'b00;#10;
        S = 2'b01;#10;
        S = 2'b10;#10;
        S = 2'b11;#10;
    end
endmodule
