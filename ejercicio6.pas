{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

Program ejercicio6;

Type

	tipobarco = record
		submarino : integer;
		dragaminas : integer;
		fragata : integer;
		portaaviones : integer;


Procedure leerbarco;
	begin
		write('Introduzca la posicion de la proa: ');
		readln(posicion);


	end;


