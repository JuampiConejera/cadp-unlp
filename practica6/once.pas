program once;
type
    alumno = record
        legajo : integer;
        apellido : string[15];
        promedio : real;
    end;
    listaAlumnos = ^nodoAlumnos;
    nodoAlumnos = record
        dato : alumno;
        sig : listaAlumnos;
    end;
    mejoresEgresados = array[1..10] of alumno;
procedure leerAlumno(var a : alumno);
begin
    write('Numero de Legajo: ');readln(a.legajo);
    if(a.legajo <> 0) then begin
        write('Apellido: ');readln(a.apellido);
        write('Promedio: ');readln(a.promedio);
    end;
end;
procedure agregarAdelante(var l : listaAlumnos;a : alumno);
var
    aux : listaAlumnos;
begin
    new(aux);
    aux^.dato := a;
    aux^.sig := l;
    l := aux;
end;
procedure cargarAlumnos(var l : listaAlumnos);
var
    a : alumno;
begin
    leerAlumno(a);
    while(a.legajo <> 0) do begin
        agregarAdelante(l,a);
        leerAlumno(a);
    end;
end;
var
    a : alumno;
    l : listaAlumnos;
begin
    l := nil;
    cargarAlumnos(l);
end.
{11. La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les
entregará el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y
el promedio obtenido durante toda su carrera.
Implementar un programa que:
a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse.
b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los
egresados que recibirán el premio. La información debe imprimirse ordenada según el promedio
del egresado (de mayor a menor).}
