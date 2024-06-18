program trece;
const
    totalUsuarios = 3600;
type
    roles = 1..4;
    usuario = record
        nombreUsuario : string[15];
        email : string [30];
        rol : roles;
        revista : string[10];
        ultimoAcceso : integer;
    end;
    lista = ^nodo;
    nodo = record
        dato : usuario;
        sig : lista;
    end;
    vector = array[1..totalUsuarios] of usuario;
    vectorRol = array[1..4] of integer;
//procedure cargarVector(var v:vector);
procedure insertarOrdenado(var l : lista;  v : usuario);
var
    actual, anterior, nuevo : lista;
begin
    new(nuevo);
    nuevo^.dato := v[i];
    nuevo^.sig := Nil;
    if(l = Nil) then 
        l := nuevo
    else begin
        actual := l;
        anterior := l;
        while(actual <> Nil) and (actual^.dato.ultimoAcceso < nuevo^.dato.ultimoAcceso) do begin
            anterior := actual;
            actual := actual^.sig;
        end;
    end;
    if(actual = l) then begin
        nuevo^.sig := l;
        l := nuevo;
    end
    else begin
        anterior^.sig := nuevo;
        nuevo^.sig := actual;
    end;
end;
procedure imprimirLista(l : lista);
begin
    while(l <> Nil) do begin
        WriteLn('el ultimo acceso del usuario: ',l^.dato.nombreUsuario, ' fue hace ', l^.dato.ultimoAcceso, ' días.');
        l := l^.sig;
    end;
end;
procedure inicializarVector(var v: vectorRol);
var
    i : integer;
begin
    for i := 1 to 4 do
        v[i] := 0;
end;
procedure procesarVector(var l : lista; v : vector);
var
    i, j, maxUno, maxDos : integer;
    emailUno, emailDos : string;
    vr : vectorRol;
begin
    emailUno := '';
    emailDos := '';
    maxUno := -1;
    maxDos := -1;
    inicializarVector(vr);
    for i := 1 to totalUsuarios do begin
        if(v[i].revista = 'economica') then begin
            insertarOrdenado(l,v[i]);
        end;
        vr[v[i].rol] := vr[v[i].rol] + 1;
        if(v[i].ultimoAcceso > maxUno) then begin
            maxDos := maxUno;
            emailDos := emailUno;
            maxUno := v[i].ultimoAcceso;
            emailUno := v[i].email;
        end
        else if(v[i].ultimoAcceso > maxDos) then begin
            maxDos := v[i].ultimoAcceso;
            emailDos := v[i].email;
        end;
    end;
    for j := 1 to 4 do //punto B.
        WriteLn('hay ',vr[j],' usuarios del rol: ', j);
    writeln('El email ', emailUno, ' hace ', maxUno, ' dias que no se conecta.'); //C
    writeln('El email ', emailDos, ' hace ', maxDos, ' dias que no se conecta.'); //C
end;
var
    l : lista;
    v : vector;
begin
    l := nil;
    //cargarVector(v);
    procesarVector(l,v);
    imprimirLista(l); //punto A.
end.
{13. El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte
de los usuarios. Para ello, se dispone de información sobre los 3600 usuarios que utilizan el portal. De
cada usuario se conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que
participa y cantidad de días desde el último acceso.
a. Imprimir el nombre de usuario y la cantidad de días desde el último acceso de todos los usuarios
de la revista Económica. El listado debe ordenarse a partir de la cantidad de días desde el último
acceso (orden ascendente).
b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal.
}