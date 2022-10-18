{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

Program ejercicio3;


Const

	Num1:char = '0';
	Num2:char = '1';
	Num3:char = '1';
	Base:integer = 16;
	
Var 

	v:integer;
	e:integer;
	
	
	function valorvalid (a:char;b:integer):boolean;
		begin
		
			if (b = 2) then
				if (a = '0') and (a = '1') then
					valorvalid := true
				else
					valorvalid := false;
			if (b = 8) then
				if (a >= '0') and (a <= '7') then
					valorvalid := true
				else
					valorvalid := false;
			if (b = 10) then
				if (a >= '0') and (a <= '9') then
					valorvalid := true
				else
					valorvalid := false;
			if (b = 16) then
				a := LowerCase(a);
				if ((a >= '0') and (a <= '9')) or ((a >= 'a') and (a <= 'f')) then
					valorvalid := true
				else
					valorvalid := false;
				
		end;
		
		function parono (a:integer):boolean;
			begin
				if a mod 2 = 0 then
					parono := true
				else
					parono := false;
			end;


begin

	if not(valorvalid(Num1,Base) and valorvalid(Num2,Base) and valorvalid(Num3,Base)) then
		writeln('Es mal numero')
	else
		writeln(UpCase(Num1),UpCase(Num2),UpCase(Num3));
		case base of 
			2:
				val('%' + Num1 + Num2 + Num3,v,e);
			8:
				val('&' + Num1 + Num2 + Num3,v,e);
			10:
				val(Num1 + Num2 + Num3,v,e);
			16:
				val('x' + Num1 + Num2 + Num3,v,e);
		end;
		if e = 0 then
			writeln(v);
		if parono (v) then
			writeln('Es par.')
		else 
			writeln('Es impar');
		
	
end.
