unit RUTINS;

{$MODE Delphi}

INTERFACE
uses
     {$IFDEF android}
     androidassethelper,
     {$else}
     normalassethelper,
     {$endif}
  assethelper,sysutils,utekmain;
type typ1poi=array [1..64000] of byte;
     typ1=^typ1poi;
     fonttyppo=array [1..10000] of byte;
     fonttyp=^fonttyppo;
     typstrpo=array [0..255] of string[20];
     typstr=^typstrpo;
     typ2po=array [1..64786] of byte;
     typ2=^typ2po;
     palettpo=array [1..768] of byte;
     palett=^palettpo;
const pau=300;
//globalne premenne fuj
var font:fonttyp;
    predstr:array [0..40] of string;
    predm:array [1..40] of boolean;
    hlava:array[30..81] of byte;
    tmp:typ2;
    myska:array[1..400] of byte;
    sprites:typ1;
    predmal:array [1..40] of boolean;
    t:tfaketextfile;
    predreal:array [1..40] of byte;
    f:tfakefile;
    obrazok:typ1;
    fontpoi,tmppoi,strpoi,obrpoi,pallpoi,spritpoi,mappoi:pointer;
    paletta:palett;
    playing,soundis,win,pisat:boolean;
    strings:typstr;
    oldkurz,xpov,ypov:word;
    meno,temp,prikaz,predmet,sprloaded:string[20];
    key,k,xr,yr,har,izba,kl,cast,riad:byte;
    mapa:typ1;
    speed,cfg,a,b,c,d,e,m,o,s,predme,xsiz,ysiz,x2,y2:word;
    palletspri:array [1..138] of byte;
    x,y:word;
    Lave,Stredne,Prave:boolean;

procedure endee2;
procedure ende;
procedure thend;
procedure loadspr(meno:string);
procedure newspr(meno:string);
procedure kurzor(kurz:byte);
procedure nuluj;
procedure paleta;
procedure pis(xx,yy:word;a:string);
procedure setsound;
procedure mapaspod;
procedure zobrazpred;
procedure loadobrcele(nam:string);
procedure loadroom(meno:string);
procedure endee(message:string);
procedure endee_internal;
procedure zobraz;
procedure closewin;
procedure loadobr(nam:string);
procedure say(cis,cis2:word;sss:string);
procedure zobrazcele;
procedure tl(ku:byte);
procedure endeee;
procedure depack(siz:word;var pop:pointer);
procedure tloff;
procedure testinit;
procedure zmaz;
procedure pauza(del:word);
procedure menusvetlo;
procedure zmazcele;
procedure zmazcelemapa(var bu:array of byte);
procedure ob(poce:byte);
procedure zm(poce:byte);
procedure obcele(poce:byte);
procedure zmcele(poce:byte);
procedure obfont(poce:byte);
procedure zmfont(poce:byte);
procedure tmav;
procedure tmavcele;
procedure kabsvetlo;
procedure movepal(pal:array of byte);
//function memo:longint;
procedure Stav;
procedure Umiestni(x,y:word);
//function keypressed:boolean;
//function readkey:char;
PROCEDURE INITSOUND(DEV,sp:integer; MODUL:STRING);
PROCEDURE STOPSOUND;
implementation
uses fakedxdraw,Bass, mouse, castlemessages;
var keys:integer;

{function keypressed:boolean;
var i:byte;
begin
 mainform.DXInput.Keyboard.Update;
 for i:=0 to 255 do begin
  if  mainform.DXInput.Keyboard.keys[i] then
  begin
   result:=true;
   exit;
  end;
 end;
 result:=false;
end;

function readkey:char;
var i:byte;
begin
 if mainform.DXInput.Keyboard.Keys[1] then begin
  result:=chr(27);
  mainform.DXInput.Keyboard.Update;
  exit;
 end;
 if mainform.DXInput.Keyboard.Keys[$1c] then begin
  result:=chr(27);
  mainform.DXInput.Keyboard.Update;
  exit;
 end;
 for i:=0 to 255 do begin
  if  mainform.DXInput.Keyboard.keys[i] then
  begin
   result:=chr(i);
   exit;
  end;
 end;
 result:=chr(27);
 mainform.DXInput.Keyboard.Update;
end;
}


procedure endee_internal;
begin
  logw('endee_internal');
    //Application.OnMessageDialogFinished := TmainForm.HandleMessageDialogFinished;

     logw(pchar('endee_internal1 - '+mainform.endeetext));
     messageok(mainform,'crash ! - '+mainform.endeetext);
 //showmessage('crash ! - '+mainform.endeetext);
 logw('endee_internal2');
end;

procedure endee(message:string);
begin
 logw('in endee');
 if soundis then begin if playing then stopsound;end;
 logw(pchar('doing endee - '+message));
 mainform.endeetext:=message;
 mainform.doendee:=true;
  logw('going to wait now');
  while true do sleep(1000);
  logw('huh');

end;

var  song:hmusic;

PROCEDURE INITSOUND(DEV,sp:integer; MODUL:STRING);
var
a:byte;
     q:single;
     f:tfakefile;
     length:int64;
     buf:array of byte;
