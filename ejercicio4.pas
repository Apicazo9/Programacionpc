{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

Program ejercicio4;

Var
	
	cantdinero:real;
	porcentfijo:real;
	siono:string;
	cantdinnoimpo:real;
	tramo:char;
	resultado:real;
	porcentram:real;


Procedure leer;
	begin
		write('Introduzca su cantidad de dinero ganada honradamente: ');
		readln(cantdinero);
		write('Introduzca el porcentaje fijo que va a secuestrar el recaudador de impuestos (Ej.: 0.1): ');
		readln(porcentfijo);
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

function(percentvaria:real)real;
	begin
		resultado := (cantdinero - (percentfijo * total) - (percentvaria * total));
	end;
	
Begin

	leer;
	
	Case tramo of
		'A': porcenttram := 0.1;
		'B': porcenttram := 0.2;
		'C': porcenttram := 0.3;
		'D': porcenttram := 0.4;
	end;


End.
