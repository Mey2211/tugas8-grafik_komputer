unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonGaris: TButton;
    ButtonTampil: TButton;
    EditSudut: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure ButtonGarisClick(Sender: TObject);
    procedure ButtonTampilClick(Sender: TObject);

  private
    procedure DrawLine;

  public
    x1, y1, x2, y2: Integer;
    xint1, yint1, xint2, yint2: Integer;
    sudut, dx, dy, x11, y11, x22, y22: Double;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.DrawLine;
begin
  Canvas.MoveTo(xint1, yint1);
  Canvas.LineTo(xint2, yint2);
end;

procedure TForm1.ButtonGarisClick(Sender: TObject);
begin
  x1 := 100; y1 := 100;
  x2 := 200; y2 := 100;
  Canvas.Pen.Color := clRed;
  xint1 := x1;
  yint1 := y1;
  xint2 := x2;
  yint2 := y2;
  DrawLine;
end;

procedure TForm1.ButtonTampilClick(Sender: TObject);
begin
  // Konversi sudut dari derajat ke radian
  sudut := (StrToFloat(EditSudut.Text) / 180) * Pi;

  // Hitung koordinat baru setelah rotasi
  x11 := x1 * cos(sudut) - y1 * sin(sudut);
  y11 := x1 * sin(sudut) + y1 * cos(sudut);
  x22 := x2 * cos(sudut) - y2 * sin(sudut);
  y22 := x2 * sin(sudut) + y2 * cos(sudut);

  // Hitung perpindahan
  dx := x2 - x22;
  dy := y2 - y22;

  x11 := x11 + dx;
  y11 := y11 + dy;
  x22 := x22 + dx;
  y22 := y22 + dy;

  // Set nilai integer untuk koordinat canvas
  xint1 := Round(x11);
  yint1 := Round(y11);
  xint2 := Round(x22);
  yint2 := Round(y22);

  Canvas.Pen.Color := clBlue;
  DrawLine;
end;


end.

