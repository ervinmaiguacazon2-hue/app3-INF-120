unit uconjunto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
const
  MAX=256;
  type

    { Tconjunto }

    Tconjunto=class
      private
        elem:array[1..MAX]of char;
        dim:integer;
      public
        constructor crear();
        procedure setelem(pos:integer;ele:char);
        function getelem(pos:integer):char;
        procedure setedim(dime:integer);
        function getedim():integer;
        function pertenece(ele:char):boolean;
        procedure agregar(ele:char);
        procedure remover(ele:char);
        procedure mostrar();

    end;

implementation

{ Tconjunto }

constructor Tconjunto.crear();
var
  i:integer;
begin
 dim:=0;
 for i:=1 to MAX do
  elem[i]:=char(0);
end;

procedure Tconjunto.setelem(pos: integer; ele: char);
begin
  if(pos>=1)and(pos<=dim)then
   elem[pos]:=ele
  else
    WriteLn('posicion furera de rango');
end;

function Tconjunto.getelem(pos:integer): char;
begin
  if(pos>=1)and(pos<=dim)then
   Result:=elem[pos]
  else
   Result:=char(0);
end;

procedure Tconjunto.setedim(dime: integer);
begin
 if(dime>=0)and(dime<=MAX)then
   dim:=dime
  else
   WriteLn('dimencion furera de rango');
end;

function Tconjunto.getedim(): integer;
begin
  Result:=dim;
end;

function Tconjunto.pertenece(ele: char): boolean;
var
  i:integer;
  b:boolean;
begin
 b:=False;
 i:=1;
 while (i<=dim)and(not b) do
 begin
   If(elem[i]=ele)Then
     b:=True
   else
    inc(i);
 end;
 Result:=b;
end;

procedure Tconjunto.agregar(ele: char);
begin
 If(dim<=MAX) Then
   begin
     if(not pertenece(ele))then
      begin
        inc(dim);
        elem[dim]:=ele;
      end;
   end;
end;

procedure Tconjunto.remover(ele: char);
var
  p,d:integer;
  b:boolean;
begin
 If(pertenece(ele))then
  begin
    b:=False;
    p:=1;
    while (p<=dim)and(not b)do
     begin
       if(elem[p]=ele)then
        b:=true
       else
        inc(p);
     end;
    for d:=p to dim-1 do
     elem[d]:=elem[d+1];
     dim:=dim-1;
  end;


end;

procedure Tconjunto.mostrar();
var
  p:integer;
begin
 write('{');
 for p:=1 to dim do
  write(elem[p],',');
 writeln('}');

end;

end.

