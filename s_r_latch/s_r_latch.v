module s_r_latch(S,R,Q,Q_NOT);
    input S,R;
    output reg Q,Q_NOT;
    
    always @(*)
    begin
        if(S == 0 && R == 0)begin
            Q <= 1'bx;
        end
        else if(S == 1 && R == 0)begin
            Q <= 1;
        end
        else if(S == 0 && R == 1)begin
            Q <= 0;
        end
        else if(S == 1 && R == 1)begin
            Q <= Q;
        end
    end
    always @(*)begin
        Q_NOT = ~Q;
    end
endmodule

module testbench();
    reg S,R;
    wire Q,Q_NOT;
    
    s_r_latch sr(S,R,Q,Q_NOT);
    
    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(1, testbench);
        $display("S | R | Q | ~Q ");
        $monitor("%b | %b | %b | %b", S,R,Q,Q_NOT);
        
        S=0;R=0;#2;
        S=0;R=1;#2;
        S=1;R=0;#2;
        S=0;R=1;#2;
        S=1;R=1;#2;
    
        $finish;
    end
endmodule
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
