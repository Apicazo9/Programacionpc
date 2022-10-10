{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

Program ejercicio1;
Uses math;

Const

	Mayus:char = 'M';
	Minus:char ='m';
	Num1:char = '2';
	Num2:integer = 4;
	Letra1:char = 'c';
	LadoArect:integer = 2;
	LadoBrect:integer = 3;
	Radiocir:integer = 4;
	Pi:real = 3.14;
	AreaCirc:integer = 20;
	AreaRect:integer = 20;
	NumA:integer = 5;
	NumB:integer = 8;
	NumC:integer = 2;
	
Begin

	writeln('La ', Mayus, ' en minuscula es ', LowerCase(Mayus));
	writeln('La mayuscula de ',Minus , ' es ' , UpCase(Minus));
	writeln('El doble del valor numerico de ', Num1,' es: ',Ord(Num1) * 2);
	If (Num2 mod 2 = 0) then
		writeln('El numero ', Num2,' es par.')
	else 
		writeln('El numero ', Num2,' es impar.');
	If (Ord(Letra1) - 96) mod 2 = 0 then
		writeln('La letra ', Letra1,' no esta en una posicion impar.')
	Else
		writeln('La letra ', Letra1,' si esta en una posicion impar.');
	writeln('el area del rectangulo es: ', LadoArect * LadoBrect);
	writeln('El volumen de la esfera es: ', (4/3) * Pi * Radiocir**3:0:2);
	If AreaCirc = AreaRect then
		writeln('El circulo y el rectangulo tienen el mismo area.')
	Else 
		writeln('El circulo y el rectangulo tienen area distinta.');
	writeln('La respuesta es: ', ((((-1) * NumB) + (sqrt(sqr(NumB) - (4 * NumA * NumC)))) / (2 * NumA)):0:2);
	
End.
