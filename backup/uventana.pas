unit uventana;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
  ucadena;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button2: TButton;
    Button20: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    StringGrid1: TStringGrid;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
   cad:TCadena;
   procedure updateSG();
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button13Click(Sender: TObject);
begin
  cad.elimpal(Edit2.Text);
  updateSG();
  Edit2.Text:='';
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  cad.campal(Edit1.Text,Edit2.Text);
  updateSG();
  Edit1.Text:='';
  Edit2.Text:='';
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  cad.invertir();
  updateSG();
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  cad.rotarpal(StrToInt(Edit1.Text));
  updateSG();
  Edit1.Text:='';
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  cad.MAYUSCULAS();
  updateSG();
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  cad.minusculas();
  updateSG();
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  Edit1.Text:=IntToStr(cad.buspal(Edit2.Text));
  Edit2.Text:='';
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  cad.addpal(Edit2.Text);
  updateSG();
  Edit2.Text:='';
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  cad.inspal(StrToInt(Edit1.Text),Edit2.Text);
  updateSG();
  Edit1.Text:='';
  Edit2.Text:='';
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  cad:=TCadena.crear();
  updateSG();
  ShowMessage('cadena inicializada');
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  cad.titulo();
  updateSG();
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  cad.setdim(StrToInt(Edit1.Text));
  updateSG();
  Edit1.Text:='';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Edit1.Text:=IntToStr(cad.getdim());
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  cad.setchar(StrToInt(Edit1.Text),Edit2.Text[1]);
  updateSG();
  Edit1.Text:='';
  Edit2.Text:='';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Edit2.Text:=cad.getchat(StrToInt(Edit1.Text));
  Edit1.Text:='';
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  cad.addchar(Edit2.Text[1]);
  updateSG();
  Edit2.Text:='';
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
    cad.inschar(StrToInt(Edit1.Text),Edit2.Text[1]);
    updateSG();
    Edit1.Text:='';
    Edit2.Text:='';
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  cad.elichar(StrToInt(Edit1.Text));
  updateSG();
  Edit2.Text:='';
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  Edit1.Text:=IntToStr(cad.contpal());
end;

procedure TForm1.updateSG();
var
  des:integer;
begin
  StringGrid1.ColCount:=cad.getdim();
  for des:=1 to cad.getdim()do
   StringGrid1.Cells[des-1,0]:=cad.getchat(des);

end;

end.

