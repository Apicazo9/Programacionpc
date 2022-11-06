{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

Program ejercicio5;

Type

	tipoequipo = (redbull,ferrari,mercedes);
	tipomotor = integer;
	tipoaero = (alta,baja);
	tipopiloto = (leclerc,sainz,alonso);
	tipolicen = 0..12;
	tipopena = integer;
	tipotiempo = integer;
Var

	equipo : tipoequipo;
	motor : tipomotor;
	aero : tipoaero;
	piloto : tipopiloto;
	licen : tipolicen;
	pena : tipopena;
	tiempo : tipotiempo;
	
Procedure leer;
	begin
		writeln('Escriba los datos del equipo 1');
		write('	Nombre del equipo: ');
		readln(equipo);
		write(' Escriba si el motor es de 4,8 o 10 cilindros: ');
		readln(motor);
		write(' Escriba si la conf. aerodinamica es alta o baja: ');
		readln(aero);
		write(' Escriba nombre del piloto: ');
		readln(piloto);
		write(' Escriba los puntos de superlicencia: ');
		readln(licen);
		write(' Escriba la penalizacion en segundos: ');
		readln(pena);
		write( 'Tiempo total de la carrera: ');
		readln(tiempo);
	end;

	
	
Begin

	leer;
	writeln(equipo);
	writeln(motor);
	writeln(aero);
	writeln(licen);
	writeln(pena);
End.
