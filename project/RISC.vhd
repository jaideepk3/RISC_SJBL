library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity RISC is 
 port ( inp : in std_logic_vector(15 downto 0);
        out1 : out std_logic_vector(15 downto 0);
		  out2 : out std_logic_vector(15 downto 0) )  ;
	end RISC ;

architecture RISC_arc of RISC is	
	shared variable MM : std_logic_vector ( 1048575 downto 0 );
	shared variable r0,r1,r2,r3,r4,r5,r6,r7,CC : std_logic_vector ( 15 downto 0) ;
	
	shared variable t1,t2,t3 : std_logic_vector (15 downto 0);



	component ALU is
		port(inp1 : in std_logic_vector(15 downto 0);
	 inp2 : in std_logic_vector(15 downto 0); 
	 op_sel : in std_logic_vector(1 downto 0);
	 outp : out std_logic_vector(15 downto 0);
	 c : out std_logic;                             ---overflow flag
	 z : out std_logic );
	end component;




begin
	--ADD function
	if inp (15 downto 12) = "0001"  then 
	
		if inp ( 1 downto 0) = "00" then
			if inp(11 downto 8) = "000" then
				t1 := r0;
			elsif inp(11 downto 9) = "001" then
				t1 := r1;
			elsif inp(11 downto 9) = "010" then
				t1 := r2;
			elsif inp(11 downto 9) = "011" then
				t1 := r3;
			elsif inp(11 downto 9) = "100" then
				t1 := r4;
			elsif inp(11 downto 9) = "101" then
				t1 := r5;
			elsif inp(11 downto 9) = "110" then
				t1 := r6;
			elsif inp(11 downto 9) = "111" then
				t1 := r7;                               
			end if;
			-- Found Ra
			if inp(8 downto 6) = "000" then
				t2 := r0;
			elsif inp( 8 downto 6) = "001" then
				t2 := r1;
			elsif inp(8 downto 6) = "010" then
				t2 := r2;
			elsif inp(8 downto 6) = "011" then
				t2 := r3;
			elsif inp(8 downto 6) = "100" then
				t2 := r4;
			elsif inp(8 downto 6) = "101" then
				t2 := r5;
			elsif inp(8 downto 6) = "110" then
				t2 := r6;
			elsif inp(8 downto 6) = "111" then
				t2 := r7;
			end if;b
			-- Found R
			 
			ADD_ALU : ALU
			port map(t1=>inp1,t2=>inp2,"0"=>op_sel,t3=>outp,CC(1)=>c,CC(0)=>z);
				
			if inp(5 downto 3) = "000" then
				r0 := t3;
			elsif inp(5 downto 3) = "001" then
				r1:= t3;
			elsif inp(5 downto 3) = "010" then
			   r2 := t3;
			elsif inp(5 downto 3) = "011" then
			   r3:= t3;
			elsif inp(5 downto 3) = "100" then
			   r4 := t3;
			elsif inp(5 downto 3) = "101" then
			   r5 := t3;
			elsif inp(5 downto 3) = "110" then
			   r6 := t3;
			elsif inp(5 downto 3) = "111" then
			   r7 := t3;
			end if;
			-- Found Rc
			 
			 
			 
			 
			 
			 
		end if ;
	end if ;
	
	--ADC function
