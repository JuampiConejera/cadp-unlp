(*
1. Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de losdos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: “Los números leídos son iguales”.
Solución:       *)
program practica1ejercicio1;
var
  entero1, entero2 : LongInt;
begin
  WriteLn('Introduzca el primer entero:  ');
  ReadLn(entero1);
  WriteLn('Introduzca el segundo entero:  ');
  ReadLn(entero2);
  if (entero1 > entero2) then
    WriteLn(entero1, ' es mayor.')
  else
    WriteLn(entero2, ' es mayor.')
end.

(*
2. Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un número X, se escribe |X| y se define como:
|X| = X cuando X es mayor o igual a cero
|X| = -X cuando X es menor a cero
Solución:   *)
program practica1ejercicicio2;
var
  numero : Real;
begin
  WriteLn('Escriba cualquier número');
  ReadLn(numero);
  if (numero < 0) then
    begin
      numero := -numero;
      WriteLn('|',numero:1:0,'|')
    end
  else
    WriteLn('|',numero:1:0,'|')
end.

(*
3. Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
Por ejemplo, si se ingresan los valores 4, -10 y 12, deberá imprimir: 12 4 -10
Solución:   *)
program practica1ejercicio3;
var
	num1, num2, num3 : integer;
begin
	WriteLn('Escriba los tres enteros, uno por cada línea.');
	ReadLn(num1);
	ReadLn(num2);
	ReadLn(num3);
  if (num1 > num2) and (num1 > num3) then begin
    if (num2 > num3) then
      WriteLn('Primero: ', num1, ', segundo: ', num2, ', tercero: ',num3)
    else
      WriteLn('Primero: ', num1, ', segundo: ', num3, ', tercero: ',num2);
    end
  else if (num2 > num1) and (num2 > num3) then begin
    if (num1 > num3) then
      WriteLn('Primero: ', num2, ', segundo: ', num1, ', tercero: ',num3)
    else
      WriteLn('Primero: ', num2, ', segundo: ', num3, ', tercero: ',num1)
    end
  else if (num3 > num1) and (num3 > num2) then begin
    if (num1 > num2) then
      WriteLn('Primero: ', num3, ', segundo: ', num1, ', tercero: ',num2)
    else
      WriteLn('Primero: ', num3, ', segundo: ', num2, ', tercero: ',num1)
    end
end.

(*
4. Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído).
Solución:   *)
program practica1ejercicio4;
var
  original, final : Real;
begin
  WriteLn('Escriba el número real que desee:  ');
  ReadLn(original);
  WriteLn('Introduzca otro número:  ');
  ReadLn(final);
  while (original <> final) do
    begin
      WriteLn('Introduzca un número diferente:  ');
      ReadLn(final);
    end;
  WriteLn('Programa finalizado.', original:1:2, ' = ', final:1:2);
end.

(*
5. Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”.
Solución:   *)
program practica1ejercicio5;
var
  original, final, doble, i : Real;
begin
  i := 0;
  WriteLn('Escriba el número real que desee:  ');
  ReadLn(original);
  doble := original * 2;
  WriteLn('Introduzca otro número:  ');
  ReadLn(final);
  while (doble <> final) and (i < 9) do
    begin
      WriteLn('Introduzca un número diferente:  ');
      ReadLn(final);
      i := i+1;
    end;
  if (i = 10) then
    ReadLn(final);
    if (doble <> final) then
      WriteLn('No se ha ingresado el doble de X');
  if (doble = final) then
    WriteLn('Programa finalizado.', original:1:2, ' = ', final:1:2);
end.

(*
6. Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse. Por ejemplo, se lee la siguiente secuencia:
33423
8.40
19003
6.43
-1
En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo 19003, cuyo promedio fue 6.43, y finalmente el legajo -1 (para el cual no es necesario leer un promedio).
Al finalizar la lectura, informar:
a. La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2)
b. La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar 1)
c. El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean menor al valor 2500 (en el ejemplo anterior se debería informar 0%).

*)
program practica1ejercicio6;
var
  promedio, porcentaje : Real;
  legajo, cantAlumnos, promedioMayor, alumnosDestacados : Integer;
begin
  cantAlumnos := 0;
  promedioMayor := 0;
  alumnosDestacados := 0;
  WriteLn('Escribir el número de legajo:  ');
  ReadLn(legajo);
  while (legajo <> -1) do
    begin
      WriteLn('Escribir el promedio del alumno:  ');
      ReadLn(promedio);
      if (promedio > 6.5) then    // B.
        promedioMayor := promedioMayor+1;
      if (promedio > 8.5) and (legajo < 2500) then    // C.
        alumnosDestacados := alumnosDestacados+1;
      cantAlumnos := cantAlumnos+1;     // A.
      WriteLn('Escribir el número de legajo:  ');
      ReadLn(legajo);
    end;
  porcentaje := alumnosDestacados / cantAlumnos * 100;
  WriteLn('a. Se leyeron ', cantAlumnos, ' alumnos.');
  writeln('b. Hay ', promedioMayor,' alumnos con mejor promedio a 6.5');
  writeln('c. El ', porcentaje:1:1, '% son alumnos destacados');