BEGIN
 logw(pchar('initsound - '+modul));
 assign(f,'music\'+modul);
 reset(f,1);
 length:=filesize(f);
 setlength(buf,length);
 blockread(f, buf[0], length);
 close(f);
 logw(pchar('initsound - loaded'));
 song:=bass_musicload(true,buf,0,length,BASS_MUSIC_MONO or BASS_MUSIC_LOOP,0);
 if song=0 then endee('failed to play song');
 logw(pchar('initsound - starting'));
 bass_start;

{  q:=BASS_GetVolume;
  for a := 0 to trunc(q) do
  begin
    BASS_SetVolume(a);
    Sleep(3);
  end;
 }
 bass_channelplay(song,true);
 logw(pchar('initsound - playing'));

 playing:=true;
END;

PROCEDURE STOPSOUND;
var a:byte;
     q:single;
BEGIN
 {q:=BASS_GetVolume;
 for a := trunc(q) downto 0 do
 begin
  BASS_SetVolume(a);
  Sleep(3);
 end;}
 bass_stop;
// BASS_SetVolume(q);
 bass_musicfree(song);
 playing:=false;
END;

var bufpal:array[0..767] of byte;
    zalpal:array[0..767] of byte;
    o2,s2,poc:word;


procedure mapaspod;
begin
 move(sprites^[35200],mapa^[49600],14400);
end;

{function memo:longint;
var ivo:word;
    ii:longint;
begin
 asm
  mov ah,48h
  mov bx,$ffff
  int 21h
  mov ivo,bx
 end;
 ii:=ivo;
 memo:=ii*16;
end;
 }
{procedure paleta1;assembler;
label loop1;
asm
 mov cx,210
 mov dx,$3C8
 mov ax,s
 mov es,ax
 mov di,o
 xor bl,bl
loop1:
 mov al,bl
 out dx,al
 inc bl
 inc dx
 mov al,[es:di]
 out dx,al
 inc di
 mov al,[es:di]
 out dx,al
 inc di
 mov al,[es:di]
 out dx,al
 inc di
 dec dx
 loop loop1
end;       }

procedure paletacele(var b:array of byte);
var i:byte;
begin
 for i:=0 to 255 do begin
  mainform.DXDraw.ColorTable[i][0]:=b[i*3];
  mainform.DXDraw.ColorTable[i][1]:=b[i*3+1];
  mainform.DXDraw.ColorTable[i][2]:=b[i*3+2];
 end;
 mainform.DXDraw.UpdatePalette;
end;


procedure tmav;
var d:word;
begin
 for d:=0 to 629 do bufpal[d]:=0;
// o:=ofs(bufpal);
// s:=seg(bufpal);
zm(255);
// paleta1;
end;

procedure tmavcele;
var d:word;
begin
 for d:=0 to 767 do bufpal[d]:=0;
// o:=ofs(bufpal);
// s:=seg(bufpal);
 paletacele(bufpal);
end;


procedure movepal(pal:array of byte);
begin
 move(pal,bufpal,768);
 move(pal,zalpal,768);
end;
(*
procedure zm(poce:byte);
begin

{ o:=ofs(bufpal);
 s:=seg(bufpal);
 o2:=ofs(zalpal);
 s2:=seg(zalpal);
 if poce=0 then
 repeat
  zz;paleta1;delay(pau);retraces;
 until poc=0
 else
 repeat
  for d:=1 to poce do zz;
  paleta1;delay(pau);retraces;
 until poc=0;*/
}end;
  *)
procedure zm(poce:byte);
var i:byte;
begin
 for i:=0 to 210-1 do begin
  mainform.DXDraw.defColorTable[i][0]:=bufpal[i*3];
  mainform.DXDraw.defColorTable[i][1]:=bufpal[i*3+1];
  mainform.DXDraw.defColorTable[i][2]:=bufpal[i*3+2];
 end;
 mainform.fadeout(pau,RGB(0,0,0));
 for i:=0 to 210-1 do begin
  bufpal[i*3]:=0;
  bufpal[i*3+1]:=0;
  bufpal[i*3+2]:=0;
 end;
 //mainform.DXDraw.ColorTable := mainform.DXDraw.DefColorTable;
// mainform.DXDraw.UpdatePalette;

{ o:=ofs(bufpal);
 s:=seg(bufpal);
 o2:=ofs(zalpal);
 s2:=seg(zalpal);
 if poce=0 then
 repeat
  zzcele;paletacele;delay(pau);retraces;
 until poc=0
 else
 repeat
  for d:=1 to poce do zzcele;
  paletacele;delay(pau);retraces;
 until poc=0;}
end;

procedure ob(poce:byte);
//label dole,hore;
var i:byte;
begin
 move(zalpal,bufpal,768);
 for i:=0 to 210 do begin
  mainform.DXDraw.defColorTable[i][0]:=bufpal[i*3];
  mainform.DXDraw.defColorTable[i][1]:=bufpal[i*3+1];
  mainform.DXDraw.defColorTable[i][2]:=bufpal[i*3+2];
 end;
 mainform.fadein(pau,RGB(0,0,0));
 //mainform.DXDraw.ColorTable := mainform.DXDraw.DefColorTable;
// mainform.DXDraw.UpdatePalette;

//move(zalpal,bufpal,768);
//paletacele(bufpal);
{ o:=ofs(bufpal);
 s:=seg(bufpal);
 o2:=ofs(zalpal);
 s2:=seg(zalpal);
 if poce=0 then
 repeat
  oocele;paletacele;delay(pau);retraces;
 until poc=0
 else
 repeat
  for d:=1 to poce do oocele;
  paletacele;delay(pau);retraces;
 until poc=0;}
end;

procedure zmcele(poce:byte);
var i:byte;
begin
 for i:=0 to 255 do begin
  mainform.DXDraw.defColorTable[i][0]:=bufpal[i*3];
  mainform.DXDraw.defColorTable[i][1]:=bufpal[i*3+1];
  mainform.DXDraw.defColorTable[i][2]:=bufpal[i*3+2];
 end;
 mainform.fadeoutcele(pau,RGB(0,0,0));
 for i:=0 to 255-1 do begin
  bufpal[i*3]:=0;
  bufpal[i*3+1]:=0;
  bufpal[i*3+2]:=0;
 end;

 //mainform.DXDraw.ColorTable := mainform.DXDraw.DefColorTable;
// mainform.DXDraw.UpdatePalette;

{ o:=ofs(bufpal);
 s:=seg(bufpal);
 o2:=ofs(zalpal);
 s2:=seg(zalpal);
 if poce=0 then
 repeat
  zzcele;paletacele;delay(pau);retraces;
 until poc=0
 else
 repeat
  for d:=1 to poce do zzcele;
  paletacele;delay(pau);retraces;
 until poc=0;}
end;

procedure obcele(poce:byte);
//label dole,hore;
var i:byte;
begin
 logw('o1');
 move(zalpal,bufpal,768);
 logw('o2');
 for i:=0 to 255 do begin
  mainform.DXDraw.defColorTable[i][0]:=bufpal[i*3];
  mainform.DXDraw.defColorTable[i][1]:=bufpal[i*3+1];
  mainform.DXDraw.defColorTable[i][2]:=bufpal[i*3+2];
 end;
  logw('o3');

 mainform.fadeincele(pau,RGB(0,0,0));
 logw('o4');
 mainform.DXDraw.ColorTable := mainform.DXDraw.DefColorTable;
  logw('o5');

 mainform.DXDraw.UpdatePalette;
                                logw('o6');

//move(zalpal,bufpal,768);
//paletacele(bufpal);
{ o:=ofs(bufpal);
 s:=seg(bufpal);
 o2:=ofs(zalpal);
 s2:=seg(zalpal);
 if poce=0 then
 repeat
  oocele;paletacele;delay(pau);retraces;
 until poc=0
 else
 repeat
  for d:=1 to poce do oocele;
  paletacele;delay(pau);retraces;
 until poc=0;}
end;

(*procedure zzfont;assembler;
//label hore,dole;
asm
/*   push ds
   mov poc,0
   mov cx,138
   mov bx,630
hore:
   mov si,o
   mov ds,s
   add si,bx
   mov es,s2
   mov di,o2
   add di,bx
   mov dh,[ds:si]
   cmp dh,1
   jnge dole
   mov di,o
   add di,bx
   mov es,s
   mov ax,[es:di]
   dec ax
   mov [es:di],ax
   inc poc
dole:
   inc bx
   loop hore
   pop ds*/
end;

procedure oofont;assembler;
//label hore,dole;
asm
/*   push ds
   mov poc,0
   mov cx,138
   mov bx,630
hore:
   mov si,o
   mov ds,s
   add si,bx
   mov es,s2
   mov di,o2
   add di,bx
   mov dh,[ds:si]
   mov dl,[es:di]
   cmp dh,dl
   je dole
   mov di,o
   add di,bx
   mov es,s
   mov ax,[es:di]
   inc ax
   mov [es:di],ax
   inc poc
dole:
   inc bx
   loop hore
   pop ds*/
end;
 }*)

procedure zmfont(poce:byte);
var i:byte;
begin
 for i:=210 to 210+46-1 do begin
  mainform.DXDraw.defColorTable[i][0]:=bufpal[i*3];
  mainform.DXDraw.defColorTable[i][1]:=bufpal[i*3+1];
  mainform.DXDraw.defColorTable[i][2]:=bufpal[i*3+2];
 end;
 mainform.fadeoutfont(pau,RGB(0,0,0));
 for i:=210 to 210+46-1 do begin
  bufpal[i*3]:=0;
  bufpal[i*3+1]:=0;
  bufpal[i*3+2]:=0;
 end;
end;

procedure obfont(poce:byte);
var i:byte;
begin
 move(zalpal,bufpal,768);
 for i:=210 to 210+46-1 do begin
  mainform.DXDraw.defColorTable[i][0]:=bufpal[i*3];
  mainform.DXDraw.defColorTable[i][1]:=bufpal[i*3+1];
  mainform.DXDraw.defColorTable[i][2]:=bufpal[i*3+2];
 end;
 mainform.fadeinfont(pau,RGB(0,0,0));

 mainform.DXDraw.ColorTable := mainform.DXDraw.DefColorTable;
 mainform.DXDraw.UpdatePalette;
end;


procedure pauza(del:word);
var a:word;
begin
 a:=0;
 repeat
  stav;
  inc(a);
 until (lave)or(prave)or(keypressed)or(a=del);
 if prave then kl:=27;
 if lave then kl:=13;
 if keypressed then
 begin
  kl:=ord(readkey);
  //if kl=0 then kl:=ord(readkey);
 end;
 tloff;
end;

procedure kabsvetlo;
var d:word;
begin
 for d:=0 to 629 do bufpal[d]:=zalpal[d] div 5;
 paletacele(bufpal);
// paleta1;
end;

