unit utekmain;

{$MODE Delphi}

interface

uses
    {$IFDEF android}
cthreads,
{$ENDIF}
       {$IFDEF android}
     androidassethelper,
     {$else}
     normalassethelper,
     {$endif}

       SysUtils, Classes,
     FakeDXDraw,math, CastleWindowTouch,CastleWindow,castlecontrols,CastleUIControls,CastleKeysMouse;

type
  TUtekThread = class(TThread)
  private
  protected
    procedure Execute; override;
  end;

  { TMainForm }

  TMainForm = class(TCastleWindowTouch)
    DXDraw : TFakeDXDraw;
//    Timer: TTimer;
destructor destroy;override;
    procedure maincreate;

    {procedure AdjustSize; override;
}    procedure MouseDown(Button: TMouseButton);
    procedure MouseUp(Button: TMouseButton);
    procedure MouseMove(X,
      Y: Integer);


    procedure MyOnClose(Sender: TUIContainer);
    procedure MyTimer(Sender: tuicontainer);

{    procedure FormHide(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure formshow(Sender: TObject);           }
    procedure KeyPress(key: Char);
  public
    procedure HandleMessageDialogFinished(Sender: TObject; AResult: Integer);
    procedure FadeIn(Time: Integer; Col: Integer);
    procedure FadeOut(Time: Integer; Col: Integer);
    procedure FadeInfont(Time: Integer; Col: Integer);
    procedure FadeOutfont(Time: Integer; Col: Integer);
    procedure FadeIncele(Time: Integer; Col: Integer);
    procedure FadeOutcele(Time: Integer; Col: Integer);
//    procedure Flash(Time: Integer; Col: Integer);
 public
     bitmapcontrol:TCastleImageControl;
     doendee,stop,soundis,goto400:boolean;
     endeetext:string;
     x,y:word;
     lave, stredne, prave:boolean;
     keymap:array of char;
 end;
    function readkey:char;
function keypressed:boolean;
function RGB(r,g,b : longint) : DWORD;

var
  MainForm: TMainForm;
   utekthr:TUtekThread;

implementation
uses   rutins,assethelper,bass,CastleVectors;
{$I UTEK.PAS}

{ was #define dname(params) def_expr }
{ argument types are unknown }
function GetBValue(rgb : longint) : BYTE;
  begin
     GetBValue:=BYTE(rgb shr 16);
  end;

{ was #define dname(params) def_expr }
{ argument types are unknown }
function GetGValue(rgb : longint) : BYTE;
  begin
     GetGValue:=BYTE((WORD(rgb)) shr 8);
  end;

{ was #define dname(params) def_expr }
{ argument types are unknown }
function GetRValue(rgb : longint) : BYTE;
  begin
     GetRValue:=BYTE(rgb);
  end;

{ was #define dname(params) def_expr }
{ argument types are unknown }
function RGB(r,g,b : longint) : DWORD;
  begin
     RGB:=DWORD(((DWORD(BYTE(r))) or ((DWORD(WORD(g))) shl 8)) or ((DWORD(BYTE(b))) shl 16));
  end;


{procedure tmainform.adjustsize;
begin

  {$ifdef android}
{ logw('adjust size');
 logw(pchar('width - '+inttostr(width)+' height - '+inttostr(height)));
 logw(pchar('width - '+inttostr(screen.width)+' height - '+inttostr(screen.height)));
// if (height<>screen.height) then  height:=screen.Height;
 //if (height<>screen.width) then  width:=screen.width;

 {$endif}
 {
 inherited AdjustSize;
end;}

function ComposeColor(Dest, Src: tvector3byte; Percent: Integer): tvector3byte;
begin
    Result[0] := Src[0]+((Dest[0]-Src[0])*Percent div 256);
    result[1] := Src[1]+((Dest[1]-Src[1])*Percent div 256);
    result[2] := Src[2]+((Dest[2]-Src[2])*Percent div 256);
end;

procedure tmainform.FadeOutcele(Time: Integer; Col: Integer);
var
  t,diff: qword;
  i, p, o: Integer;
  q: tvector3byte;
begin
//  if not DXDraw.CanDraw then Exit;
//  if not DXDraw.CanPaletteAnimation then Exit;
  q[2]:= getbvalue(col);
  q[1]:=getgvalue(col);
  q[0]:=getrvalue(col);

  t := GetTickCount64;
  o := 0;
  diff :=GetTickCount64-t;
  while Abs(integer(diff))<Time do
  begin
    p := Min(Max(Abs(integer(diff))*255 div Time, 0), 255);

    if p<>o then
    begin
      o := p;
      for i:=0 to 255 do
        DXDraw.ColorTable[i] := ComposeColor(q, DXDraw.DefColorTable[i], p);

      DXDraw.UpdatePalette;
    end;
    diff :=GetTickCount64-t;
  end;
end;

procedure Tmainform.FadeIncele(Time: Integer; Col: Integer);
var
  t, diff: qword;
  i, p, o: Integer;
  q: tvector3byte;
begin
//  if not DXDraw.CanDraw then Exit;
//  if not DXDraw.CanPaletteAnimation then Exit;
  q[0]:= getbvalue(col);
  q[1]:=getgvalue(col);
  q[2]:=getrvalue(col);
  logw('fadein');
  t := GetTickCount64;
  o := 0;
  diff :=GetTickCount64-t;
  logw('fadein2');
  while Abs(integer(diff))<Time do
  begin
    p := 255-Min(Max(Abs(integer(diff))*255 div Time, 0), 255);

    if p<>o then
    begin
      o := p;
      logw('fadein31');
      for i:=0 to 255 do
        DXDraw.ColorTable[i] := ComposeColor(q, DXDraw.DefColorTable[i], p);
                 logw('fadein32');
      DXDraw.UpdatePalette;
       logw('fadein3');
    end;
    diff :=GetTickCount64-t;
  end;
    logw('fadein4');
end;
procedure tmainform.FadeOut(Time: Integer; Col: Integer);
var
  t,diff: qword;
  i, p, o: Integer;
  q: TVector3Byte;
begin
//  if not DXDraw.CanDraw then Exit;
//  if not DXDraw.CanPaletteAnimation then Exit;
  q[2]:= getbvalue(col);
  q[1]:=getgvalue(col);
  q[0]:=getrvalue(col);

  t := GetTickCount64;
  o := 0;
  diff :=GetTickCount64-t;

  while Abs(integer(diff))<Time do
  begin
    p := Min(Max(Abs(integer(diff))*255 div Time, 0), 255);

    if p<>o then
    begin
      o := p;

      for i:=0 to 210 do
        DXDraw.ColorTable[i] := ComposeColor(q,
          DXDraw.DefColorTable[i], p);

      DXDraw.UpdatePalette;
    end;
     diff :=GetTickCount64-t;

  end;
end;

procedure Tmainform.FadeIn(Time: Integer; Col: Integer);
var
  t,diff: qword;
  i, p, o: Integer;
  q: tvector3byte;
begin
//  if not DXDraw.CanDraw then Exit;
 // if not DXDraw.CanPaletteAnimation then Exit;
  q[2]:= getbvalue(col);
  q[1]:=getgvalue(col);
  q[0]:=getrvalue(col);

  t := GetTickCount64;
  o := 0;
  diff :=GetTickCount64-t;
  while Abs(integer(diff))<Time do
  begin
    p := 255-Min(Max(Abs(integer(diff))*255 div Time, 0), 255);

    if p<>o then
    begin
      o := p;

      for i:=0 to 210 do
        DXDraw.ColorTable[i] := ComposeColor(q,
          DXDraw.DefColorTable[i], p);

      DXDraw.UpdatePalette;
    end;
      diff :=GetTickCount64-t;
  end;
end;

procedure tmainform.FadeOutfont(Time: Integer; Col: Integer);
var
  t,diff: qword;
  i, p, o: Integer;
  q: tvector3byte;
begin
//  if not DXDraw.CanDraw then Exit;
//  if not DXDraw.CanPaletteAnimation then Exit;
  q[2]:= getbvalue(col);
  q[1]:=getgvalue(col);
  q[0]:=getrvalue(col);

  t := GetTickCount64;
  o := 0;
  diff := GetTickCount64 -t;
  while Abs(integer(diff))<Time do
  begin
    p := Min(Max(Abs(integer(diff))*255 div Time, 0), 255);

    if p<>o then
    begin
      o := p;

      for i:=210 to 210+46-1 do
        DXDraw.ColorTable[i] := ComposeColor(q,
          DXDraw.DefColorTable[i], p);

      DXDraw.UpdatePalette;
    end;
    diff := GetTickCount64 -t;
  end;
end;

procedure Tmainform.FadeInfont(Time: Integer; Col: Integer);
var
  t,diff: qword;
  i, p, o: Integer;
  q: tvector3byte;
begin
//  if not DXDraw.CanDraw then Exit;
//  if not DXDraw.CanPaletteAnimation then Exit;
  q[2]:= getbvalue(col);
  q[1]:=getgvalue(col);
  q[0]:=getrvalue(col);

  t := GetTickCount64;
  o := 0;
  diff:=GetTickCount64 -t;
  while Abs(integer(diff))<Time do
  begin
    p := 255-Min(Max(Abs(integer(diff))*255 div Time, 0), 255);

    if p<>o then
    begin
      o := p;

      for i:=210 to 210+46-1 do
        DXDraw.ColorTable[i] := ComposeColor(q,
          DXDraw.DefColorTable[i], p);

      DXDraw.UpdatePalette;
    end;
    diff:=GetTickCount64 -t;
  end;
end;

{procedure TForm1.Flash(Time: Integer; Col: Integer);
begin
  FadeOut(Time div 2, Col);
  FadeIn(Time div 2, Col);
end;
 
procedure TForm1.Button1Click(Sender: TObject);
begin
  FadeOut(500, RGB(0, 0, 0));

  DXDraw1.ColorTable := DXDraw1.DefColorTable;
  DXDraw1.UpdatePalette;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FadeIn(500, RGB(0, 0, 0));
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  DXDraw1.Surface.fill(0);
  with DXDraw1.Surface.Canvas do
  begin
    Brush.Style := bsClear;
    Font.Color := clWhite;
    Font.Size := 30;
    Textout(30, 30, DateTimeToStr(Now));

    Release;
  end;

  dxdraw1.Flip;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Close;
end;
}


procedure TUtekThread.Execute;
begin
logw('execute');

  try
 domain;
  except
    on E : Exception do
    begin
        endee('execute exception - '+e.classname+' - '+e.message);
    end;
  end;
  logw('execute end');
  mainform.stop:=true;
end;


procedure MyPress(Sender: TUIContainer;const event:TInputPressRelease);
begin
if event.EventType= itkey then
begin
MainForm.KeyPress(event.KeyCharacter);
end;

if (event.EventType= itMouseButton) then
begin
MainForm.MouseMove(round(event.Position[0]),round(event.Position[1]));
MainForm.MouseDown(event.MouseButton);
end;

end;

procedure MyRelease(Sender: TUIContainer;const event:TInputPressRelease);
begin
 if (event.EventType= itMouseButton) then
 begin
 MainForm.MouseMove(round(event.Position[0]),round(event.Position[1]));
  MainForm.MouseUp(event.MouseButton);
 end;
end;

procedure MyMotion(Sender: TUIContainer;const event:TInputMotion);
begin
MainForm.MouseMove(round(event.Position[0]),round(event.Position[1]));
end;



procedure MyTimerOut(Sender: TUIContainer);
begin
 MainForm.MyTimer(sender);
end;

procedure MyOnCloseOut(Sender: TUIContainer);
begin
 MainForm.MyOnClose(sender);
end;

destructor TMainForm.destroy;
begin
destroyassets;
bass_free;
inherited destroy;
end;

procedure TMainForm.MyOnClose(Sender: TUIContainer);
begin
  {endee('end');}
end;

{procedure TMainForm.FormHide(Sender: TObject);
begin
  logw('form hide');
end;
}
{procedure TMainForm.FormResize(Sender: TObject);
begin
   {$ifdef android}
  { logw('form resize');
 logw(pchar('width - '+inttostr(width)+' height - '+inttostr(height)));
 logw(pchar('width - '+inttostr(screen.width)+' height - '+inttostr(screen.height)));
 if (height<>screen.height) then  height:=screen.Height;
 if (height<>screen.width) then  width:=screen.width;
   }
 {{$endif}


{end;}


procedure TMainForm.MouseDown(Button: TMouseButton);
begin
 if button = mbLeft then
 begin
  lave:=true;
 end;
 if button = mbRight then
 begin
  prave:=true;
 end;
  if button = mbMiddle then
 begin
  stredne:=true;
 end;
end;


procedure TMainForm.MouseUp(Button: TMouseButton);
begin
 if button = mbLeft then
 begin
  lave:=false;
 end;
 if button = mbRight then
 begin
  prave:=false;
 end;
  if button = mbMiddle then
 begin
  stredne:=false;
 end;

end;

{procedure TMainForm.formshow(Sender: TObject);
begin
  logw('formshow');
end;
 }

procedure TMainForm.HandleMessageDialogFinished(Sender: TObject; AResult: Integer);
begin
  logw('dialog finished so ending');
mainform.close;
end;


procedure TMainForm.MyTimer(Sender: TUIContainer);
begin
  //logw('timer');

  DXDraw.FlipReal;
 if doendee then begin
  logw('should endee');
  doendee:=false;
  endee_internal;
 end;
 if stop then begin
  logw('should close');
  close;
 end;
 if goto400 then
 begin
  goto400:=false;
  {mainform.DXDraw.Finalize;
  mainform.DXDraw.Display.Width := 640;
  mainform.DXDraw.Display.Height := 400;
  mainform.DXDraw.Display.BitCount := 8;
//  mainform.DXDraw.Options := mainform.DXDraw.Options + [doFullScreen];
  mainform.DXDraw.Initialize;}
 end;

end;

procedure TMainForm.MouseMove( X,  Y: Integer);
begin
if(x<0) then x:=0;
if(y<0) then y:=0;
if(x>self.Width-1) then x:=self.Width-1;
if(y>Self.Height-1) then y:=self.Height-1;

 self.x := trunc((x/self.Width)*320);
  self.y := 199-trunc((y/self.Height)*200);
end;


function readkey:char;
begin
 if not keypressed then begin
  result:='a';
  exit;
 end;
 result:=mainform.keymap[0];
 setlength(mainform.keymap,length(mainform.keymap)-1);
end;
function keypressed:boolean;
begin
 if length(mainform.keymap) >0 then result:=true else result:=false;
end;

procedure TMainForm.KeyPress(Key: Char);
begin
 setlength(keymap,length(keymap)+1);
 keymap[length(keymap)-1]:=key;
end;


procedure tmainform.MainCreate;
begin
 logw('MainCreate');
 initassets();

 {$ifdef android}
//  height:=screen.Height;
//  width:=Screen.Width;
//WindowState:=wsFullScreen;
//  logw(pchar('screen size - '+inttostr(screen.height)+'x'+inttostr(screen.Width)));
{$endif}

  soundis:=true;
  lave:=false;
  stredne:=false;
  prave:=false;
//  soundis:=false;
  utekthr:=nil;
  stop:=false;
  doendee:= false;

  FpsShowOnCaption:=true;
  AutoRedisplay:=false;
  RenderStyle:=rs2d;
  //BorderStyle:=bsnone;
  bitmapcontrol:=TCastleImageControl.Create(self);
  bitmapcontrol.Stretch:=true;
  bitmapcontrol.FullSize:=true;
{  bitmapcontrol.Bottom:=Height;
  bitmapcontrol.Left:=0;
  bitmapcontrol.Width:=Width;
  bitmapcontrol.Height:=Height;}
  controls.Clear;
  Controls.InsertFront(bitmapcontrol);
  {bitmapcontrol.Cursor:=crnone;
  bitmapcontrol.Align:=alClient;
  bitmapcontrol.DoubleBuffered:=false;
   }
  logw(pchar('width - '+inttostr(width)+' height - '+inttostr(height)));

  dxdraw := TFakeDXDraw.Create(self, bitmapcontrol);
//  Cursor:=crnone;
  logw('before timer');

  //timer.Interval:=1;
//  timer.Enabled:=true;
//Application.TimerMilisec:=10;
onupdate:=@MyTimerOut;
// OnTimer := @MyTimerOut;
  OnClose := @MyOnCloseOut;
  OnPress:=@MyPress;
  OnRelease:=@MyRelease;
  OnMotion:=@MyMotion;
    logw('after timer');
    goto400:=false;
  x:=0;y:=0;
  setlength(keymap,0);

  {$IFDEF MSWINDOWS}
  if not BASS_Init(-1, 44100, 0, 0, nil) then
    endee('failed to init bass');
{$ELSE}
 if not BASS_Init(-1, 44100, 0, nil, nil) then
   endee('failed to init bass');
{$ENDIF}


 if (utekthr=nil) then begin
   logw('creating main thread');
  utekthr:=TUtekThread.Create(false);
  logw('started thread');
 end;

  //  domain;
// utekthr:=TUtekThread.Create(true);
end;
function MyGetApplicationName: string;
begin
  Result := 'Utek';
end;

procedure ApplicationInitialize;
begin
logw('init3');
//  InitializeLog('1.0.0');
  mainform.MainCreate();
  logw('init4');
  end;

initialization
  { This should be done as early as possible to mark our log lines correctly. }
  logw('init');
  OnGetApplicationName := @MyGetApplicationName;

  { initialize Application callbacks }
  Application.OnInitialize := @ApplicationInitialize;

  { create Window and initialize Window callbacks }
  mainform := tmainform.Create(Application);
  Application.MainWindow := mainform;
  logw('init2');

//  Window.OnRender := @WindowRender;
  //Window.OnResize := @WindowResize;
end.