end.

(* 
7. Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un almacén. La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse.
Para cada producto leído, el programa deberá indicar si el nuevo precio del producto supera en un
10% al precio anterior. Por ejemplo:
○ Si se ingresa el código 10382, con precio actual 40, y nuevo precio 44, deberá imprimir: “el
aumento de precio del producto 10382 no supera el 10%”
○ Si se ingresa el código 32767, con precio actual 30 y nuevo precio 33,01, deberá imprimir: “el
aumento de precio del producto 32767 es superior al 10%”
*)
program practica1ejercicio7;
var
	codigo : Longint;
	precioNew, precioOld, porcentaje : Real;
begin
	WriteLn('------------------------------------------------------------------------------------------');
	WriteLn('Escriba el código del producto:  ');
	readln(codigo);
	while (codigo <> 32767) do
	begin
		writeln('Precio actual:  ');
		readln(precioOld);
		writeln('Precio nuevo:  ');
		readln(precioNew);
		porcentaje := (precioNew / precioOld) - 1;
		if (porcentaje > 0.1) then
			Writeln('El aumento de precio del producto ', codigo, ' es superior al 10%')
		else
			writeln('El aumento de precio del producto ', codigo, ' no supera el 10%');
		WriteLn('Escriba el código del producto:  ');
		readln(codigo);
	end;
	if (codigo = 32767) then
	begin
		writeln('Precio actual:  ');
		readln(precioOld);
		writeln('Precio nuevo:  ');
		readln(precioNew);
		porcentaje := (precioNew / precioOld) - 1;
		if (porcentaje > 0.1) then
			Writeln('El aumento de precio del producto ', codigo, ' es superior al 10%')
		else
			writeln('El aumento de precio del producto ', codigo, ' no supera el 10%');
	end;
end.


(*8. Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos
uno de ellos no lo era. Por ejemplo, si se leen los caracteres “a e o” deberá informar “Los tres son
vocales”, y si se leen los caracteres “z a g” deberá informar “al menos un carácter no era vocal”.
*)
program practica1ejercicio8;
var
	caract1, caract2, caract3 : char;
begin
	writeln('Escribir el primer caracter');
	readln(caract1);
	writeln('Escribir el segundo caracter');
	readln(caract2);
	writeln('Escribir el tercer caracter');
	readln(caract3);
	if (caract1 = 'a') or (caract1 = 'e') or (caract1 = 'i') or (caract1 = 'o') or (caract1 = 'u') then
	begin
		if (caract2 = 'a') or (caract2 = 'e') or (caract2 = 'i') or (caract2 = 'o') or (caract2 = 'u') then
		begin
			if (caract3 = 'a') or (caract3 = 'e') or (caract3 = 'i') or (caract3 = 'o') or (caract3 = 'u') then
				writeln('Los tres son vocales')
			else
				writeln('Los primeros dos son vocales, excepto el tercero')
		end
		else
			writeln('El primero es vocal, el segundo ya no')
	end
	else
		writeln('El primero ni siquiera es vocal')
end.


(*9. Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro carácter, debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse una secuencia de números enteros que finaliza con 0. El programa deberá aplicar la operación leída con la secuencia de números, e imprimir el resultado final.
Por ejemplo:
○ Si se lee el carácter “-” y la secuencia 4 3 5 -6 0 , deberá imprimir: 2 (4 – 3 – 5 - (-6) )
○ Si se lee el carácter “+” y la secuencia -10 5 6 -1 0, deberá imprimir 0 ( -10 + 5 + 6 + (-1) )
*)

program practica1ejercicio9;
var
	operacion : char;
	numero, resultado: integer;
begin
	writeln('Escriba la operación, (+) para sumar o (-) para restar:  ');
	readln(operacion);
	if (operacion <> '+') and (operacion <> '-') then
		begin
			writeln('Error. Saliendo del programa.');
			Exit;
		end;
	writeln('Escriba la secuencia de números enteros. Finaliza con 0');
	readln(numero);
	resultado := numero;
	while (numero <> 0) do
		begin
			readln(numero);
			if (operacion = '+') then
				resultado := resultado + numero
			else
				resultado := resultado - numero;
	end;
	writeln('El resultado es:', resultado);
end.
	
	
























































