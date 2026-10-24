unit ucadena;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,uconjunto,Dialogs;
const
  MAX=5000;
  type

    { TCadena }

    TCadena=class
      private
        elem:array[1..MAX]of char;
        dim:integer;
        may,min,dig,sep:TConjunto;

      public
        constructor crear();
        procedure setdim(dime:integer);
        function getdim():integer;
        procedure setchar(pos:integer;ele:char);
        function getchat(pos:integer):char;
        procedure addchar(ele:char);
        procedure inschar(pos:integer;ele:char);
        procedure elichar(pos:integer);
        function contpal():integer;
        function buspal(palB:string):integer;
        procedure addpal(pal:string);
        procedure inspal(pos:integer;pal:string);
        procedure elimpal(pal:string);
        procedure campal(palA,palB:string);
        procedure leerpal(var pos:integer;var pal:String);
        procedure invertir();
        procedure rotarpal(n:integer);
        procedure MAYUSCULAS();
        procedure minusculas();
        procedure titulo();

        function contVocales(): integer;
        function palMasLarga(): string;
        function palMasCorta(): string;
        function frecuenciaPal(palB: string): integer;
        function esPalindromo(): boolean;
        procedure elimEspacios();
        procedure invertirCaracteres();
        procedure ordenarPalabras();
    end;

implementation

{ TCadena }

constructor TCadena.crear();
var
  pos:Integer;
begin
  dim:=0;
  for pos:=1 to MAX do
   elem[pos]:=char(0);
  may:=Tconjunto.crear();
  for pos:=0 to 25 do
   may.agregar(char(65+pos));
  min:=Tconjunto.crear();
  for pos:=0 to 25 do
   min.agregar(char(97+pos));
  dig:=Tconjunto.crear();
   for pos:=0 to 9 do
    dig.agregar(char(48+pos));
   sep:=Tconjunto.crear();
   sep.agregar('-');
   sep.agregar('_');
   sep.agregar(',');
   sep.agregar('.');
   sep.agregar(':');
   sep.agregar(';');
   sep.agregar('#');
   sep.agregar(' ');
end;

procedure TCadena.setdim(dime: integer);
begin
 if (dime>=0)and(dime<=MAX)then
  dim:=dime
 else
   ShowMessage('dimencion fuera de rango');

end;

function TCadena.getdim(): integer;
begin
 result:=dim
end;

procedure TCadena.setchar(pos: integer; ele: char);
begin
 if(pos>=1)and(pos<=dim)then
  elem[pos]:=ele
 else
  ShowMessage('posicion fuera de rango');
end;

function TCadena.getchat(pos: integer): char;
begin
 if(pos>=1)and(pos<=dim)then
   Result:=elem[pos]
  else
   Result:=char(0);
end;

procedure TCadena.addchar(ele: char);
begin
 if(dim<MAX)then
   dim:=dim+1;
 elem[dim]:=ele;
end;

procedure TCadena.inschar(pos: integer; ele: char);
var
  des:integer;
begin
 if(pos>=1)and(pos<=dim)then
 begin
    for des:=dim downto pos do
     elem[des+1]:=elem[des];
     elem[pos]:=ele;
     dim:=dim+1;
 end
 else
  ShowMessage('posicion fuera de rango');
end;

procedure TCadena.elichar(pos: integer);
var
  des:integer;
begin
 if(pos>=1)and(pos<=dim)then
 begin
    for des:=pos to dim-1 do
     elem[des]:=elem[des+1];
     dim:=dim-1;
 end
 else
  ShowMessage('posicion fuera de rango');
end;

function TCadena.contpal(): integer;
var
  cp,pos:integer;
  pal:string;
begin
 cp:=0;
 pos:=1;
 while(pos<=dim)do
  begin
   leerpal(pos,pal);
   if(pal<>'')then
    cp:=cp+1;
  end;
 Result:=cp;
end;

