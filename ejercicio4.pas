{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

Program ejercicio4;

Var
	
	cantdinero:real;
	porcentaje:real;
	porcentfijo:real;
	siono:string;
	cantdinnoimpo:real;
	tramo:char;
	porcentram:real;
	resultado:real;
	restante:real;


Procedure leer;
	begin
		write('Introduzca su cantidad de dinero ganada honradamente: ');
		readln(cantdinero);
		write('Introduzca el porcentaje fijo que va a secuestrar el recaudador de impuestos (Ej.: 5%): ');
		read(porcentaje);
		porcentaje := porcentfijo / 100;
		write('Hay un minimo no imponible en la declaracion? ');
		readln(siono);
		siono := UpCase(siono);
		if siono = 'SI' then
			begin
				write('Introduzca la cantidad de dinero no imponible: ');
				readln(cantdinnoimpo);
			end;
		write('Introduzca el tramo en el que esta situado (A,B,C o D): ');
		readln(tramo);
		tramo := UpCase(tramo);
	end;
	
function calcular(percent,total:real):real;
	begin
		calcular := (percent * total);
	end;


Procedure escribir;
	begin
		writeln;
		writeln;
		writeln('Su declaracion de impuestos es: ');
		writeln;
		writeln('Cantidad de dinero: ',cantdinero:0:2);
		writeln('El porcentaje fijo es: ', porcentfijo:0:2);
		if siono = 'SI' then
			begin
				writeln('Existe un minimo no imponible');
				writeln('El minimo no imponible es: ', cantdinnoimpo:0:2)
			end
		else
			begin
				writeln('No existe minimo imponible');
			end;
		Case tramo of
			'A': porcentram := 0.1;
			'B': porcentram := 0.2;
			'C': porcentram := 0.3;
			'D': porcentram := 0.4;
		end;
		if cantdinero <= cantdinnoimpo then
			writeln('Su cantidad de dinero es menor a la imponible')
		else
			if tramo = 'A' then
				resultado := calcular(porcentram,cantdinero) + calcular(porcentfijo,cantdinero)
			else
				resultado := calcular(porcentram,cantdinero);
		writeln('La cantidad a pagar es: ', resultado:0:2);
		restante := cantdinero - resultado;
		writeln('El dinero restante es: ',restante)
		
	end;

	
Begin

	leer;
	escribir;
	
End.
