program uno;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;
procedure armarNodo(var L: lista; v: integer);
var
    aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
end;
procedure aumentarLista(l: lista);
var
    aux : lista;
    n : integer;
begin
    aux := l;
    Write('ingresar valor a aumentar:   '); ReadLn(n);
    while(aux <> Nil) do begin
        aux^.num := aux^.num + n;
        aux := aux^.sig
    end;
end;
procedure imprimirLista(l : lista);
begin
  while(l <> Nil) do begin
    Write(l^.num,'  ');
  l := l^.sig;
  end;
end;
//Punto A.
function EstaOrdenada(l : lista) : boolean;
var
    aux : lista;
begin
    EstaOrdenada := true;
    aux := l^.sig;
    while(aux <> Nil)  do begin
        if(l^.num > aux^.num) then
            EstaOrdenada := false;
        l := l^.sig;
        aux := aux^.sig;
    end;
end;
var
    pri : lista;
    valor : integer;
begin
    pri := nil;
    writeln('‘Ingrese un numero’');
    readln(valor);
while (valor <> 0) do begin
    armarNodo(pri, valor);
    writeln('‘Ingrese un numero’');
    readln(valor);
end;
    //imprimirLista(pri);
    //aumentarLista(pri);
    imprimirLista(pri);
    WriteLn(EstaOrdenada(pri));
end.

{9. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o
false en caso contrario.
b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si
existe). Nota: la lista podría no estar ordenada.
c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista
con todos los elementos de la lista L mayores que A y menores que B.
d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada
de manera ascendente.
e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada
de manera descendente.}