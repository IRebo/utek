unit bitmap_control;

{$mode objfpc}{$H+}

interface

{uses
  Classes, SysUtils, Controls, Graphics, LCLType, DateUtils, assethelper;

type

  { TLazClockControl }

  TBitmapControl = class(tcustomcontrol)
  public
    BackgroundImage: TBitmap;
    constructor Create(AOwner: TComponent); override;
    destructor destroy;override;
    procedure EraseBackground(DC: HDC); override;
    procedure Paint; override;
    procedure MouseDown(Button: TMouseButton; Shift:TShiftState; X,Y:Integer); override;
    procedure MouseMove(Shift: TShiftState; X,Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift:TShiftState; X,Y:Integer); override;
    procedure AdjustSize; override;
  end;
 }
implementation

uses utekmain;
  {
procedure TBitmapControl.AdjustSize;
begin
   BackgroundImage.Width:=Width;
      BackgroundImage.Height:=Height;
end;

procedure TBitmapControl.MouseDown(Button: TMouseButton; Shift:TShiftState; X,Y:Integer);
begin
  mainform.mousedown(button,shift, x,y);
  inherited mousedown(button,shift,x,y);
end;

procedure TBitmapControl.MouseMove(Shift: TShiftState; X,Y: Integer);
begin
  mainform.MouseMove(shift, x,y);
    inherited MouseMove(shift,x,y);
end;

procedure TBitmapControl.MouseUp(Button: TMouseButton; Shift:TShiftState; X,Y:Integer);
begin
  mainform.MouseUp(button,shift, x,y);
  inherited MouseUp(button,shift,x,y);
end;

constructor TBitmapControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  BackgroundImage := tbitmap.Create;
  BackgroundImage.width:=320;
  BackgroundImage.Height:=200;
end;

destructor TBitmapControl.destroy;
begin
  BackgroundImage.free;
  Inherited destroy;
end;

procedure TBitmapControl.EraseBackground(DC: HDC);
begin
  // Uncomment this to enable default background erasing
  //inherited EraseBackground(DC);
end;

procedure TBitmapControl.Paint;
var   TimeStamp: tdatetime;
begin
        logw(pchar('width - '+inttostr(width)+' height - '+inttostr(height)));
        logw(pchar('width - '+inttostr(screen.width)+' height - '+inttostr(screen.height)));
        logw(pchar('width - '+inttostr(mainform.width)+' height - '+inttostr(mainform.height)));
        logw(pchar('width - '+inttostr(BackgroundImage.width)+' height - '+inttostr(BackgroundImage.height)));
    //    canvas.Line(0,0,Width,Height);
    timestamp:=now();
  Canvas.draw(0,0,BackgroundImage);
  logw(pchar('paint took - '+inttostr(DateTimeToTimeStamp (now()-timestamp).time)));

end;

    }
end.