procedure menusvetlo;
var d:word;
begin
 for d:=0 to 629 do bufpal[d]:=zalpal[d] div 2;
 paletacele(bufpal);
end;

procedure ende;
var a:word;
begin
 if keypressed then tloff;
 zmcele(har);zmazcele;
  assign(f,'code\ktoco.nnp');reset(f,1);blockread(f,obrazok^,filesize(f));
  depack(filesize(f),obrpoi);close(f);
  move(tmp^[19],paletta^,768);move(tmp^[787],obrazok^,64000);
  for a:=1 to 255 do
  begin
   o:=paletta^[a*3+3];paletta^[a*3+3]:=paletta^[a*3+1];paletta^[a*3+1]:=o;
  end;
  movepal(paletta^);tmavcele;zobrazcele;obcele(har);
  repeat stav;until (lave)or(prave)or(keypressed);
  if keypressed then
  begin kl:=ord(readkey);if kl=0 then kl:=ord(readkey);end;
  tloff;zmcele(har);zmazcele;

  if soundis then begin if playing then stopsound;end;

 freemem(strpoi,70*21);freemem(tmppoi,64786);
 freemem(spritpoi,6400);freemem(obrpoi,64000);
 freemem(pallpoi,64000);freemem(mappoi,64000);
 freemem(fontpoi,10000);

 mainform.stop:=true;
 while true do sleep(1000);
{ writeln('Thanx for playing !                                       NoName Software');
 halt(0);}
end;

procedure zmaz;
var ddsd:tddsurfacedesc;
y:word;
begin
 mainform.DXDraw.Surface.Lock(PRect(nil)^,ddsd);
{ for x:=0 to 320-1 do
  for y:=0 to 200-1 do
   pbyte(integer(ddsd.lpSurface)+x+y*ddsd.lPitch)^:=byte(x);}
 for y:=0 to 155-1 do
  fillchar(pointer(ddsd.lpsurface+y*ddsd.lpitch)^,320,0);

 mainform.DXDraw.Surface.UnLock;
// mainform.DXDraw.Surface.StretchDraw();
 mainform.DXDraw.Flip;

{ mov ax,0a000h
 mov es,ax
 xor di,di
 mov ax,0000h
 mov cx,24800
 rep stosw}
end;

procedure zmazcele;
var ddsd:tddsurfacedesc;
y:word;
begin
 mainform.DXDraw.Surface.Lock(PRect(nil)^,ddsd);
{ for x:=0 to 320-1 do
  for y:=0 to 200-1 do
   pbyte(integer(ddsd.lpSurface)+x+y*ddsd.lPitch)^:=byte(x);}
 for y:=0 to 200-1 do
  fillchar(pointer(ddsd.lpsurface+y*ddsd.lpitch)^,320,0);

 mainform.DXDraw.Surface.UnLock;
 mainform.DXDraw.Flip;
{ mov ax,0a000h
 mov es,ax
 xor di,di
 mov ax,0
 mov cx,32768
 rep stosw}
end;

procedure zmazcelemapa;
begin
 fillchar(bu,64000,0);
{ for i:=0 to 64000-1 do begin
  bu[i]:=0;
 end;
{ mov ax,bu
 mov es,ax
 mov di,du
 mov ax,0
 mov cx,32000
 rep stosw}
end;



procedure testinit;
label go,go1;
begin
{ if maxavail<281000 then
 begin
  writeln;writeln;
  writeln('Volna : ',maxavail,' z 281000.');
  writeln('Prilis malo volnej pamati. Skus dosiahnut 450 Kb volnej.');
  halt(3);
 end;
 asm
  mov ax,$a000
  xor bx,bx
  mov es,ax
  mov di,0
  mov ax,$1b00
  int 10h
  cmp al,$1b
  je go1
 end;
 writeln;writeln;
 writeln('VGA karta nenajdena. Sorry.');
 halt(2);
go1:
 asm
  xor ax,ax
  int 33h
  cmp ax,$ffff
  je go
 end;
 writeln;writeln;
 writeln('Nenajdeny ovladac mysky !');
 halt(2);
go:
}
end;

procedure Stav;
begin
//tu som stravil asi 50 minut debugovania :(
 lave:=mainform.lave;
 stredne:=mainform.stredne;
 prave:=mainform.prave;
 x:=MainForm.x;
 y:=mainform.y;
 Sleep(1);
 // x:=mainform.DXInput.Mouse.X;
// y:=mainform.DXInput.Mouse.y;
end;

procedure Umiestni(x,y:word);
begin
//to snad po win ani nejde, teda ja to rozhodne neviem
{x:=x*2;
asm
 mov ax,4h
 mov cx,x
 mov dx,y
 int 33h
end;}
end;

{tuto hrozu som nerobil ja ale vlado :)}
procedure pis(xx,yy:word;a:string);
label kon;
var e,f,g:longint;
znak:byte;
ddsd:tddsurfacedesc;
begin
 mainform.DXDraw.Surface.Lock(PRect(nil)^,ddsd);

 e:=(xx-1)*ddsd.lpitch+yy;
 for f:=1 to length(a) do
 begin
  znak:=ord(a[f]);
  case znak of
  ord('A'):
  begin
   for g:=0 to 4 do
