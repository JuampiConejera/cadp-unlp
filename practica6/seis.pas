program seis;
const
  corte = 'GAIA';
type
  categoria = 1..7;
  sonda = record
    nombre : string;
    duracionMision : integer;
    costoConstruccion : real;
    costoMantenimiento : real;
    rangoEspectro : categoria;
  end;
  lista = ^nodo;
  nodo = record
    dato : sonda;
    sig : lista;
  end;
procedure leerSonda(var s : sonda);
begin
  with s do begin
    Write('Nombre:  ');ReadLn(nombre);
      Write('Duracion de la mision(meses):  ');ReadLn(duracionMision);
      Write('Costo de la construccion:  ');ReadLn(costoConstruccion);
      Write('Duracion del mantenimiento mensual:  ');ReadLn(costoMantenimiento);
      Write('Rango del espectro electromagnetico (1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta):  ');ReadLn(rangoEspectro);
  end;
end;
procedure agregarAdelante(var l : lista;s : sonda);
var
  aux : lista;
begin
  new(aux);
  aux^.dato := s;
  aux^.sig := l;
  l := aux;
end;
procedure cargarLista(var l : lista);
var
  s : sonda;
begin
  repeat
    leerSonda(s);
    agregarAdelante(l,s);
  until (s.nombre = corte);
end;

//punto a.
function CostoTotal(s : sonda) : Real;
begin
  CostoTotal := (s.duracionMision * s.costoMantenimiento) + s.costoConstruccion;
end;
procedure sondaCara(l : lista;var SMC : real; var NSMC : string);
begin
  if(CostoTotal(l^.dato) >= SMC) then begin
    SMC := CostoTotal(l^.dato);
    NSMC := L^.dato.nombre;
  end;
end;


//punto b.

var
  l : lista;
  SondaMasCara : real;
  nombreSondaMasCara : string;
begin
  SondaMasCara := 0;
  l := Nil;
  cargarLista(l);
  while(l <> NIl) do begin
    sondaCara(l,SondaMasCara,nombreSondaMasCara);
    
    l := l^.sig;
  end;  
end.
{La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales
lanzadas al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la
misión (cantidad de meses que permanecerá activa), el costo de construcción, el costo de
mantenimiento mensual y rango del espectro electromagnético sobre el que realizará estudios. Dicho
rango se divide en 7 categorías: 1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta;
6. rayos X; 7. rayos gamma.
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura
finaliza al ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las
sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible
}
procedure imprimirLista(l : lista);
begin
  while(l <> Nil) do begin
    WriteLn(l^.dato.nombre,'  ',l^.dato.duracionMision,'  ',l^.dato.costoConstruccion:0:2,'  ',l^.dato.costoMantenimiento:0:2,' ',l^.dato.rangoEspectro);
    l := l^.sig;
  end;
end;