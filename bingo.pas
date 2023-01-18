{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

Program Practicabingo;
uses StrUtils,sysutils;

Type
	TStringDynArray = array of ansistring;
	
	TPcarton = ^TRcarton;
	TPbolas = ^TRbolas;
	
	TRjugador = record
	cartones: TPcarton;
	numcartones: integer;
	estado: string;
	end;
	
	TRnumero = record
	numero: integer;
	estado: string;
	end;
	
	TRcarton = record
	tipocolor: string;
	numeros: array[1..5] of TRnumero;
	psigcarton: TPcarton;
	estado: string;
	end;
	
	TRbolas = record
	numero: integer;
	color: string;
	psigbola: TPbolas;
	end;
	
Const
	nomfichero: string = 'Datos.txt';
	
function findbingo (var jugadores: array of TRjugador): boolean;
var
	i: integer;
	j: integer;
	plista: TPcarton;
	cantidad: integer;
	numtachados: integer;
begin
	findbingo:= false;
	for i:= low(jugadores) to high(jugadores) do begin
		plista:= jugadores[i].cartones;
		while plista <> nil do begin
			numtachados:= 0;
			for j:= low(plista^.numeros) to high(plista^.numeros) do begin
				if plista^.numeros[j].estado = 'tachado' then begin
					numtachados:= numtachados + 1;
				end;
			end;
			if numtachados = 5 then begin
				findbingo:= true;
				jugadores[i].estado:= 'Bingo';
			end;
			plista:= plista^.psigcarton;
		end; 
	end;


end;

procedure cartonnuevo(var pinicial: TPcarton; carton: TRcarton);
var
	nodo, p: TPcarton;  //*
begin
	new(nodo);
	nodo^:= carton;
	nodo^.psigcarton := nil;
	if pinicial = nil then begin
		pinicial := nodo;
	end
	else begin
		p:= pinicial;
		while p^.psigcarton <> nil do begin
			p:= p^.psigcarton;
		end;
		p^.psigcarton:= nodo;
	end;
end;

procedure bolanueva(var pinicial2: TPbolas; bolas: TRbolas);
var
	nodo, p: TPbolas;
begin
	new(nodo);
	nodo^:= bolas;
	nodo^.psigbola:= nil;
	if pinicial2 = nil then begin
		pinicial2:= nodo;
	end
	else begin
		p:= pinicial2;
		while p^.psigbola <> nil do begin
			p:= p^.psigbola;
		end;
		p^.psigbola:= nodo;
	end;
end;

Procedure tacharnums(var jugadores: array of TRjugador; bola: TRbolas);
var
	i: integer;
	j: integer;
	plista: TPcarton;
begin
	for i:= low(jugadores) to high(jugadores) do begin
		jugadores[i].estado:= 'Nada';
		plista:= jugadores[i].cartones;
		while plista <> nil do begin
			if plista^.tipocolor = bola.color then begin
				for j:= low(plista^.numeros) to high(plista^.numeros) do begin
					if plista^.numeros[j].numero = bola.numero then begin
						plista^.numeros[j].estado:= 'tachado';
						jugadores[i].estado:= 'Tachado';
					end;
				end;
			end;
			plista:= plista^.psigcarton;
		end;
	end;
end;

Procedure escribirpreextra (jugadores: array of TRjugador);
var
	plista: TPcarton;
	i: integer;
	j: integer;
	numcarton: integer;
begin
	for i:= low(jugadores) to high(jugadores) do begin
		plista:= jugadores[i].cartones;
		numcarton:= 1;
		writeln('Jugador ', i + 1 , ' Carton ', jugadores[i].numcartones);
		while plista <> nil do begin
			write(plista^.tipocolor, ' ');
			for j:= low(plista^.numeros) to high(plista^.numeros) do begin
				if plista^.numeros[j].estado = 'tachado' then begin
					write('XX ');
				end
				else begin
					write(plista^.numeros[j].numero, ' ');
				end;
			end;
			writeln();
			plista:= plista^.psigcarton;
			numcarton:= numcarton + 1;
		end;
		writeln();
	end;
end;

Procedure escribirpostextra (jugadores: array of TRjugador);
var
	i:integer;
begin
	for i:= low(jugadores) to high(jugadores) do begin
		writeln('Jugador ', i + 1, ': ', jugadores[i].estado,'.'); 
	end;
	writeln();
end;

Procedure extraccion (var entrada: text; var jugadores: array of TRjugador);
var
	controllectura: boolean;
	numpalabras: integer;
	palabras: TStringDynArray;
	linea: string;
	i: integer;
	primercolor: integer;
	pinicial2: TPbolas;
	bola: TRbolas;
	resultado: boolean;
begin
	controllectura:= true;
	primercolor:= 0;
	pinicial2:= nil;
	while controllectura do begin
		escribirpreextra(jugadores);
		readln(entrada, linea);
		linea:= lowercase(linea);
		palabras:= SplitString(linea, ' ');
		numpalabras:= high(palabras);
		for i:= 0 to numpalabras do begin
			palabras[i]:= StringReplace(palabras[i], #9, '', [rfReplaceAll]);
			case palabras[i] of
				'rojo', 'verde', 'azul', 'amarillo': begin
					if primercolor = 0 then begin
						bola.color:= palabras[i];
						primercolor:= 1;
					end
					else begin
						bolanueva(pinicial2, bola);
					end
				end
			else
				bola.numero:= StrToInt(palabras[i]);
				tacharnums(jugadores, bola);
				resultado:= findbingo(jugadores);
				if resultado then begin
					controllectura:= false;
				end;
				escribirpostextra(jugadores);
				if eof(entrada) then begin
					controllectura:= false;
				end;
			end;
		end;
	end;
end;

Procedure leerjugadores (var entrada: text; var jugadores: array of TRjugador);
var
	controllectura: boolean;
	contador: integer;
	palabra: string;
	i: integer;
	j: integer;
	n: integer;
	linea: string;
	palabras: TStringDynArray;
	numpalabras: integer;
	carton: TRcarton;
	numcartones: integer;
	pinicial: TPcarton;
begin
	reset(entrada);
	controllectura:= true;
	numcartones:= 0;
	pinicial:= nil;
	j:= 0;
	n:= 1;
	while controllectura do begin
		if j < 3 then begin  //leer cartones.
			readln(entrada, linea);
			linea:= lowercase(linea);
			palabras:= SplitString(linea, ' ');
			numpalabras:= high(palabras);
			for i:= 0 to numpalabras do begin
				palabras[i]:= StringReplace(palabras[i], #9, '', [rfReplaceAll]);
				case palabras[i] of
					'rojo', 'verde', 'azul', 'amarillo': begin
						if numcartones = 0 then begin	
							carton.tipocolor:= palabras[i];
							numcartones:= numcartones + 1;
						end
						else begin
							n:= 1;
							cartonnuevo(pinicial,carton);
							carton.tipocolor:= palabras[i];
							numcartones:= numcartones + 1;
						end
					end;
					'fin': begin
						cartonnuevo(pinicial,carton);
						jugadores[j].cartones:= pinicial;
						jugadores[j].numcartones:= numcartones;
						j:= j + 1;
						pinicial:= nil;
						numcartones:= 0;
						n:= 1;
					end;
				else
					carton.numeros[n].numero:= StrToInt(palabras[i]);
					carton.numeros[n].estado:= 'nada';
					n:= n + 1;
				end;
			end
		end
		else begin
			controllectura:= false; //j = 3 se acaba lectura cartones de jugadores.
		end;	
	end;
end;

Var
	entrada: text;
	jugadores: array[0..2] of TRjugador;

Begin
assign(entrada, nomfichero);
leerjugadores(entrada, jugadores);
extraccion(entrada, jugadores);









End.