if inp (15 downto 12) = "0001"  then 
	if inp ( 1 downto 0) = "10") then
		if  CC(1) = 1 then 
			if inp(11 downto 9) = "000" then
				t1 := r0;
			elsif inp(11 downto 9) = "001" then
				t1 := r1;
			elsif inp(11 downto 9) = "010" then
				t1 := r2;
			elsif inp(11 downto 9) = "011" then
				t1 := r3;
			elsif inp(11 downto 9) = "100" then
				t1 := r4;
			elsif inp(11 downto 9) = "101" then
				t1 := r5;
			elsif inp(11 downto 9) = "110" then
			   	t1 := r6;
			elsif inp(11 downto 9) = "111" then
			   	t1 := r7;                               
			end if;
			-- Found Ra
			if inp(8 downto 6) = "000" then
				t2 := r0;
			elsif inp(8 downto 6) = "001" then
				t2 := r1;
			elsif inp(8 downto 6) = "010" then
			   	t2 := r2;
			elsif inp(8 downto 6) = "011" then
				t2 := r3;
			elsif inp(8 downto 6) = "100" then
				t2 := r4;
			elsif inp(8 downto 6) = "101" then
			   	t2 := r5;
			elsif inp(8 downto 6) = "110" then
			   	t2 := r6;
			elsif inp(8 downto 6) = "111" then
			   	t2 := r7;
			end if;b
			-- Found R
			 
			ADC_ALU : ALU
			port map(t1=>inp1,t2=>inp2,"0"=>op_sel,t3=>outp,CC(1)=>c,CC(0)=>z);
				
			if inp(5 downto 3) = "000" then
				r0 := t3;
			elsif inp(5 downto 3) = "001" then
				r1 := t3;
			elsif inp(5 downto 3) = "010" then
			  	 r2 := t3;
			elsif inp(5 downto 3) = "011" then
			   	r3 := t3;
			elsif inp(5 downto 3) = "100" then
			   	r4 := t3;
			elsif inp(5 downto 3) = "101" then
			   	r5 := t3;
			elsif inp(5 downto 3) = "110" then
			   	r6 := t3;
			elsif inp(5 downto 3) = "111" then
			   	r7 := t3;
			end if;
			-- Found Rc
			 
			 
			 
			 
			 
		end if ; 
	end if ;
end if ;
	
  --ADZ function
if inp (15 downto 12) = "0001"  then 
	if inp ( 1 downto 0) = "01") then
		if CC(0)= 1 then
			if inp(11 downto 9) = "000" then
				t1 := r0;
			elsif inp(11 downto 9) = "001" then
				t1 := r1;
			elsif inp(11 downto 9) = "010" then
			   	t1 := r2;
			elsif inp(11 downto 9) = "011" then
			   	t1 := r3;
			elsif inp(11 downto 9) = "100" then
			   	t1 := r4;
			elsif inp(11 downto 9) = "101" then
			   	t1 := r5;
			elsif inp(11 downto 9) = "110" then
			   	t1 := r6;
			elsif inp(11 downto 9) = "111" then
			   	t1 := r7;                               
			end if;
			-- Found Ra
			if inp( 8 downto 6) = "000" then
				t2 := r0;
			elsif inp(8 downto 6) = "001" then
				t2 := r1;
			elsif inp(8 downto 6) = "010" then
			   	t2 := r2;
			elsif inp(8 downto 6) = "011" then
			   	t2 := r3;
			elsif inp(8 downto 6) = "100" then
				t2 := r4;
			elsif inp(8 downto 6) = "101" then
			   	t2 := r5;
			elsif inp(8 downto 6) = "110" then
			   	t2 := r6;
			elsif inp(8 downto 6) = "111" then
			   	t2 := r7;
			end if;b
			-- Found R
			ADZ_ALU : ALU
			port map(t1=>inp1,t2=>inp2,"0"=>op_sel,t3=>outp,CC(1)=>c,CC(0)=>z);
			-- get t3 by passing t1 and t2 to alu
			-- ADZ : alu port map ( t1,t2,"001",t3)
			
			-- store the t3 value in coresponding register
			if inp(5 downto 3) = "000" then
				r0 := t3;
			elsif inp(5 downto 3) = "001" then
				r1 := t3;
			elsif inp(5 downto 3) = "010" then
			   	r2 := t3;
			elsif inp(5 downto 3) = "011" then
			   	r3 := t3;
			elsif inp(5 downto 3) = "100" then
			   	r4 := t3;
			elsif inp(5 downto 3) = "101" then
			   	r5 := t3;
			elsif inp(5 downto 3) = "110" then
			   	r6 := t3;
			elsif inp(5 downto 3) = "111" then
			   	r7 := t3;
			end if;
			-- Found Rc
			 
			 
			 
			 
			 
		end if ;	 
	end if ;
