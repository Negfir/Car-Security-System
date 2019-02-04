----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/18/2018 08:01:45 PM
-- Design Name: 
-- Module Name: Security - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


package mypackage is    

type four_dig is array (0 to 3) of integer range 0 to 9;
type six_dig is array (0 to 5) of integer range 0 to 9;
end mypackage;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL; 
use work.mypackage.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Security is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           Command : in STD_LOGIC_VECTOR (31 downto 0);
           Door : in STD_LOGIC;
           Window : in STD_LOGIC;
           Alarmm : out STD_LOGIC);
end Security;

architecture Behavioral of Security is

function Char_To_Int (ch : integer) 
          return integer is
begin
  if (ch=character'pos('0')) then 
      return 0;
  elsif (ch=character'pos('1')) then    
      return 1;
  elsif (ch=character'pos('2')) then    
      return 2;
  elsif (ch=character'pos('3')) then    
      return 3;
  elsif (ch=character'pos('4')) then    
      return 4;
  elsif (ch=character'pos('5')) then    
      return 5;
  elsif (ch=character'pos('6')) then    
      return 6;
  elsif (ch=character'pos('7')) then    
      return 7;
  elsif (ch=character'pos('8')) then    
      return 8;
  elsif (ch=character'pos('9')) then    
      return 9;    
  else 
      return 10;
  end if;    
end Char_To_Int;

type MyArray is array ( 1 to 4) of four_dig;
type my_state is (Reset,s0,s1,s2,s3,USR1,USR2,USR3,Change1,Change2,Change3,Change4,Change5,Done,On1,NewU1,System_on,Cnt30ToStart,DoorAlarm,Alarming,Pass1,Pass2,Pass3,Pass4,PassEnd);
signal Passwords : MyArray; 
signal CURS, NEXTS,Current2,Next2 : my_state;
signal int: integer range 0 to 90:=0;
signal count,count10: integer:=0;
signal count5: integer range 0 to 4:=0;
signal en,enM,en10,FlagNew: std_logic:='0';
signal Flag: std_logic:='1';
signal oldPass0: six_dig;
signal newPass0: four_dig;
signal Alarm,puls : STD_LOGIC:='0';


begin
process(clk)
begin
if (clk'event and clk='1') then
   if RST = '1' then
      CURS <= Reset;
    
   else
      CURS <= NEXTS;
     
   end if;
end if;
end process;

int <= to_integer(unsigned(Command(31 downto 1)));

   process (clk) is
   begin
      if (clk'event and clk='1') then  
        FlagNew<=Flag;
        Flag<=Command(0);
      end if;
   end process;

   
   process(clk,en)
   begin
         if (clk'event and clk='1') then
             if en = '0' then
                    count <= 0;
                    
            else
             count<=count+1;
          
               
      end if;
   end if;     
   end process; 
   
   
   process(clk,en10)
   begin
         if (clk'event and clk='1') then
             if en10 = '0' then
                    count10 <= 0;
                    
            else
             count10<=count10+1;
          
               
      end if;
   end if;     
   end process;    
   

   ---modulo 5 counter
   process(clk,enM)
   begin
         if (clk'event and clk='1') then
            if enM = '0' then
                    count5 <= 0;
                    
            else
				if (count5=4) then 
					count5<=0;
				else 
					count5<=count5+1;
				end if;		
			
			 if(count5=4) then 
				puls<='1';
			 else
				puls<='0';
			 end if;				
               
			end if;
   end if;     
   end process;   

process(CURS,Command,count,count10,count5,Door,Window)
variable user,AlarmNum: integer range 0 to 9:=0;
variable C: integer range 0 to 99:=0;
variable oldPass: six_dig;
variable newPass: four_dig;

begin
 C:=Char_To_Int(int);
  case CURS is 
      when Reset =>
         if (int=35 and (FlagNew xor Flag)='1') then
              NEXTS<=S0;
          else 
              NEXTS<=Reset;
         end if; 
		 
      when S0 =>
          if ((FlagNew xor Flag)='0') then
            NEXTS<=S0;  
          elsif (int=character'pos('1') or int=character'pos('2') or int=character'pos('3') or int=character'pos('4')) then
             user:=C;
             NEXTS<=S1;             
          else 
			 NEXTS<=Reset;                
          end if; 
              
      when S1 =>
          if ((FlagNew xor Flag)='0') then
            NEXTS<=S1;  
          elsif (int=42) then
             NEXTS<=S2;
          else  
             NEXTS<=Reset;               
          end if;   

      when S2 =>
          if ((FlagNew xor Flag)='0') then
            NEXTS<=S2;  
          elsif (C=10) then
             NEXTS<=Reset;
          else  
             oldPass(0):=C;
             NEXTS<=S3;              
          end if; 		  
-------------------------------------------------------------------------------------------------------------------
      when S3 =>
          if ((FlagNew xor Flag)='0') then
            NEXTS<=S3; 
          elsif (int=35) then	
			NEXTS<=Cnt30ToStart;
          elsif (C=10) then
             NEXTS<=Reset;
          else  
             oldPass(1):=C;
             NEXTS<=USR1;               
          end if; 
		  
	  when USR1 =>
          if ((FlagNew xor Flag)='0') then
            NEXTS<=USR1;  
          elsif (C=10) then
             NEXTS<=Reset;
          else  
             oldPass(2):=C;
             NEXTS<=USR2;              
          end if;
		  
	  when USR2 =>
          if ((FlagNew xor Flag)='0') then
            NEXTS<=USR2;  
          elsif (C=10) then
             NEXTS<=Reset;
          else  
             oldPass(3):=C;
             NEXTS<=USR3;               
          end if;	

      when USR3 =>
          if ((FlagNew xor Flag)='0') then
            NEXTS<=USR3; 
          elsif (int=42 and Passwords(user)(0)=oldPass(0) and Passwords(user)(1)=oldPass(1) and Passwords(user)(2)=oldPass(2) and Passwords(user)(3)=oldPass(3)) then	
			NEXTS<=Change2;
          elsif (C=10) then
             NEXTS<=Reset;
          elsif (oldPass(0)=1 and oldPass(1)=2 and oldPass(2)=3 and oldPass(3)=4 and C=5) then
             oldPass(4):=C;
             NEXTS<=NewU1; 
		  else
		     NEXTS<=Reset;
          end if; 

	  when NewU1 =>
          if ((FlagNew xor Flag)='0') then
            NEXTS<=NewU1;  
          elsif (C=10) then
             NEXTS<=Reset;
          elsif (C=6) then
             oldPass(5):=C;
             NEXTS<=Change1;
		  else 
		     NEXTS<=Reset;
          end if;		  

      when Change1 =>
          if ((FlagNew xor Flag)='0') then
            NEXTS<=Change1;  
          elsif (int=42) then
             NEXTS<=Change2;
          else  
             NEXTS<=reset;               
          end if; 		  
		  
	  when Change2 =>
          if ((FlagNew xor Flag)='0') then
            NEXTS<=Change2;  
          elsif (C=10) then
             NEXTS<=Reset;
          else  
             newPass(0):=C;
             NEXTS<=Change3;              
          end if;
		  
	  when Change3 =>
          if ((FlagNew xor Flag)='0') then
            NEXTS<=Change3;  
          elsif (C=10) then
             NEXTS<=Reset;
          else  
             newPass(1):=C;
             NEXTS<=Change4;              
          end if;
		  
	  when Change4 =>
          if ((FlagNew xor Flag)='0') then
            NEXTS<=Change4;  
          elsif (C=10) then
             NEXTS<=Reset;
          else  
             newPass(2):=C;
             NEXTS<=Change5;              
          end if;	

	  when Change5 =>
          if ((FlagNew xor Flag)='0') then
            NEXTS<=Change5;  
          elsif (C=10) then
             NEXTS<=Reset;
          else  
             newPass(3):=C;
             NEXTS<=Done;              
          end if;		  
		
      when Done =>
          if ((FlagNew xor Flag)='0') then
            NEXTS<=Done;  
          elsif (int=35) then
		     Passwords(user)(0)<=newPass(0);
			 Passwords(user)(1)<=newPass(1);
			 Passwords(user)(2)<=newPass(2);
			 Passwords(user)(3)<=newPass(3);
             NEXTS<=Reset;
          else  
             NEXTS<=Reset;               
          end if; 
		  
	  when Cnt30ToStart =>
            en<='1';
            if  (count<30) then
                
                NEXTS<=Cnt30ToStart;
                report "yes";
            else
				Alarm<='1';
                en<='0';
                NEXTS<=System_on; 
                report "no";              
            end if;	  


	  when System_on => 
			Alarm<='0';
	        en<='0';
			if (Window='1') then
				Alarm<='1';
				NEXTS<=System_on;
			elsif (Door='1') then 
				NEXTS <= DoorAlarm;	
			else
				NEXTS<=System_on;
			end if;
	
	  when DoorAlarm =>
			en<='1';
			enM<='1';
			en10<='0';
			if(count<30) then		
				if (int=35 and (FlagNew xor Flag)='1') then
					NEXTS<=Pass1;
				else 
					NEXTS<=DoorAlarm;
				end if; 
			else
				NEXTS<=Alarming;
			end if;	
			
	  when Pass1 =>
			en<='1';
			enM<='1';
			if(count<30) then
				if ((FlagNew xor Flag)='0') then
					en10<='1';
					if (count10<10) then
					NEXTS<=Pass1; 
					else
					NEXTS<=DoorAlarm;
					end if;
				elsif (C=10) then
					NEXTS<=DoorAlarm;
				else  
					newPass(0):=C;
				NEXTS<=Pass2;
				end if;
			else
				NEXTS<=Alarming;
			end if;	
			
	  when Pass2 =>
			en<='1';
			enM<='1';
			if(count<30) then
				if ((FlagNew xor Flag)='0') then
					en10<='1';
					if (count10<10) then
					NEXTS<=Pass2; 
					else
					NEXTS<=DoorAlarm;
					end if;				
  
				elsif (C=10) then
					NEXTS<=DoorAlarm;
				else  
					newPass(1):=C;
				NEXTS<=Pass3;
				end if;
			else
				NEXTS<=Alarming;
			end if;	

	  when Pass3 =>
			en<='1';
			enM<='1';
			if(count<30) then
				if ((FlagNew xor Flag)='0') then
					en10<='1';
					if (count10<10) then
					NEXTS<=Pass3; 
					else
					NEXTS<=DoorAlarm;
					end if;				 
				elsif (C=10) then
					NEXTS<=DoorAlarm;
				else  
					newPass(2):=C;
				NEXTS<=Pass4;
				end if;
			else
				NEXTS<=Alarming;
			end if;	

	  when Pass4 =>
			en<='1';
			enM<='1';
			if(count<30) then
				if ((FlagNew xor Flag)='0') then
					en10<='1';
					if (count10<10) then
					NEXTS<=Pass4; 
					else
					NEXTS<=DoorAlarm;
					end if; 
				elsif (C=10) then
					NEXTS<=DoorAlarm;
				else  
					newPass(3):=C;
				NEXTS<=PassEnd;
				end if;
			else
				NEXTS<=Alarming;
			end if;	

      when PassEnd =>
          if ((FlagNew xor Flag)='0') then
					en10<='1';
					if (count10<10) then
					NEXTS<=PassEnd; 
					else
					NEXTS<=DoorAlarm;
					end if; 
          elsif (int=35) then
			 if (newPass(0)=Passwords(user)(0) and newPass(1)=Passwords(user)(1) and newPass(2)=Passwords(user)(2) and newPass(3)=Passwords(user)(3)) then
				enM<='0';
				en<='0';
				NEXTS<=Reset;
			 else
				AlarmNum:=AlarmNum+1;
				if (AlarmNum<3) then
					NEXTS<=DoorAlarm;
				else 
					NEXTS<=Alarming;
				end if;	
			 end if;	
          else  
             NEXTS<=DoorAlarm;               
          end if;	

		when Alarming =>
			
			if(Door='1') then
			Alarm<='1';
			NEXTS<=Alarming;
			else
			NEXTS<=System_on;
			end if;
			
       when others =>
        NEXTS<=reset;   
      end case;
	  
	  oldPass0<=oldPass;
	  newPass0<=newPass;
  end process;        		

  Alarmm<= Alarm or puls;
end Behavioral;
