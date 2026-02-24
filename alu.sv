module ALU(
  input [3:0]a,b,
  input [2:0]s,
  output reg[3:0]c);
  always@(*)begin
    case(s)
      3'b000:c=a+b;
      3'b001:c=a-b;
      3'b010:c=a&b;
      3'b011:c=a|b;
      3'b100:c=~a;
      3'b101:c=a^b;
      3'b110:c=~(a&b);
      3'b111:c=~(a|b);
      default:c=0;
    endcase 
  end
endmodule

module top;
  reg [3:0]a;
  reg [3:0]b;
  reg [2:0]s;
  wire [3:0]c;
  ALU dut(.a(a),.b(b),.c(c),.s(s));
  initial begin
    repeat(10)begin
      {a,b,s}=$random;
    #10;
      $display("s=%b\ta=%b\tb=%b\tc=%b",s,a,b,c);
    end
  end
endmodule


//output
 s=100	a=1010	b=0100	c=0101
 s=001	a=1101	b=0000	c=1101
 s=001	a=1100	b=0001	c=1011
 s=011	a=1100	b=1100	c=1100
 s=101	a=0110	b=0001	c=0111
 s=101	a=0011	b=0001	c=0010
 s=101	a=1000	b=1100	c=0100
 s=010	a=0100	b=0010	c=0000
 s=001	a=0110	b=0000	c=0110
 s=101	a=1010	b=0001	c=1011