end if ;

	--ADL function
if inp (15 downto 12) = "0001"  then 
		if inp ( 1 downto 0) = "11") then
			if inp(11 downto 9) = "000" then
				t1 := r0;
			elsif inp(11 downto 9) = "001" then
				t1 := r1;
			elsif inp(11 downto 9) = "010" then
			   	t1 := r2;
			elsif inp(11 downto 9) = "011" then
			   	t1 := r3;
			elsif inp(11 downto 9) = "100" then
			   	t1 := r4;
			elsif inp(11 downto 9) = "101" then
			   	t1 := r5;
			elsif inp(11 downto 9) = "110" then
			   	t1 := r6;
			elsif inp(11 downto 9) = "111" then
			   	t1 := r7;                               
			end if;
			-- Found Ra
			if inp(8 downto 6) = "000" then
				t2 := r0;
			elsif inp(8 downto 6) = "001" then
				t2 := r1;
			elsif inp(8 downto 6) = "010" then
			   	t2 := r2;
			elsif inp(8 downto 6) = "011" then
			   	t2 := r3;
			elsif inp(8 downto 6) = "100" then
				t2 := r4;
			elsif inp(8 downto 6) = "101" then
			   	t2 := r5;
			elsif inp(8 downto 6) = "110" then
			   	t2 := r6;
			elsif inp(8 downto 6) = "111" then
			   	t2 := r7;
			end if;
			t2 := t2(14 downto 0 ) & 0 ;
			-- Found R
			 
			-- get t3 by passing t1 and t2 to alu
			-- ADL : alu port map ( t1,t2,"001",t3)
			
			-- store the t3 value in coresponding register
			if inp(5 downto 3) = "000" then
				r0:= t3;
			elsif inp(5 downto 3) = "001" then
				r1:= t3;
			elsif inp(5 downto 3) = "010" then
			   	r2 := t3;
			elsif inp(5 downto 3) = "011" then
			   	r3:= t3;
			elsif inp(5 downto 3 ) = "100" then
			   	r4:= t3;
			elsif inp(5 downto 3) = "101" then
			   	r5:= t3;
			elsif inp(5 downto 3) = "110" then
			   	r6 := t3;
			elsif inp(5 downto 3) = "111" then
			   	r7 := t3;
			end if;
			-- Found Rc
			 
			 
			 
			 
			 
			 
		end if ;
	end if ;

 --ADI function	
if inp (15 downto 12) = "0000"  then 
		if inp(11 downto 9) = "000" then
			t1 := r0;
		elsif inp(11 downto 9) = "001" then
			t1 := r1;
		elsif inp(11 downto 9) = "010" then
			t1 := r2;
		elsif inp(11 downto 9) = "011" then
			t1 := r3;
		elsif inp(11 downto 9) = "100" then
			t1 := r4;
		elsif inp(11 downto 9) = "101" then
			t1 := r5;
		elsif inp(11 downto 9) = "110" then
			t1 := r6;
		elsif inp(11 downto 9) = "111" then
			t1 := r7;                               
		end if;
			-- Found Ra			 
		  
		t2 := inp(5) & "0000000000" & inp(4 downto 0);
      -- storing value in t2
               ADI_ALU : ALU
			port map(t1=>inp1,t2=>inp2,"0"=>op_sel,t3=>outp,CC(1)=>c,CC(0)=>z);
      -- store the t3 value in coresponding register
		
		if inp(8 downto 6) = "000" then
			r0 := t3;	
		elsif inp(8 downto 6) = "001" then
			r1 := t3;
		elsif inp(8 downto 6) = "010" then
			r2 := t3;
		elsif inp(8 downto 6) = "011" then
			r3:= t3;
		elsif inp(8 downto 6) = "100" then
			r4:= t3;
		elsif inp(8 downto 6) = "101" then
			r5:= t3;
		elsif inp(8 downto 6) = "110" then
			r6:= t3;
		elsif inp(8 downto 6) = "111" then
			r7:= t1;
		end if;
			-- Found Rb
			 
