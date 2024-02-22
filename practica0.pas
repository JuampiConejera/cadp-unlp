(*
1.  implemente un programa que lea por teclado dos números enteros e imprima en pantalla los valores leídos en orden inverso. Por ejemplo, si se ingresan los números 4 y 8, debe mostrar el mensaje: Se ingresaron los valores 8 y 4 *)
//Solución: 
program practica0ejercicio1;
var
    entero1, entero2: Integer;
begin
    writeln('Escribí el número 1 de 2:  ');
    ReadLn(entero1);
    writeln('Escribí el número 2 de 2:  ');
    ReadLn(entero2);
    writeln(entero2, ' ', entero1);
end.

(*
2.Modifique el programa anterior para que el mensaje de salida muestre la suma de ambos números:
a. Utilizando una variable adicional
b. Sin utilizar una variable adicional 
Solución a.:       *)

program practica0ejercicio2a;
var
    entero1, entero2, suma: Integer;
begin
    suma := 0;
    writeln('Escribí el número 1 de 2:  ');
    ReadLn(entero1);
    writeln('Escribí el número 2 de 2:  ');
    ReadLn(entero2);
    suma := entero1 + entero2;
    WriteLn(suma)
end.

//Solución b.:

program practica0ejercicio2b;
var
    entero1, entero2: Integer;
begin
    writeln('Escribí el número 1 de 2:  ');
    ReadLn(entero1);
    writeln('Escribí el número 2 de 2:  ');
    ReadLn(entero2);
    writeln(entero2 + entero1);
end.

(*
3.Implemente un programa que lea dos números reales e imprima el resultado de la división de los mismos con una precisión de dos decimales. Por ejemplo, si se ingresan los valores   4,5 y 7,2, debe imprimir: El resultado de dividir 4,5 por 7,2 es 0,62
Recuerde que para imprimir en pantalla números reales puede utilizar la notación: writeln(X:Y:Z) donde X es el número a imprimir, Y es el ancho (en cantidad de caracteres) que debe ocupar la impresión, y Z es la cantidad de decimales. Por ejemplo, sea el número pi=3.141592654 :
3.14 => writeln(pi,1,2);
3.14 => writeln(pi,8,2); (hay 4 espacios delante del 3, para completar 8 caracteres de ancho)
3,1415 => writeln(pi,1,4);

Solución:       *)

program practica0ejercicio3;
var
    dividendo, divisor, resultado: Real;
begin
    resultado := 0;
    WriteLn('Escribí el dividendo:  ');
    ReadLn(dividendo);
    WriteLn('Escribí el divisor:  ');
    ReadLn(divisor);
    resultado := dividendo / divisor;
    WriteLn('El resultado de dividir ', dividendo:1:2 , ' entre ', divisor:1:2 , ' es: ', resultado:1:2);
end.

(*
4. Implemente un programa que lea el diámetro D de un círculo e imprima:
a. El radio (R) del círculo (la mitad del diámetro).
b. El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula (PI * R^2)
c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la fórmula (D*PI) (o también PI*R*2).

Solución:        *)
program practica0ejercicio4;
var
    diametro, radio, area, perimetro: Real;
begin
  WriteLn('Escribí el diámetro del círculo:  ');
  ReadLn(diametro);
  radio := diametro/2;
  area := PI * (radio * radio);
  perimetro := PI*diametro;
  WriteLn('a.: ', radio:1:2);
  WriteLn('b.: ', area:1:2);
  WriteLn('c.: ', perimetro:1:2);


end.

(*
5. Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo cantidades iguales entre todos los clientes. Los que le sobren se los quedará para él.
a. Realice un programa que lea la cantidad de caramelos que posee el kiosquero (X), la cantidad de clientes (Y), e imprima en pantalla un mensaje informando la cantidad de caramelos que le corresponderá a cada cliente, y la cantidad de caramelos que se quedará para sí mismo.
b. Imprima en pantalla el dinero que deberá cobrar el kiosquero si cada caramelo tiene un
valor de $1.60.

Solución:       *)
program practica0ejercicio5;
var
    repartija, sobrante, cantCaramelos, cantClientes : Integer;
    costo, unidad : Real;
begin
  unidad := 1.60;
  WriteLn('Ingrese la cantidad de caramelos:  ');
  ReadLn(cantCaramelos);
  WriteLn('Ingrese la cantidad de clientes:  ');
  ReadLn(cantClientes);
  repartija := cantCaramelos div cantClientes;
  sobrante := cantCaramelos mod cantClientes;
  WriteLn('Le corresponde a cada cliente: ', repartija);
  WriteLn('El kiosquero se queda con: ', sobrante);
  costo := repartija * unidad;
  WriteLn('El kisoquero debe cobrar a cada cliente: $', costo:1:2);

end.

(*
6. Realice un programa que informe el valor total en pesos de una transacción en dólares. Para ello, el programa debe leer el monto total en dólares de la transacción, el valor del dólar al día de la fecha y el porcentaje (en pesos) de la comisión que cobra el banco por la transacción. Por ejemplo, si la transacción se realiza por 10 dólares, el dólar tiene un valor 189,32 pesos y el banco cobra un 4% de comisión, entonces el programa deberá informar: 
La transacción será de 1968,93 pesos argentinos (resultado de multiplicar 10*189,32 y adicionarle el 4%)

Solución:       *)
program practica0ejercicio6;
Var
    transaccion, cotizacion, resultado: real;
begin
  WriteLn('Escriba la cotización del dólar a día de hoy:  ');
  ReadLn(cotizacion);
  WriteLn('Escriba la cantidad de dólares que quiere transferir:  ');
  ReadLn(transaccion);
  resultado := (transaccion * cotizacion) * 1.04;
  WriteLn('La transacción será de $', resultado:1:2)
end.