function TCadena.buspal(palB: string): integer;
var
  pos,posa:integer;
  b:boolean;
  pal:string;
begin
 b:=false;
 pos:=1;
 while(pos<=dim)and(not b)do
 begin
  posa:=pos;
  leerpal(pos,pal);
  if(pal=palB)then
   b:=true
 end;
 if(b)then
  Result:=posa
 else
  Result:=-1;
end;

procedure TCadena.addpal(pal: string);
var
  n,des:Integer;
begin
 n:=Length(pal);
  if(dim+n+1<MAX)then
  begin
     addchar(' ');
     for des:=1 to n do
      addchar(pal[des]);
  end
  else
  ShowMessage('almacenamiento lleno');
end;

procedure TCadena.inspal(pos: integer; pal: string);
var
  n,des:Integer;
begin
 n:=Length(pal);
  if(dim+n+2<MAX)then
  begin
     inschar(pos,' ');
     for des:=1 to n do
      begin
       inschar(pos+des,pal[des]);
      end;
     inschar(pos+n+1,' ');
  end
  else
  ShowMessage('almacenamiento lleno');
end;

procedure TCadena.elimpal(pal: string);
var
  pos,n,des:integer;
begin
 pos:=buspal(pal);
 if(pos<>-1)then
 begin
    n:=Length(pal);
    elichar(pos-1);
    for des:=1 to n do
     elichar(pos-1);
 end
 else
 ShowMessage('la palabra no existe');

end;

procedure TCadena.campal(palA, palB: string);
var
  pos:integer;
begin
 pos:=buspal(palA);
 if(pos<>-1)then
  begin
     elimpal(palA);
     inspal(pos-1,palB);
  end
 else
 ShowMessage('la palabra no existe');
end;

procedure TCadena.leerpal(var pos: integer; var pal: String);
begin
 pal:='';
 while(pos<=dim)and(not sep.pertenece(elem[pos]))do
  begin
   pal:=pal+elem[pos];
   pos:=pos+1;
  end;
 while(pos<=dim)and(sep.pertenece(elem[pos]))do
  pos:=pos+1;
end;

procedure TCadena.invertir();
var
  p,c,d,i:integer;
  pal:string;
  vec:array[1..MAX]of string;
begin
 c:=0;
 p:=1;
 while(p<=dim)do
  begin
   leerpal(p,pal);
   if(pal<>'')then
    begin
       inc(c);
       vec[c]:=pal;
    end;
  end;
  dim:=0;
  for d:=c downto 1 do
   begin
    if(dim>0)then
     addchar(' ');
    for i:=1 to Length(vec[d])do
     addchar(vec[d][i]);
   end;
end;

procedure TCadena.rotarpal(n: integer);
var
  p,d,c,i,t:integer;
  pal:string;
  vec:array[1..MAX]of string;
begin
 c:=0;
 p:=1;
 while(p<=dim)do
  begin
   leerpal(p,pal);
   if(pal<>'')then
    begin
       inc(c);
       vec[c]:=pal;
    end;
  end;
 if(c>1)then
  begin
     n:=n mod c;
     if(n<0)then
      n:=n+c;
     dim:=0;
     for d:=0 to c-1 do
      begin
       t:=((d+n)mod c)+1;
       if(dim>0)then
        addchar(' ');
       for i:=1 to Length(vec[t])do
        addchar(vec[t][i]);
      end;
  end;

end;

procedure TCadena.MAYUSCULAS();
var
  pos:integer;
begin
 for pos:=1 to dim do
  if(min.pertenece(elem[pos]))then
   elem[pos]:=char(ord(elem[pos])-32);

end;

procedure TCadena.minusculas();
var
  pos:integer;
begin
 for pos:=1 to dim do
  if(may.pertenece(elem[pos]))then
   elem[pos]:=char(ord(elem[pos])+32);
end;

procedure TCadena.titulo();
var
  pos:integer;
  ini:boolean;