end if ;
		
  --NDU function	
if inp (15 downto 12) = "0010"  then 
		if inp ( 1 downto 0) = "00") then
			if inp(11 downto 9) = "000" then
				t1 := r0;
			elsif inp(11 downto 9) = "001" then
				t1 := r1;
			elsif inp(11 downto 9) = "010" then
			   	t1 := r2;
			elsif inp(11 downto 9) = "011" then
			   	t1 := r3;
			elsif inp(11 downto 9) = "100" then
			   	t1 := r4;
			elsif inp(11 downto 9) = "101" then
			   	t1 := r5;
			elsif inp(11 downto 9) = "110" then
			   	t1 := r6;
			elsif inp(11 downto 9) = "111" then
			   	t1 := r7;                               
			end if;
			-- Found Ra
			if inp(8 downto 6) = "000" then
				t2 := r0;
			elsif inp(8 downto 6) = "001" then
				t2 := r1;
			elsif inp(8 downto 6) = "010" then
			   	t2 := r2;
			elsif inp(8 downto 6) = "011" then
			  	t2 := r3;
			elsif inp(8 downto 6) = "100" then
				t2 := r4;
			elsif inp(8 downto 6) = "101" then
			   	t2 := r5;
			elsif inp(8 downto 6) = "110" then
			   	t2 := r6;
			elsif inp(8 downto 6) = "111" then
			   	t2 := r7;
			end if;b
			-- Found R
			 
			-- get t3 by passing t1 and t2 to alu
			-- NDU : alu port map ( t1,t2,"001",t3)
			
			-- store the t3 value in coresponding register
			if inp(5 downto 3) = "000" then
				r0 := t3;
			elsif inp(5 downto 3) = "001" then
				r1 := t3;
			elsif inp(5 downto 3) = "010" then
			   	r2:= t3;
			elsif inp(5 downto 3) = "011" then
			   	r3:= t3;
			elsif inp(5 downto 3) = "100" then
			   	r4:= t3;
			elsif inp(5 downto 3) = "101" then
			   	r5:= t3;
			elsif inp(5 downto 3) = "110" then
			   	r6:= t3;
			elsif inp(5 downto 3) = "111" then
			   	r7:= t3;
			end if;
			-- Found Rc
			 
			 
			 
			 
			 
			 
		end if ;
	end if ;

 --NDC function	
if inp (15 downto 12) = "0010"  then 
		if inp ( 1 downto 0) = "10") then
			if inp(11 downto 9) = "000" then
				t1 := r0;
			elsif inp(11 downto 9) = "001" then
				t1 := r1;
			elsif inp(11 downto 9) = "010" then
			   	t1 := r2;
			elsif inp(11 downto 9) = "011" then
			   	t1 := r3;
			elsif inp(11 downto 9) = "100" then
			   	t1 := r4;
			elsif inp(11 downto 9) = "101" then
			   	t1 := r5;
			elsif inp(11 downto 9) = "110" then
			   	t1 := r6;
			elsif inp(11 downto 9) = "111" then
			   	t1 := r7;                               
			end if;
			-- Found Ra
			if inp(8 downto 6) = "000" then
				t2 := r0;
			elsif inp(8 downto 6) = "001" then
				t2 := r1;
			elsif inp(8 downto 6) = "010" then
			   	t2 := r2;
			elsif inp(8 downto 6) = "011" then
			   	t2 := r3;
			elsif inp(8 downto 6) = "100" then
				t2 := r4;
			elsif inp(8 downto 6) = "101" then
			   	t2 := r5;
			elsif inp(8 downto 6) = "110" then
			   	t2 := r6;
			elsif inp(8 downto 6) = "111" then
			   	t2 := r7;
			end if;b
			-- Found R
			 
			-- get t3 by passing t1 and t2 to alu
			-- NDC : alu port map ( t1,t2,"001",t3)
			
			-- store the t3 value in coresponding register
			if inp(5 downto 3) = "000" then
				r0 := t3;
			elsif inp(5 downto 3) = "001" then
				r1 := t3;
			elsif inp(5 downto 3) = "010" then
			   	r2:= t3;
			elsif inp(5 downto 3) = "011" then
			   	r3:= t3;
			elsif inp(5 downto 3) = "100" then
			   	r4:= t3;
			elsif inp(5 downto 3) = "101" then
			   	r5:= t3;
			elsif inp(5 downto 3) = "110" then
			   	r6:= t3;
			elsif inp(5 downto 3) = "111" then
			   	r7:= t3;
			end if;
			-- Found Rc
			 
			 
			 
			 
			 
			 
		end if ;
	end if ;

 --NDZ function	