//    move(font^[1+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
    move(font^[1+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
    inc(e,6);
  goto kon;end;
 ord('B') :
 begin
   for g:=0 to 4 do
    move(font^[7+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
  ord('C') :
   begin for g:=0 to 4 do
   move(font^[13+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
    inc(e,6);
   goto kon;end;
 ord('D') :
   begin for g:=0 to 4 do
     move(font^[19+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
    inc(e,6);
   goto kon;end;
 ord('E') :
   begin for g:=0 to 4 do
     move(font^[25+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
    inc(e,6);
    goto kon;end;
 ord('F')
   : begin for g:=0 to 4 do
     move(font^[31+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
    inc(e,6);
   goto kon;end;
 ord('G')
   : begin for g:=0 to 4 do
     move(font^[37+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
    inc(e,6);
   goto kon;end;
 ord('H')
   : begin for g:=0 to 4 do
     move(font^[43+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
    inc(e,6);
   goto kon;end;
 ord('I')
   : begin for g:=0 to 4 do
     move(font^[50+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,3);
    inc(e,4);
   goto kon;end;
 ord('J')
   : begin for g:=0 to 4 do
      move(font^[55+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
    inc(e,6);
   goto kon;end;
ord('K')
   : begin for g:=0 to 4 do
     move(font^[62+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,4);
    inc(e,5);
   goto kon;end;
 ord('L')
   : begin for g:=0 to 4 do
     move(font^[68+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,4);;
    inc(e,5);
   goto kon;end;
 ord('M')
   : begin for g:=0 to 4 do
     move(font^[73+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
    inc(e,6);
   goto kon;end;
 ord('N')
   : begin for g:=0 to 4 do
     move(font^[79+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
    inc(e,6);
   goto kon;end;
 ord('O')
   : begin for g:=0 to 4 do
     move(font^[85+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
    inc(e,6);
   goto kon;end;
 ord('P')
   : begin for g:=0 to 4 do
     move(font^[91+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
    inc(e,6);
   goto kon;end;
 ord('Q')
   : begin for g:=0 to 5 do
     move(font^[97+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
    inc(e,6);
   goto kon;end;
 ord('R')
   : begin for g:=0 to 4 do
     move(font^[103+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
    inc(e,6);
   goto kon;end;
 ord('S') :
 begin
  for g:=0 to 4 do
   move(font^[109+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
  inc(e,6);
 goto kon;end;
 ord('T') :
 begin
  for g:=0 to 4 do
   move(font^[115+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
  inc(e,6);
 goto kon;end;
 ord('U') :
 begin
  for g:=0 to 4 do
   move(font^[121+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
  inc(e,6);
 goto kon;end;
 ord('V') :
 begin
  for g:=0 to 4 do
   move(font^[127+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
  inc(e,6);
 goto kon;end;
 ord('W')
 : begin for g:=0 to 4 do
   move(font^[133+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
  inc(e,6);
 goto kon;end;
 ord('X')
 : begin for g:=0 to 4 do
   move(font^[139+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
  inc(e,6);
 goto kon;end;
 ord('Y')
  : begin for g:=0 to 4 do
    move(font^[145+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('Z') : begin for g:=0 to 4 do
   move(font^[151+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
  inc(e,6);
 goto kon;end;
 ord('1') : begin for g:=0 to 4 do
   move(font^[157+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,3);
  inc(e,3);
 goto kon;end;
 ord('2') : begin for g:=0 to 4 do
   move(font^[161+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
  inc(e,6);
 goto kon;end;
ord('3') : begin for g:=0 to 4 do
   move(font^[167+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
  inc(e,6);
 goto kon;end;
 ord('4') :
 begin
  for g:=0 to 4 do
   move(font^[173+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
  inc(e,6);
 goto kon;end;
 ord('5') :
 begin
  for g:=0 to 4 do
    move(font^[179+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('6') :
  begin
   for g:=0 to 4 do
    move(font^[185+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('7') :
  begin
   for g:=0 to 4 do
    move(font^[191+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('8') :
 begin
  for g:=0 to 4 do
   move(font^[197+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
  inc(e,6);
 goto kon;end;
 ord('9')  :
 begin
  for g:=0 to 4 do
   move(font^[203+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
  inc(e,6);
 goto kon;end;
 ord('0') : begin for g:=0 to 4 do
    move(font^[209+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('’') : begin for g:=0 to 6 do
    move(font^[1921+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('¥')
  : begin for g:=0 to 6 do
    move(font^[1927+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('')
  : begin for g:=0 to 6 do
    move(font^[1933+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('')
  : begin for g:=0 to 6 do
    move(font^[1939+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('‹')
  : begin for g:=0 to 6 do
    move(font^[1946+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,3);
   inc(e,4);
  goto kon;end;
 ord('•')
  : begin for g:=0 to 6 do
    move(font^[1951+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('—')
  : begin for g:=0 to 6 do
    move(font^[1957+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('Š')
  : begin for g:=0 to 6 do
    move(font^[1964+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,4);
   inc(e,5);
  goto kon;end;
 ord('œ')
  : begin for g:=0 to 6 do
    move(font^[1970+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,4);
   inc(e,5);
  goto kon;end;
 ord('›')
  : begin for g:=0 to 6 do
    move(font^[1975+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('€')
  : begin for g:=0 to 6 do
    move(font^[1981+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('…')
  : begin for g:=0 to 6 do
    move(font^[1987+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('')
  : begin for g:=0 to 6 do
    move(font^[1993+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('~')
  : begin for g:=0 to 7 do
    move(font^[1679+g*320],pointer(ddsd.lpsurface+(g-3)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('†')
  : begin for g:=0 to 7 do
    move(font^[1684+g*320],pointer(ddsd.lpsurface+(g-3)*ddsd.lpitch+e)^,6);
   inc(e,7);
  goto kon;end;
 ord('Ž')
  : begin for g:=0 to 7 do
    move(font^[1690+g*320],pointer(ddsd.lpsurface+(g-3)*ddsd.lpitch+e)^,6);
   inc(e,7);
  goto kon;end;
 ord('!')
  : begin for g:=0 to 5 do
    move(font^[4481+g*320],pointer(ddsd.lpsurface+(g-1)*ddsd.lpitch+e)^,1);
   inc(e,2);
  goto kon;end;
 ord('?')
  : begin for g:=0 to 5 do
    move(font^[4483+g*320],pointer(ddsd.lpsurface+(g-1)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord(':')
  : begin for g:=0 to 5 do
    move(font^[4489+g*320],pointer(ddsd.lpsurface+g*ddsd.lpitch+e)^,1);
   inc(e,2);
  goto kon;end;
 ord(';')
  : begin for g:=0 to 5 do
    move(font^[4492+g*320],pointer(ddsd.lpsurface+(g+1)*ddsd.lpitch+e)^,2);
   inc(e,3);
  goto kon;end;
 ord('.')
  : begin for g:=0 to 4 do
    move(font^[4501+g*320],pointer(ddsd.lpsurface+(g+1)*ddsd.lpitch+e)^,1);
   inc(e,2);
  goto kon;end;
 ord(',')
  : begin for g:=0 to 5 do
    move(font^[4506+g*320],pointer(ddsd.lpsurface+(g+1)*ddsd.lpitch+e)^,3);
   inc(e,4);
  goto kon;end;
 ord('"')
  : begin for g:=0 to 5 do
    move(font^[4516+g*320],pointer(ddsd.lpsurface+(g-1)*ddsd.lpitch+e)^,7);
   inc(e,7);
  goto kon;end;
 ord(' ')
 : begin for g:=0 to 8 do
   move(font^[4601+g*320],pointer(ddsd.lpsurface+(g-3)*ddsd.lpitch+e)^,6);
  inc(e,6);
   end;
  end;
kon:
 end;
 for g:=0 to 8 do
//  move(mem[$a000:188*320+9+g*320],obrazok^[188*320+10+g*320],{300}{length(a)*6);
  move(pointer(ddsd.lpsurface+(g+188)*ddsd.lpitch+9)^,obrazok^[188*320+10+g*320],{300}length(a)*6);

 mainform.DXDraw.Surface.UnLock;
// mainform.DXDraw.Flip;
end;


procedure tloff;
begin
 repeat
  stav;
 until (not lave)and(not prave);
 if keypressed then
 repeat
//  readkey;
 until not keypressed;
end;

procedure zobrazcele;
var ddsd:tddsurfacedesc;
y:word;
begin
 {push ds
 lds si,obrazok
 mov ax,0a000h
 mov es,ax
 xor di,di
 mov cx,32768
 rep movsw
 pop ds}
 mainform.DXDraw.Surface.Lock(PRect(nil)^,ddsd);
{ for x:=0 to 320-1 do
  for y:=0 to 200-1 do
   pbyte(integer(ddsd.lpSurface)+x+y*ddsd.lPitch)^:=byte(x);}
 for y:=0 to 200-1 do
  move(obrazok^[y*320+1],pointer(ddsd.lpsurface+y*ddsd.lpitch)^,320);

 mainform.DXDraw.Surface.UnLock;
 mainform.DXDraw.Flip;
end;


procedure myson(kurzor:byte);
//label mensie,mensie2,loop;
var kurz:byte;
    ddsd:tddsurfacedesc;
var a:word;
var c,d:word;
begin
 riad:=kurzor div 16;
 kurz:=kurzor mod 16;
 e:=19;if y>180 then e:=200-y-1;
 d:=19;if x>300 then d:=320-x-1;
 b:=y*320+x;
 for a:=0 to e do move(obrazok^[1+b+a*320],myska[a*20+1],d+1);

  mainform.DXDraw.Surface.Lock(PRect(nil)^,ddsd);

 for a:=0 to e do for c:=0 to d do
  if sprites^[(a+1)*320+c+2+kurz*20+riad*6400]<>0 then
   pbyte(ddsd.lpsurface+(a+y)*ddsd.lpitch+x+c)^:=sprites^[2+(a+1)*320+c+kurz*20+riad*6400];
 //  mem[$a000:b+a*320+c]:=;

 mainform.DXDraw.Surface.UnLock;
 mainform.DXDraw.Flip;

 oldkurz:=kurzor;
 xr:=d;yr:=e;
end;
procedure mysoffall;forward;

procedure mysoff;
var ddsd:tddsurfacedesc;
var a:word;
begin
 riad:=oldkurz div 16;
 oldkurz:=oldkurz mod 16;
 mainform.DXDraw.Surface.Lock(PRect(nil)^,ddsd);

 for a:=0 to yr do
 begin
   move(myska[a*20+1],pointer(ddsd.lpsurface+(y2+a)*ddsd.lpitch+x2)^,xr+1);
 end;
 mainform.DXDraw.Surface.UnLock;

 { riad:=oldkurz div 16;
 oldkurz:=oldkurz mod 16;
 mainform.DXDraw.Surface.Lock(PRect(nil)^,ddsd);

 for a:=0 to yr do
 begin
  if (y2+a>=y)and(y2+a<=y+yr) then
  begin
   d:=y2+a-y;
   for b:=0 to xr do
   begin
    if (x2+b>=x)and(x2+b<=x+xr) then
    begin
     e:=x2+b-x;
     c:=sprites^[e+2+(d+1)*320+riad*6400+oldkurz*20];
     if c=0 then
      pbyte(integer(ddsd.lpsurface)+(y2+a)*ddsd.lpitch+b+x2)^:=myska[a*20+1+b]
//      mem[$a000:y2*320+x2+a*320+b]:=myska[a*20+1+b]
      else //mem[$a000:y2*320+x2+a*320+b]:=c;
       pbyte(integer(ddsd.lpsurface)+(a+y2)*ddsd.lpitch+b+x2)^:=c
    end else //mem[$a000:y2*320+x2+a*320+b]:=myska[a*20+1+b];
     pbyte(integer(ddsd.lpsurface)+(y2+a)*ddsd.lpitch+b+x2)^:=myska[a*20+1+b];
   end;
  end else //move(myska[a*20+1],mem[$a000:y2*320+x2+a*320],xr+1);
   move(myska[a*20+1],pointer(integer(ddsd.lpsurface)+(y2+a)*ddsd.lpitch+x2)^,xr+1);
 end;
 mainform.DXDraw.Surface.UnLock;
}
end;

procedure mysoffall;
//label mensie,mensie2,loop;
var 
    ddsd:tddsurfacedesc;
    a,e,d:word;
begin
 e:=19;if y>180 then e:=200-y-1;
 d:=19;if x>300 then d:=320-x-1;
 mainform.DXDraw.Surface.Lock(PRect(nil)^,ddsd);
 for a:=0 to e do
 // move(obrazok^[1+b+a*320],myska[a*20+1],d+1);
  move(myska[a*20+1],pointer(ddsd.lpsurface+(a+y)*ddsd.lpitch+x)^,d+1);

 mainform.DXDraw.Surface.UnLock;
end;

{procedure mysoffall;
//label loop1;
begin
{ o:=ofs(myska);
 s:=seg(myska);
 asm
  push ds
  mov si,o
  mov ds,s
  mov ax,$a000
  mov es,ax
  mov di,b
  xor bh,bh
  mov bl,xr
  xor ch,ch
  mov cl,yr
  inc cl
  mov ax,319
  sub ax,bx
  xor bh,bh
  mov bl,19
  sub bl,xr
loop1:
  push cx
  mov cl,xr
  inc cx
  rep movsb
  add di,ax
  add si,bx
  pop cx
  loop loop1
  pop ds
 end;

end;
 }
procedure klavesi;
begin
kl:=ord(readkey);
exit;

//windows suck
{    kl:=ord(readkey);
    if chr(kl)='+' then begin if k<24 then k:=k+4 else k:=24;end;
    if chr(kl)='-' then begin if k>4 then k:=k-4 else k:=1;end;
    if kl=0 then
    begin
     kl:=ord(readkey);
     if ord(kl)=72 then
     begin
      stav;if y>=(k) then umiestni(x,(y-k))
       else umiestni(x,0);
     end;
     if ord(kl)=80 then
     begin
      stav;umiestni(x,(y+k));
     end;
     if ord(kl)=77 then
     begin
      stav;umiestni((x+k),(y));
     end;
     if ord(kl)=75 then
     begin stav;
      if x>=k then umiestni((x-k),y)
       else umiestni(0,y);
     end;
    end;}
end;

procedure kurzor(kurz:byte);
begin
 kl:=1;
 stav;
 if pisat then
 begin
  pis(192,9,'                                                  ');
  if mapa^[x+y*320+1]<>0 then
   pis(192,9,strings^[mapa^[x+y*320+1]]);
  m:=mapa^[x+y*320+1];
 end;
 c:=mapa^[x+y*320+1];
 if (c<>0) then
 begin
  temp:=strings^[c];
  if (temp[length(temp)]='`')and(kurz=3) then
   myson(1)
  else
   myson(kurz);
 end
 else
  myson(kurz);
 repeat
  x2:=x;y2:=y;stav;if keypressed then klavesi;
  if (x<>x2)or(y<>y2) then
  begin
   c:=mapa^[x+y*320+1];
   if c<>0 then
   begin
    temp:=strings^[c];
    if (temp[length(temp)]='`')and(kurz=3) then
     oldkurz:=1 else oldkurz:=kurz;
   end else oldkurz:=kurz;
   mysoff;
   if pisat then
   begin
    if m<>mapa^[x+y*320+1] then
    begin
     pis(192,9,'                                                  ');
     if mapa^[x+y*320+1]<>0 then
      pis(192,9,strings^[mapa^[x+y*320+1]]);
    end;
    m:=mapa^[x+y*320+1];
   end;
   c:=mapa^[x+y*320+1];
   if c<>0 then
   begin
    temp:=strings^[c];
    if (temp[length(temp)]='`')and(kurz=3) then
     myson(1)
    else
     myson(kurz);
   end
   else
    myson(kurz);
 end;
 until (prave)or(lave)or(kl=13)or(kl=27)or(kl=32);
 mysoffall;m:=0;
end;

procedure tl(ku:byte);
begin
 stav;
 if (lave)or(prave) then
 begin
  myson(ku);
  repeat
   x2:=x;y2:=y;stav;
   if (x<>x2)or(y<>y2) then
   begin
    mysoff;
    myson(ku);
   end;
  until (not lave)and(not prave);
  mysoffall;
 end;
 if keypressed then
  while not keypressed do begin readkey;end;
end;

procedure say(cis,cis2:word;sss:string);
begin
 tl(2);
 pis(cis,cis2,'                                                  ');
 pis(cis,cis2,sss);
 pisat:=false;
 kurzor(2);
 if keypressed then
 repeat
  kurzor(2);if keypressed then kl:=ord(readkey);
 until (kl=13);
 tl(2);pis(cis,cis2,'                                                  ');
 kl:=1;
 pisat:=true;
end;

procedure closewin;
var a:word;
begin
 for a:=0 to xsiz-1 do
 begin
  move(tmp^[1+a*ysiz+ysiz*xsiz],obrazok^[1+xpov+ypov*320+a*320],ysiz);
  move(tmp^[1+a*ysiz],mapa^[1+xpov+ypov*320+a*320],ysiz);
 end;
 win:=false;
 sprloaded:='';
end;

procedure depack(siz:word;var pop:pointer);
var a2:array of byte;
c,d:byte;
    ff,e:word;
begin
//ultra genialne pakovanie :) nieco ako RLE ale hrozne naprogramovane
//... holt je to z roku 1995
//povodne to bolo dokonca v asm, ale pod win to neslo (16bit real mod)
 SetLength(a2,siz);
// a2:=pop^;
 move(pop^,a2[0],siz);
 // blockread(f2,a2^,siz);
 e:=1;
 ff:=0;
 while ff<siz do
 begin
  if (ff<siz-2)and(a2[ff]=a2[ff+1]) then
  begin
   c:=a2[ff];
   inc(ff);
   inc(ff);
   d:=a2[ff];
   inc(ff);
   for d:=1 to d do
   begin
    tmp^[e]:=c;
    inc(e);
   end;
  end
  else
  begin
   tmp^[e]:=a2[ff];
   inc(ff);
   inc(e);
  end;
 end;
 a2:=nil;
end;

(*procedure depack(siz:word;var pop:pointer);
var o,s,o2,s2:word;
    pa:^typ1;
//label loop,ne,no,jump;
begin
{ pa:=pop;o:=ofs(pop^);s:=seg(pop^);o2:=ofs(tmp^);s2:=seg(tmp^);
 asm
  push ds
  xor ax,ax
  mov es,s2
  mov si,o2
  mov ds,s
  mov di,o
 jump:
  mov dx,siz
  cmp ax,dx
  je no
  mov bl,[ds:di]
  inc di
  mov dl,[ds:di]
  cmp bl,dl
  jne ne
  inc di
  mov dl,[ds:di]
  inc di
  inc ax
  inc ax
  inc ax
  mov cl,dl
 loop:
  mov [es:si],bl
  inc si
 loop loop
 jmp jump
 ne:
  dec di
  mov cl,[ds:di]
  mov [es:si],cl
  inc di
  inc si
  inc ax
 jmp jump
 no:
 pop ds
 end;}
end;
*)
procedure tgapalet;
var o:byte;
var a:word;
begin
 for a:=0 to 209 do
 begin
  o:=paletta^[a*3+3];
  paletta^[a*3+3]:=paletta^[a*3+1];
  paletta^[a*3+1]:=o;
 end;
end;

procedure tgapaletcele;
var a:word;
begin
// for a:=1 to 768 do paletta^[a]:=paletta^[a] div 4;
 for a:=0 to 255 do
 begin
  o:=paletta^[a*3+3];paletta^[a*3+3]:=paletta^[a*3+1];paletta^[a*3+1]:=o;
 end;
end;

procedure newspr(meno:string);
var xpovn,ypovn,xsizn,ysizn:word;
    p:pointer;
    o:typ1;
var a:word;
begin
 assign(f,meno+'.spr');reset(f,1);close(f);
 assign(f,meno+'.spr');reset(f,1);
 blockread(f,xpovn,2);
 blockread(f,ypovn,2);
 blockread(f,xsizn,2);
 blockread(f,ysizn,2);
 getmem(p,filesize(f)-8);
 o:=p;
 blockread(f,p^,filesize(f)-8);
 close(f);
 for a:=0 to xsizn-1 do
 begin
//  move(obrazok^[1+a*ysizn],mem[$a000:xpovn+ypovn*320+a*320],ysizn);
  move(o^[1+a*ysizn],obrazok^[1+xpovn+ypovn*320+a*320],ysizn);
//  move(obrazok^[1+a*ysizn+ysizn*xsizn],mapa^[1+xpovn+ypovn*320+a*320],ysizn);
  move(o^[1+a*ysizn+ysizn*xsizn],mapa^[1+xpovn+ypovn*320+a*320],ysizn);
 end;
 zobraz;
 freemem(o);
end;

procedure loadobr(nam:string);
begin
 assign(f,nam+'.nnp');reset(f,1);
 blockread(f,mapa^,filesize(f));
 depack(filesize(f),mappoi);close(f);
 move(tmp^[19],paletta^,630);
 move(tmp^[787],obrazok^,49600);
 tgapalet;
end;

procedure loadobrcele(nam:string);
begin
 assign(f,nam+'.nnp');reset(f,1);
 blockread(f,obrazok^,filesize(f));
 depack(filesize(f),obrpoi);close(f);
 move(tmp^[19],paletta^,768);
 move(tmp^[787],obrazok^,64000);
 tgapaletcele;
end;

procedure loadspr(meno:string);
var gm:pointer;
    ob:typ1;
var a:word;
begin
 if sprloaded<>meno then
 begin
  if win then begin closewin;zobraz;end;
  sprloaded:=meno;
  assign(f,meno+'.spr');reset(f,1);
  blockread(f,xpov,2);blockread(f,ypov,2);
  blockread(f,xsiz,2);blockread(f,ysiz,2);
  blockread(f,tmp^,filesize(f)-8);
  close(f);
  getmem(gm,64000);
  ob:=gm;

  for a:=0 to xsiz-1 do
  begin move(obrazok^[1+xpov+ypov*320+a*320],ob^[1+a*ysiz+ysiz*xsiz],ysiz);end;

  for a:=0 to xsiz-1 do
  begin move(tmp^[1+a*ysiz],obrazok^[1+xpov+ypov*320+a*320],ysiz);end;

  for a:=0 to xsiz-1 do
  begin move(mapa^[1+xpov+ypov*320+a*320],tmp^[1+a*ysiz],ysiz);end;

  for a:=0 to xsiz-1 do
  begin move(tmp^[1+a*ysiz+ysiz*xsiz],mapa^[1+xpov+ypov*320+a*320],ysiz);end;

  for a:=0 to xsiz-1 do
  begin move(ob^[1+a*ysiz+ysiz*xsiz],tmp^[1+a*ysiz+ysiz*xsiz],ysiz);end;

//  for a:=0 to xsiz-1 do
//  begin move(mem[$a000:xpov+ypov*320+a*320],tmp^[1+a*ysiz+ysiz*xsiz],ysiz);end;
  freemem(gm);
  zobraz;
  win:=true;
 end;
end;

procedure zobraz;
var ddsd:tddsurfacedesc;
y:word;
begin
 mainform.DXDraw.Surface.Lock(PRect(nil)^,ddsd);
{ for x:=0 to 320-1 do
  for y:=0 to 200-1 do
   pbyte(integer(ddsd.lpSurface)+x+y*ddsd.lPitch)^:=byte(x);}
 for y:=0 to 155-1 do
  move(obrazok^[y*320+1],pointer(ddsd.lpsurface+y*ddsd.lpitch)^,320);

 mainform.DXDraw.Surface.UnLock;
 mainform.DXDraw.Flip;
{ push ds
 lds si,obrazok
 mov ax,0a000h
 mov es,ax
 xor di,di
 mov cx,24800
 rep movsw
 pop ds}
end;

procedure paleta;
{var r,g,blue:byte;
begin
}var i:byte;
begin
 for i:=0 to 255 do begin
  mainform.DXDraw.ColorTable[i][0]:=paletta^[i*3+1];
  mainform.DXDraw.ColorTable[i][1]:=paletta^[i*3+2];
  mainform.DXDraw.ColorTable[i][2]:=paletta^[i*3+3];
 end;
 mainform.DXDraw.UpdatePalette;

{ for d:=0 to 255 do
 begin
  r:=paletta^[d*3+1];
  g:=paletta^[d*3+2];
  blue:=paletta^[d*3+3];
  asm
   mov dx,$3C8
   mov ax,d
   out dx,al
   inc dx
   mov al,r
   out dx,al
   mov al,g
   out dx,al
   mov al,blue
   out dx,al
  end;
 end;}
end;

procedure loadroom(meno:string);
var b,c:word;
str:string;
begin
 win:=false;
 sprloaded:='';
 zm(har);zmaz;
 loadobr(meno);
 assign(f,meno+'.nnm');reset(f,1);
 blockread(f,mapa^,filesize(f));
 depack(filesize(f),mappoi);close(f);
 move(tmp^,mapa^,49600);
 mapaspod;
 tassign(t,meno+'.nnt');
 treset(t);
 a:=0;
 repeat
  inc(a);treadln(t,str);
  strings^[a]:=str;
 until teof(t);
 for b:=1 to a do
  for c:=1 to length(strings^[b]) do
   strings^[b][c]:=chr(ord(strings^[b][c])-30);
 tclose(t);
 movepal(paletta^);
 tmav;
 zobraz;if cast=1 then begin
 if (not predmal[11])and(meno='data\pivnica') then
  begin newspr('data\pivnica1');end;
 if (predmal[14])and(meno='data\chodba1') then
  begin newspr('data\chodba12');end;
 end else if cast=2 then
 begin
  if (predmal[1])and(meno='data2\posch1') then
   begin newspr('data2\poschpla');end;
  if (not predmal[2])and(meno='data2\posch1') then
   begin newspr('data2\poschdro');end;
  if (predmal[4])and(meno='data2\posch1') then
   begin newspr('data2\poschpa');end;
  if (not predmal[6])and(meno='data2\poschod') then
   begin newspr('data2\poschod1');end;
  if (not predmal[8])and(meno='data2\poschzac') then
   begin newspr('data2\poschza1');end;
  if (predmal[9])and(meno='data2\poschzac') then
   begin newspr('data2\poschsnu');end;
  if (not predmal[11])and(meno='data2\prizvcho') then
   begin newspr('data2\prizvch1');end;
  if (not predmal[14])and(meno='data2\prizkuch') then
   begin newspr('data2\prizkuc1');end;
  if (not predmal[15])and(meno='data2\prizjeda') then
   begin newspr('data2\prizjed1');end;
  if (not predmal[21])and(meno='data2\prizach') then
   begin newspr('data2\prizach1');end;
  if (predmal[24])and(meno='data2\prizchod') then
   begin newspr('data2\prizcho3');end else
  if (predmal[23])and(meno='data2\prizchod') then
   begin newspr('data2\prizcho2');end;
  if (predmal[25])and(meno='data2\poschkup') then
   begin newspr('data2\poschku1');end;
 end;
 ob(har);paleta;
end;

procedure nuluj;
var a:word;
begin
 for a:=1 to 40 do predm[a]:=false;
 for a:=1 to 40 do predmal[a]:=false;
 prikaz:='pouzi';
end;

procedure zobrazspod;
var ddsd:tddsurfacedesc;
y:word;
begin
 mainform.DXDraw.Surface.Lock(PRect(nil)^,ddsd);
{ for x:=0 to 320-1 do
  for y:=0 to 200-1 do
   pbyte(integer(ddsd.lpSurface)+x+y*ddsd.lPitch)^:=byte(x);}
 for y:=155 to 200-1 do
  move(obrazok^[y*320+1],pointer(ddsd.lpsurface+y*ddsd.lpitch)^,320);

 mainform.DXDraw.Surface.UnLock;
 mainform.DXDraw.Flip;

{ push ds
 lds si,obrazok
 mov ax,0a000h
 mov es,ax
 add si,49600
 mov di,49600
 mov cx,7968
 rep movsw
 pop ds}
end;

procedure zobrazpred;
var a,c:word;
begin
 if predme>5 then predm[predme]:=false;b:=0;
 for a:=0 to 44 do move(sprites^[a*320+155*320+1],obrazok^[a*320+155*320+1],320);
 for a:=1 to 10 do strings^[241+a]:='';
 for a:=6 to 15 do
 begin
  if predm[a]=true then
  begin
   inc(b);predreal[b]:=a;strings^[241+b]:=predstr[a];
   for c:=1 to 19 do move(sprites^[a*20+c*320+2],obrazok^[b*20+c*320+160*320-11],19);
  end;
 end;
 for a:=16 to 31 do
 begin
  if predm[a]=true then
  begin
   inc(b);predreal[b]:=a;strings^[241+b]:=predstr[a];
   for c:=1 to 19 do move(sprites^[(a-16)*20+c*320+2+6400],obrazok^[b*20+c*320+160*320-11],19);
  end;
 end;
 for a:=32 to 40 do
 begin
  if predm[a]=true then
  begin
   inc(b);predreal[b]:=a;strings^[241+b]:=predstr[a];
   for c:=1 to 19 do move(sprites^[(a-32)*20+c*320+2+12800],obrazok^[b*20+c*320+160*320-11],19);
  end;
 end;
 if prikaz='pouzi' then for a:=1 to 21 do
  move(sprites^[88*320+a*320+1],obrazok^[159*320+a*320+214],25);
 if prikaz='zober' then for a:=1 to 21 do
  move(sprites^[88*320+a*320+26],obrazok^[159*320+a*320+239],25);
 if prikaz='prezri' then for a:=1 to 21 do
  move(sprites^[88*320+a*320+51],obrazok^[159*320+a*320+264],25);
 zobrazspod;
 if predme>5 then predm[predme]:=true;
end;

procedure set400mode;
begin
 mainform.goto400:=true;
 while mainform.goto400=true do sleep(500);
//  mainform.DXDraw.Finalize;
//  mainform.DXDraw.Display.Width := 640;
//  mainform.DXDraw.Display.Height := 480;
//  mainform.DXDraw.Display.BitCount := 8;
//  mainform.DXDraw.Initialize;


//320x400 X-mod, samozrejme v vo windows nejde
//ach jo, to bola krasna doba :(
{ mov dx,grcontport
 mov al,5
 out dx,al
 inc dx
 in al,dx
 and al,11101111b
 out dx,al
 dec dx
 mov al,6
 out dx,al
 inc dx
 in al,dx
 and al,11111101b
 out dx,al
 mov dx,seqport
 mov al,4
 out dx,al
 inc dx
 in al,dx
 and al,11110111b
 or al,00000100b
 out dx,al
 mov dx,seqport
 mov ax,$0f02
 out dx,ax
 mov ax,$a000
 mov es,ax
 sub di,di
 sub ax,ax
 mov cx,$8000
 rep stosw
 mov dx,crtcport
 mov al,9h
 out dx,al
 inc dx
 in al,dx
 and al,01110000b
 out dx,al
 dec dx
 mov al,14h
 out dx,al
 inc dx
 in al,dx
 and al,10111111b
 out dx,al
 dec dx
 mov al,17h
 out dx,al
 inc dx
 in al,dx
 or al,01000000b
 out dx,al}
 end;
{
procedure changeoffset(num:word);
begin
// port[$3d4]:=$c;
// port[$3d5]:=num div 256;
// port[$3d4]:=$d;
// port[$3d5]:=num mod 256;
end;

procedure scroll(x2,y2:word);
begin
// changeoffset(y2 div 4+x2*80);
end;

procedure kresliciaru(bu:word;buf:typ1);
var ddsd:tddsurfacedesc;
begin

 mainform.DXDraw.Surface.Lock(PRect(nil)^,ddsd);
 move(buf^[bu*320+1],pointer(integer(ddsd.lpsurface)+b*ddsd.lpitch)^,320);

// for a:=0 to 79 do
//  mem[$a000:400*80+b*80+a]:=buf^[bu*320+a*4+1];
 mainform.DXDraw.Surface.UnLock;
 mainform.DXDraw.Flip;

{ asm
  mov ah,1
  mov dx,03c4h
  mov al,02h
  out dx,al
  inc dx
  mov al,ah
  out dx,al
 end;
 for a:=0 to 79 do mem[$a000:400*80+b*80+a]:=buf^[bu*320+a*4+1];
 asm
  mov ah,2
  mov dx,03c4h
  mov al,02h
  out dx,al
  inc dx
  mov al,ah
  out dx,al
 end;
 for a:=0 to 79 do mem[$a000:400*80+b*80+a]:=buf^[bu*320+a*4+2];
 asm
  mov ah,4
  mov dx,03c4h
  mov al,02h
  out dx,al
  inc dx
  mov al,ah
  out dx,al
 end;
 for a:=0 to 79 do mem[$a000:400*80+b*80+a]:=buf^[bu*320+a*4+3];
 asm
  mov ah,8
  mov dx,03c4h
  mov al,02h
  out dx,al
  inc dx
  mov al,ah
  out dx,al
 end;
 for a:=0 to 79 do mem[$a000:400*80+b*80+a]:=buf^[bu*320+a*4+4];
}{end;

procedure doskrol2;
begin
{a:=150;
repeat
 for c:=0 to a div 3 do
 begin scroll(b-c*3,0);retraces;end;
 for c:=a div 3 downto 0 do
 begin scroll(b-c*3,0);retraces;end;
 a:=a div 4;
until a<10; }
{end;

procedure doskrol;
var a:word;
    speed,vyska:integer;
begin
{vyska:=0;
speed:=-200;
repeat
 if speed>0 then begin
  speed:=speed+6;
  vyska:=vyska-speed div 20;
  if vyska<0 then
   begin speed:=-speed;vyska:=0;end;
 end else begin
  vyska:=vyska-speed div 20;
  speed:=speed+12;
 end;
 scroll(b-vyska,0);
until (abs(speed)<=50)and(vyska=0);
}
{end;

procedure thend;
begin
 tloff;zm(har);zmcele(har);zmazcele;loadobrcele('data3\koniec');
 if soundis then begin stopsound;initsound(cfg,speed,'happyend.mod');end;
 movepal(paletta^);
 tmavcele;zobrazcele;
 obcele(0);pauza(4000);zmcele(0);zmazcele;
 set400mode;
 loadobrcele('ende\grat');
 movepal(paletta^);
 tmavcele;b:=0;
 repeat
  inc(b);
  scroll(b,0);
  kresliciaru(b-(b div 200)*200,obrazok);
 until (b=200);obcele(0);b:=200;
 loadobrcele('ende\grat1');
 repeat
  scroll(b,0);
  kresliciaru(b-(b div 200)*200,obrazok);
  dec(b);kresliciaru(b-(b div 200)*200,obrazok);
  dec(b);kresliciaru(b-(b div 200)*200,obrazok);
  dec(b);kresliciaru(b-(b div 200)*200,obrazok);
  inc(b,3);
  if b mod 1600=0 then begin doskrol;pauza(2000);end else
  if b mod 1400=0 then begin doskrol;loadobrcele('ende\kon');pauza(10000);end else
  if b mod 1200=0 then begin doskrol;loadobrcele('ende\hoe');pauza(5000);end else
  if b mod 1000=0 then begin doskrol;loadobrcele('ende\jano');pauza(12000);end else
  if b mod 800=0 then begin doskrol;loadobrcele('ende\vlado2');pauza(12000);end else
  if b mod 600=0 then begin doskrol;loadobrcele('ende\vlado1');pauza(12000);end else
  if b mod 400=0 then begin doskrol;loadobrcele('ende\dano1');pauza(3000);end;
  inc(b,4);
  stav;
 until (b=1604);tloff;
 zmcele(0);
 mainform.stop:=true;
 while true do sleep(1000);
// ende;
end;
}
procedure scroll(line:word;p:pointer);
var ddsd:tddsurfacedesc;
    a,b:word;
begin
 mainform.DXDraw.Surface.Lock(PRect(nil)^,ddsd);
 for a:=0 to 400-1 do begin
  for b:=0 to 320-1 do begin
   pbyte(ddsd.lpsurface+a*ddsd.lpitch+b*2)^:=PBYTE(p+(line+a)*320+b)^;
   pbyte(ddsd.lpsurface+a*ddsd.lpitch+b*2+1)^:=PBYTE(p+(line+a)*320+b)^;
  end;
 end;
{ for a:=0 to 400-1 do begin
  move(pointer(integer(p)+(line+a)*320)^,pointer(integer(ddsd.lpsurface)+a*ddsd.lpitch)^,320);
 end;                           }
 mainform.DXDraw.Surface.UnLock;
 mainform.DXDraw.Flip;

end;

procedure thend;
var allpics:pointer;
var a,b:word;
begin
 tloff;zm(har);zmcele(har);zmazcele;loadobrcele('data3\koniec');
 if soundis then begin stopsound;initsound(cfg,speed,'happyend.mod');end;
 movepal(paletta^);
 tmavcele;zobrazcele;
 obcele(0);pauza(4000);zmcele(0);zmazcele;
 set400mode;
 loadobrcele('ende\kon');
 movepal(paletta^);
 paleta;
 getmem(allpics,12*64000);
 if (allpics=nil) then endee('cannot allocate memory');
 fillchar(allpics^,64000*12,0);
 move(obrazok^,pointer(allpics+64000*2)^,64000);
 loadobrcele('ende\grat');
 move(obrazok^,pointer(allpics+64000*3)^,64000);
 loadobrcele('ende\grat1');
 move(obrazok^,pointer(allpics+64000*4)^,64000);
 loadobrcele('ende\dano1');
 move(obrazok^,pointer(allpics+64000*5)^,64000);
 loadobrcele('ende\vlado1');
 move(obrazok^,pointer(allpics+64000*6)^,64000);
 loadobrcele('ende\vlado2');
 move(obrazok^,pointer(allpics+64000*7)^,64000);
 loadobrcele('ende\jano');
 move(obrazok^,pointer(allpics+64000*8)^,64000);
 loadobrcele('ende\hoe');
 move(obrazok^,pointer(allpics+64000*9)^,64000);
 pauza(20);if keypressed then tloff;
 for a:=1-1 to 8-1 do begin
  for b:=1-1 to 200-1 do begin
   scroll(a*200+b,allpics);
  end;
  pauza(10000)
 end;
 freemem(allpics);
 zmcele(0);
 if soundis then begin if playing then stopsound;end;
 mainform.stop:=true;
 while true do sleep(1000);
end;

procedure endeee;
begin
 tloff;zm(har);zmcele(har);zmazcele;loadobrcele('data2\chytil');
 movepal(paletta^);
 tmavcele;zobrazcele;obcele(0);
 repeat stav;
 until (lave)or(prave)or(keypressed);
 if keypressed then
 begin kl:=ord(readkey);
  if kl=0 then kl:=ord(readkey);end;
 tloff;
 zmcele(0);zmazcele;
 loadobrcele('data2\cast2');
 if soundis then begin stopsound;initsound(cfg,speed,'music2-1.mod');end;
 movepal(paletta^);
 tmavcele;zobrazcele;obcele(0);
 pauza(1500);
 zmcele(0);zmazcele;
 move(palletspri,paletta^[631],138);paleta;nuluj;zobrazpred;
 izba:=1;cast:=2;loadroom('data2\posch1');
end;

procedure endee2;
begin
 tloff;zm(har);zmcele(har);zmazcele;loadobrcele('data3\taxikar');
 movepal(paletta^);
 tmavcele;zobrazcele;obcele(0);
 repeat stav;
 until (lave)or(prave)or(keypressed);
 if keypressed then
 begin kl:=ord(readkey);
  if kl=0 then kl:=ord(readkey);end;
 tloff;
 zmcele(0);zmazcele;
 loadobrcele('data3\cast3');
 if soundis then begin stopsound;initsound(cfg,speed,'music3-1.mod');end;
 movepal(paletta^);
 tmavcele;zobrazcele;obcele(0);
 pauza(1500);
 zmcele(0);zmazcele;
 move(palletspri,paletta^[631],138);paleta;nuluj;zobrazpred;
 izba:=1;cast:=3;loadroom('data3\vratnica');
end;

procedure setsound;
begin
  soundis:=mainform.soundis;
{ har:=4;
 assign(f,'utek.cfg');reset(f,1);close(f);
 if IOResult <> 0 then
 begin
  soundis:=false;
 end
 else
 begin
  a:=0;b:=0;
  assign(f,'utek.cfg');
  reset(f,1);blockread(f,a,1);blockread(f,b,1);
  close(f);
  if a=1 then soundis:=false else soundis:=true;
 end;
 if (memo<157000)and(soundis) then begin writeln;
  writeln('Malo pamati pre hudbu.');writeln;
  writeln('Potrebna pamat pre hudbu : 157000.');
  writeln('Volnej je len : ',memo);
  writeln('Nechat hudbu ? [A/N]');
  c:=ord(readkey);
  if upcase(chr(c))<>'A' then soundis:=false;
  if keypressed then begin kl:=ord(readkey);
  if kl=0 then kl:=ord(readkey);end;tloff;
 end;
 asm
  mov ax,3567h
  int 21h
  mov s,es
 end;
 move(mem[s:$a],predreal,8);prikaz:='';
 for c:=1 to 8 do prikaz:=prikaz+chr(predreal[c]);
 if (prikaz='EMMXXXX0')and(soundis) then begin writeln;
  writeln('EMS manager found. EMS => LOW MUSIC. Press something.');
  repeat stav;until (lave)or(prave)or keypressed;
  if keypressed then begin kl:=ord(readkey);
  if kl=0 then kl:=ord(readkey);end;tloff;b:=1;
 end;
 if soundis then
 begin
  if b=1 then speed:=8000;
  if b=2 then speed:=12000;
  if b=3 then speed:=16000;
  if b=4 then speed:=22000;
  if a=2 then cfg:=0;
  if a=3 then cfg:=1;
  if a=4 then cfg:=6;
 end;}
end;
end.