begin
 ini:=True;
 for pos:=1 to dim do
  if(sep.pertenece(elem[pos]))then
   ini:=true
  else
   begin
      if(ini)then
       begin
          if(min.pertenece(elem[pos]))then
           elem[pos]:=char(ord(elem[pos])-32);
          ini:=false;
       end
      else
      if(may.pertenece(elem[pos]))then
       elem[pos]:=char(ord(elem[pos])+32);
   end;

end;
////////////////////////////////////////////
function TCadena.contVocales(): integer;
var
  pos,c:integer;
begin
 c:=0;
 for pos:=1 to dim do
  begin
   case elem[pos] of
   'A','E','I','O','U','a','e','i','o','u': inc(c);
   end;
   Result:=c;
  end;

end;

function TCadena.palMasLarga(): string;
var
  p:integer;
  pa,mayor:String;
begin
 mayor:='';
 p:=1;
 while p<=dim do
  begin
   leerpal(p,pa);
   if Length(pa)>Length(mayor)then
    mayor:=pa;
  end;
 Result:=mayor;

end;

function TCadena.palMasCorta(): string;
var
  p:integer;
  pal,menor:String;
begin
 menor:='';
 p:=1;
 while p<=dim do
  begin
   leerpal(p,pal);
   if pal<>'' then
    begin
     if(menor='')or(Length(pal)<Length(menor)) then
      menor:=pal;
    end;
  end;
  result:=menor;
end;

function TCadena.frecuenciaPal(palB: string): integer;
var
  p,c:integer;
  pal:String;
begin
 c:=0;
 p:=1;
 while p<=dim do
  begin
   leerpal(p,pal);
   if pal=palB then
    inc(c);
  end;
  Result:=c;
end;

function TCadena.esPalindromo(): boolean;
var
  i,j:integer;
  s:String;
begin
 s:='';
 for i:=1 to dim do
  begin
   if may.pertenece(elem[i])or min.pertenece(elem[i]) or dig.pertenece(elem[i]) then
    begin
     if may.pertenece(elem[i])then
      s:=s+char(ord(elem[i])+32)
     else
      s:=s+elem[i];
    end;
  end;
  i:=1;
  j:=Length(s);
  Result:=true;
  while i<j do
   begin
    if s[i]<>s[j] then
     begin
      Result:=False;
      Break;
     end;
    inc(i);
    dec(j)
   end;
end;

procedure TCadena.elimEspacios();
var
  i,ndim:integer;
begin
 ndim:=0;
 for i:=1 to dim do
  begin
   if not sep.pertenece(elem[i]) then
    begin
     inc(ndim);
     elem[ndim]:=elem[i];
    end;
  end;
  dim:=ndim;
end;

procedure TCadena.invertirCaracteres();
var
  i,j:integer;
  aux:char;
begin
 i:=1;
 j:=dim;
 while i<j do
  begin
   aux:=elem[i];
   elem[i]:=elem[j];
   elem[j]:=aux;
   inc(i);
   dec(j);
  end;
end;

procedure TCadena.ordenarPalabras();
var
  p,c,i,j:integer;
  pal,aux:string;
  vec:array[1..MAX]of string;
begin
 c:=0;
 p:=1;
 while p<=dim do
  begin
   leerpal(p,pal);
   if pal<>'' then
    begin
     inc(c);
     vec[c]:=pal;
    end;
  end;
 if c>1 then
  begin
   for i:=1 to c-1 do
    begin
     for j:=i+1 to c do
      begin
       if(vec[i]<>'')and(vec[j])and(ord(vec[i][1])>ord(vec[j][1]))then
        begin
         aux:=vec[i];
         vec[i]:=vec[j];
         vec[j]:=aux;
        end;
      end;
    end;
   dim:=0;
   for i:=1 to c do
    begin
     if dim>0 then
      addchar(' ');
      for j:=1 to Length(vec[i])do
       addchar(vec[i][j]);
    end;
  end;
end;

end.