if inp (15 downto 12) = "0010"  then 
	if inp ( 1 downto 0) = "01") then
			if inp(11 downto 9) = "000" then
				t1 := r0;
			elsif inp(11 downto 9) = "001" then
				t1 := r1;
			elsif inp(11 downto 9) = "010" then
			   	t1 := r2;
			elsif inp(11 downto 9) = "011" then
			   	t1 := r3;
			elsif inp(11 downto 9) = "100" then
			   	t1 := r4;
			elsif inp(11 downto 9) = "101" then
			   	t1 := r5;
			elsif inp(11 downto 9) = "110" then
			   	t1 := r6;
			elsif inp(11 downto 9) = "111" then
			   	t1 := r7;                               
			end if;
			-- Found Ra
			if inp(8 downto 6) = "000" then
				t2 := r0;
			elsif inp(8 downto 6) = "001" then
				t2 := r1;
			elsif inp(8 downto 6) = "010" then
			   	t2 := r2;
			elsif inp(8 downto 6) = "011" then
			   	t2 := r3;
			elsif inp(8 downto 6) = "100" then
				t2 := r4;
			elsif inp(8 downto 6) = "101" then
			   	t2 := r5;
			elsif inp(8 downto 6) = "110" then
			   	t2 := r6;
			elsif inp(8 downto 6) = "111" then
			   	t2 := r7;
			end if;
			-- Found R
			 
			-- get t3 by passing t1 and t2 to alu
			-- NDZ : alu port map ( t1,t2,"001",t3)
			
			-- store the t3 value in coresponding register
			if inp(5 downto 3) = "000" then
				r0 := t3;
			elsif inp(5 downto 3) = "001" then
				r1 := t3;
			elsif inp(5 downto 3) = "010" then
			   	r2 := t3;
			elsif inp(5 downto 3) = "011" then
			   	r3:= t3;
			elsif inp(5 downto 3) = "100" then
			   	r4:= t3;
			elsif inp(5 downto 3) = "101" then
			   	r5:= t3;
			elsif inp(5 downto 3) = "110" then
			   	r6:= t3;
			elsif inp(5 downto 3) = "111" then
			   	r7:= t3;
			end if;
			-- Found Rc
			 

		end if ;
	end if ;

 --LHI function
if inp (15 downto 12) = "0011"  then 
		t3 := inp(8 downto 0) & "0000000" ;

	-- load t3 to register
		if inp(11 downto 9) = "000" then
			r0 := t3;	
		elsif inp(11 downto 9) = "001" then
			r1 := t3;
		elsif inp(11 downto 9) = "010" then
			r2 := t3;
		elsif inp(11 downto 9) = "011" then
			r3:= t3;
		elsif inp(11 downto 9) = "100" then
			r4:= t3;
		elsif inp(11 downto 9) = "101" then
			r5:= t3;
		elsif inp(11 downto 9) = "110" then
			r6:= t3;
		elsif inp(11 downto 9) = "111" then
			r7:= t3;
		end if;
	-- found Ra
		
end if ;	
	
--LW function
if inp(15 downto 12) = "0111" then
	t1 := inp(5) & "0000000000" & inp(4 downto 0);
  --load t2 with register
       if inp(8 downto 6) = "000" then
		t2 := r0;
      elsif inp(8 downto 6) = "001" then
		t2 := r1;
      elsif inp(8 downto 6) = "010" then
	        t2 := r2;
      elsif inp(8 downto 6) = "011" then
	        t2 := r3;
      elsif inp(8 downto 6) = "100" then
		t2 := r4;
      elsif inp(8 downto 6) = "101" then
	   	t2 := r5;
      elsif inp(8 downto 6) = "110" then
	        t2 := r6;
      elsif inp(8 downto 6) = "111" then
	 	t2 := r7;
       end if;	
	       --ADD t2 and t1;
	       --t3=t2+t1;
   signal mem_location : std_logic_vector(15 downto 0);
   signal mem_loc_int : integer;
        mem_location := t3;
   mem_loc_int <= to_integer(unsigned(mem_location));
   t3 := MM((mem_loc_int+15) downto mem_loc_int));
-- load t3 to register
		if inp(11 downto 9) = "000" then
			r0 := t3;	
		elsif inp(11 downto 9) = "001" then
			r1 := t3;
		elsif inp(11 downto 9) = "010" then
			r2 := t3;
		elsif inp(11 downto 9) = "011" then
			r3:= t3;
		elsif inp(11 downto 9) = "100" then
			r4:= t3;
		elsif inp(11 downto 9) = "101" then
			r5:= t3;
		elsif inp(11 downto 9) = "110" then
			r6:= t3;
		elsif inp(11 downto 9) = "111" then
			r7:= t3;
		end if;
	-- found Ra
end if;
  
--SW function
   if inp(15 downto 12) = "0101" then  
     t1 := inp(5) & "0000000000" & inp(4 downto 0);
 --load t2 with register
       if inp(8 downto 6) = "000" then
		t2 := r0;
      elsif inp(8 downto 6) = "001" then
		t2 := r1;
      elsif inp(8 downto 6) = "010" then
	        t2 := r2;
      elsif inp(8 downto 6) = "011" then
	        t2 := r3;
      elsif inp(8 downto 6) = "100" then
		t2 := r4;
      elsif inp(8 downto 6) = "101" then
	   	t2 := r5;
      elsif inp(8 downto 6) = "110" then
	        t2 := r6;
      elsif inp(8 downto 6) = "111" then
	 	t2 := r7;
       end if;	
	     --ADD t2 and t1;
	       --t3=t2+t1;
	       
	       
       if inp(11 downto 9) = "000" then
		t1 := r0;
      elsif inp(11 downto 9) = "001" then
		t1 := r1;
      elsif inp(11 downto 9) = "010" then
	        t1 := r2;
      elsif inp(11 downto 9) = "011" then
	        t1 := r3;
      elsif inp(11 downto 9) = "100" then
		t1 := r4;
      elsif inp(11 downto 9) = "101" then
	   	t1 := r5;
      elsif inp(11 downto 9) = "110" then
	        t1 := r6;
      elsif inp(11 downto 9) = "111" then
	 	t1 := r7;
       end if;	
 mem_location := t3;
   mem_loc_int <= to_integer(unsigned(mem_location));
    MM((mem_loc_int+15) downto mem_loc_int)) := t1;
end if;

--BEQ function
if inp(15 down to 12) = "1000" then
    -- load t1 with register A
        if inp(11 downto 9) = "000" then
            t1 := r0;
        elsif inp(11 down to 9) = "001" then
            t1 := r1;
        elsif inp(11 down to 9) = "010" then
            t1 := r2;
        elsif inp(11 down to 9) = "011" then
            t1 := r3;
        elsif inp(11 down to 9) = "100" then
            t1 := r4;
        elsif inp(11 down to 9) = "101" then
            t1 := r5;
        elsif inp(11 down to 9) = "110" then
            t1 := r6;
        elsif inp(11 down to 9) = "111" then
            t1 := r7;
        end if;
    -- load t2 with register B
        if inp(8 downto 6) = "000" then
            t2 := r0;
        elsif inp(8 downto 6) = "001" then
            t2 := r1;
        elsif inp(8 downto 6) = "010" then
            t2 := r2;
        elsif inp(8 downto 6) = "011" then
            t2 := r3;
        elsif inp(8 downto 6) = "100" then
            t2 := r4;
        elsif inp(8 downto 6) = "101" then
            t2 := r5;
        elsif inp(8 downto 6) = "110" then
            t2 := r6;
        elsif inp(8 downto 6) = "111" then
            t2 := r7;
        end if;	
        
        --  t3 = inp(5) & "0000000000" & inp(4 downto 0)
        --  if t1 = t2 then
        --      r7 = r7 + t3
-- JAL function
if inp(15 downto 12) = "1001" then
    --  t3 = inp(5) & "0000000000" & inp(4 downto 0)
    --      r7 = r7 + t3;

    t3 = r7 + 1;
    if inp(11 downto 9) = "000" then
    	r0 := t3;	
	elsif inp(11 downto 9) = "001" then
		r1 := t3;
	elsif inp(11 downto 9) = "010" then
		r2 := t3;
	elsif inp(11 downto 9) = "011" then
		r3:= t3;
	elsif inp(11 downto 9) = "100" then
		r4:= t3;
	elsif inp(11 downto 9) = "101" then
		r5:= t3;
	elsif inp(11 downto 9) = "110" then
		r6:= t3;
	elsif inp(11 downto 9) = "111" then
		r7:= t3;
	end if;




-- JLR function
if inp(15 downto 12) = "1010" then
    if inp(8 downto 6) = "000" then
        t2 := r0;
    elsif inp(8 downto 6) = "001" then
        t2 := r1;
    elsif inp(8 downto 6) = "010" then
        t2 := r2;
    elsif inp(8 downto 6) = "011" then
        t2 := r3;
    elsif inp(8 downto 6) = "100" then
        t2 := r4;
    elsif inp(8 downto 6) = "101" then
      	t2 := r5;
    elsif inp(8 downto 6) = "110" then
        t2 := r6;
    elsif inp(8 downto 6) = "111" then
    	t2 := r7;
    end if;

    r7 := t2;

    t3 = r7 + 1;

    if inp(11 downto 9) = "000" then
    	r0 := t3;	
    elsif inp(11 downto 9) = "001" then
	r1 := t3;
    elsif inp(11 downto 9) = "010" then
	r2 := t3;
    elsif inp(11 downto 9) = "011" then
	r3:= t3;
    elsif inp(11 downto 9) = "100" then
	r4:= t3;
    elsif inp(11 downto 9) = "101" then
	r5:= t3;
    elsif inp(11 downto 9) = "110" then
	r6:= t3;
    elsif inp(11 downto 9) = "111" then
	r7:= t3;
    end if;



-- JRI function
if inp(15 downto 12) = "1011" then
    if inp(11 downto 9) = "000" then
        t1 := r0;
    elsif inp(11 downto 9) = "000" then
        t1 := r1;
    elsif inp(11 downto 9) = "000" then
        t1 := r2;
    elsif inp(11 downto 9) = "000" then
        t1 := r3;
    elsif inp(11 downto 9) = "000" then
        t1 := r4;
    elsif inp(11 downto 9) = "000" then
        t1 := r5;
    elsif inp(11 downto 9) = "000" then
        t1 := r6;
    elsif inp(11 downto 9) = "000" then
        t1 := r7;
    end if;

    t2 := inp(5) & "0000000000" & inp(4 downto 0);
    -- t3 = t2 + t1;
    r7 = t3;
    
    

	       


end architecture ;
