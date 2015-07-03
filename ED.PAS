program editor;
uses crt,rutins;

type palett=array [1..768] of byte;
     typ1=array [1..64000] of byte;
     typ2=array [1..64786] of byte;
     fonttyp=array [1..10000] of byte;
     typstr=array [0..70] of string[20];
var f:file;
    myska:array [1..400] of byte;
    izba:byte;
    t:text;
    name,predmet:string[20];
    pred:array [0..70] of string[20];
    pred2:array [1..70] of byte;
    palb:array [1..768] of byte;
    predm:array [1..70] of boolean;
    fontpoi,tmppoi,map2poi,obrpoi,obr2poi,pallpoi,spritpoi,mappoi:pointer;
    newx,newy,olldx,olldy,dlz,dlzy:word;
    o,s:word;
    xr,yr,m,co:byte;
    kl,sc,farb:byte;
    temp:string[20];
    predme,inte:word;
    x2,y2,a,b,c,d,e:word;
    font:^fonttyp;
    tmp:^typ2;
    mapa:^typ1;
    mapa2:^typ1;
    obrazok:^typ1;
    obrazok2:^typ1;
    paletta:^palett;
    sprites:^typ1;

{$i pismo.pas}
procedure zmaz;
begin
 for a:=0 to 64000 do mem[$a000:a]:=0;
end;

procedure myson(kurz:byte);
label mensie,mensie2,loop;
begin
 o:=ofs(myska);
 s:=seg(myska);
 b:=y*320+x;
 asm
  mov e,19
  cmp y,180
  jl mensie
  mov ax,y
  inc ax
  mov bx,200
  sub bx,ax
  mov e,bx
 mensie:
  mov d,19
  cmp x,300
  jl mensie2
  mov ax,x
  inc ax
  mov bx,320
  sub bx,ax
  mov d,bx
 mensie2:
  mov ax,e
  mov xr,al     {e -> xr}
  mov ax,d      {d -> yr}
  mov yr,al
  mov di,o
  mov es,s
  mov si,b
  xor bh,bh
  mov bl,yr
  mov ax,319
  sub ax,bx
  xor bh,bh
  mov bl,19
  sub bl,yr
  mov cx,e
  inc cx
loop:
  push cx
  mov cl,yr
  inc cx
  push ds
  mov dx,$a000
  mov ds,dx
  rep movsb
  pop ds
  add si,ax
  add di,bx
  pop cx
  loop loop
 end;
 for a:=0 to e do for c:=0 to d do
  if sprites^[(a+1)*320+c+2+kurz*20]<>0 then
   mem[$a000:b+a*320+c]:=sprites^[2+(a+1)*320+c+kurz*20];
end;

procedure mysoff;
label loop1;
begin
 o:=ofs(myska);
 s:=seg(myska);
 asm
  push ds
  mov si,o
  mov ds,s
  mov ax,$a000
  mov es,ax
  mov di,b
  xor bh,bh
  mov bl,yr
  xor ch,ch
  mov cl,xr
  inc cl
  mov ax,319
  sub ax,bx
  xor bh,bh
  mov bl,19
  sub bl,yr
loop1:
  push cx
  mov cl,yr
  inc cx
  rep movsb
  add di,ax
  add si,bx
  pop cx
  loop loop1
  pop ds
 end;
end;

procedure tloff;
begin
 if (not keypressed)and(kl=1) then
 begin
  myson(0);
  repeat
   x2:=x;y2:=y;stav;
   if (x<>x2)or(y<>y2) then
   begin
    mysoff;
    myson(0);
   end;
  until (not lave)and(not stredne)and(not prave);
  mysoff;
 end;
 if keypressed then
  repeat readkey until not keypressed;
end;

procedure kurzor(kurz:byte);
begin
 kl:=1;
 stav;
 myson(kurz);
 repeat
  x2:=x;y2:=y;stav;
  if (x<>x2)or(y<>y2)or(keypressed) then
  begin
   mysoff;
   myson(kurz);
  end;
 until (prave)or(lave)or(Stredne)or(keypressed);
 mysoff;m:=255;
end;

procedure say(cis,cis2:word;sss:string);
begin
 tloff;
 pis(cis,cis2,'                                        ');
 pis(cis,cis2,sss);
 move(mem[$a000:190*320],obrazok^[190*320+1],7*320);
 kurzor(2);
 tloff;
 pis(cis,cis2,'                                        ');
end;

procedure paleta;
begin
 if sc=1 then
 begin o:=ofs(palb);s:=seg(palb);end
 else
 begin o:=ofs(paletta^);s:=seg(paletta^);end;
 asm
  mov dx,o
  mov es,s
  mov ah,10h
  mov al,12h
  mov bx,0
  mov cx,256
  int 10h
 end;
end;

procedure zobraz;
begin
 if sc=0 then move(obrazok^,mem[$a000:0],64000);
 if sc=1 then move(obrazok2^,mem[$a000:0],64000);
end;

procedure scrswap;
begin
 tloff;if sc=1 then sc:=0 else sc:=1;
end;

procedure depack(siz:word;var pop:pointer);
var o,s,o2,s2:word;
    pa:^typ1;
label loop,ne,no,jump;
begin
 pa:=pop;o:=ofs(pop^);s:=seg(pop^);o2:=ofs(tmp^);s2:=seg(tmp^);
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
 end;
end;

procedure boxdo;
label iii;
begin
 stav;
 olldx:=x;
 olldy:=y;
 tloff;
 dlz:=0;
 dlzy:=0;
 repeat
  x2:=x;
  y2:=y;
  stav;
  if x<olldx then
  begin
   umiestni(olldx*8,y*8);x:=olldx;
  end;
  if y<olldy then
  begin
   umiestni(x*8,olldy*8);y:=olldy;
  end;
  if (x<>x2)or(y<>y2) then
  begin
   if sc=0 then
   begin
    for a:=0 to dlz do
    begin
     mem[$a000:a+olldy*320+olldx]:=obrazok^[a+olldy*320+olldx+1];
     mem[$a000:a+y2*320+olldx]:=obrazok^[a+y2*320+olldx+1];
    end;
    for a:=0 to dlzy do
    begin
     mem[$a000:a*320+olldy*320+olldx]:=obrazok^[a*320+olldy*320+olldx+1];
     mem[$a000:a*320+olldy*320+x2]:=obrazok^[a*320+olldy*320+x2+1];
    end;
   end else
   begin
    for a:=0 to dlz do
    begin
     mem[$a000:a+olldy*320+olldx]:=obrazok2^[a+olldy*320+olldx+1];
     mem[$a000:a+y2*320+olldx]:=obrazok2^[a+y2*320+olldx+1];
    end;
    for a:=0 to dlzy do
    begin
     mem[$a000:a*320+olldy*320+olldx]:=obrazok2^[a*320+olldy*320+olldx+1];
     mem[$a000:a*320+olldy*320+x2]:=obrazok2^[a*320+olldy*320+x2+1];
    end;
   end;
   mysoff;
   myson(0);
   dlzy:=y-olldy;
   dlz:=x-olldx;
   for a:=0 to dlz do
   begin
    mem[$a000:a+olldy*320+olldx]:=253;
     mem[$a000:a+y*320+olldx]:=253;
   end;
   for a:=0 to dlzy do
   begin
    mem[$a000:a*320+olldy*320+olldx]:=253;
    mem[$a000:a*320+olldy*320+x]:=253;
   end;
  end;
  if prave then
  begin
   zobraz;
   goto iii;
  end;
 until lave;
 iii:
 mysoff;
end;

procedure boxmake;
begin
 boxdo;
 if not prave then
 begin
  newx:=x;
  newy:=y;
  for a:=0 to newy-olldy do
   for b:=0 to newx-olldx do
    obrazok2^[olldx+b+olldy*320+a*320+1]:=co;
 end;
 tloff;
 zobraz;
end;

procedure new;
begin
 if co<>0 then palb[co*3+1]:=27 else palb[co*3+1]:=0;
 paleta;
 pis(2,1,'COLOR : ');
 gotoxy(7,1);
 readln(predmet);
 val(predmet,co,inte);
 palb[co*3+1]:=63;
 paleta;
 zobraz;
end;

procedure loadroom(meno:string);
begin
a:=0;
assign(f,meno+'.nnp');
reset(f,1);
blockread(f,obrazok^,filesize(f));
depack(filesize(f),obrpoi);
close(f);
move(tmp^[19],paletta^,768);
move(tmp^[787],obrazok^,64000);
for a:=1 to 768 do paletta^[a]:=paletta^[a] div 4;
for a:=0 to 255 do
begin
 o:=paletta^[a*3+3];
 paletta^[a*3+3]:=paletta^[a*3+1];
 paletta^[a*3+1]:=o;
end;
move(palb[768-46*3+3],paletta^[768-46*3+3],46*3);
paleta;
zobraz;
end;

procedure memory;
begin
 getmem(tmppoi,64786);
 getmem(obrpoi,64000);
 getmem(obr2poi,64000);
 getmem(spritpoi,64000);
 getmem(mappoi,64000);
 getmem(map2poi,64000);
 getmem(pallpoi,6400);
 getmem(fontpoi,10000);
 font:=fontpoi;
 tmp:=tmppoi;
 mapa:=mappoi;
 mapa2:=map2poi;
 paletta:=pallpoi;
 sprites:=spritpoi;
 obrazok:=obrpoi;
 obrazok2:=obr2poi;
end;

procedure uvod;
begin
 assign(f,'font.nnp');
 reset(f,1);
 blockread(f,obrazok^,filesize(f));
 depack(filesize(f),obrpoi);
 close(f);
 move(tmp^[787],font^,10000);
end;

procedure loadfirst;
begin
 a:=0;
 assign(f,'sprites.nnp');
 reset(f,1);
 blockread(f,sprites^,filesize(f));
 depack(filesize(f),spritpoi);
 close(f);
 move(tmp^[19],palb,768);
 move(tmp^[787],sprites^,64000);

 for a:=1 to 768 do palb[a]:=palb[a] div 4;
 for a:=0 to 255 do
 begin
  o:=palb[a*3+3];
  palb[a*3+3]:=palb[a*3+1];
  palb[a*3+1]:=o;
 end;
 move(palb,paletta^,768);
end;
{-----------Hlavny program----------------------}

begin
 writeln('maps game editor Ver. 0.00.01');
 writeln;
 if paramstr(1)='' then
 begin
  writeln('Parameter : Meno izby (aj s .xxx)');
  halt(1);
 end;
 name:=paramstr(1);
 predmet:=paramstr(1);
 if name[length(name)-3]='.' then
 begin
  name:='';
  for a:=1 to length(predmet)-4 do
  name:=name+predmet[a];
 end;
predmet:='';
predme:=0;
writeln('Loading ...');
for a:=1 to 11 do predm[a]:=false;
izba:=1;
sc:=0;
co:=1;
memory;
uvod;
loadfirst;
asminit;
loadroom(name);
umiestni(1,1);
{$i-}
assign(f,name+'.nnn');
reset(f,1);
close(f);
if IOResult<> 0 then
begin
 for a:=1 to 64000 do
  obrazok2^[a]:=0;
end
else
begin
 assign(f,name+'.nnn');
 reset(f,1);
  blockread(f,obrazok2^,64000);
 close(f);
end;
{$i+}
for a:=1 to 4 do palb[a]:=0;
for a:=4 to 768-46*3 do palb[a]:=27;
move(palb[768-46*3+3],mapa2^[768-46*3+3],46*3);
palb[co*3+1]:=255;

repeat
 kurzor(0);
 if keypressed then
 begin
  kl:=ord(readkey);
  if kl=0 then kl:=ord(readkey);
 if kl=ord('x') then
 begin
  for a:=1 to 64000 do
   obrazok2^[a]:=0;
  zobraz;
 end;
 if kl=ord('l') then
 begin
 {$i-}
 assign(f,name+'.nnn');
 reset(f,1);
 close(f);
 if IOResult<> 0 then
 begin
  for a:=1 to 64000 do
   obrazok2^[a]:=0;
 end
 else
 begin
  assign(f,name+'.nnn');
  reset(f,1);
   blockread(f,obrazok2^,64000);
  close(f);
 end;
 {$i+}
 zobraz;
 end;
 if kl=27 then stredne:=true;
 if kl=ord('+') then
 begin
  if co<>0 then palb[co*3+1]:=27 else palb[co*3+1]:=0;
  paleta;
  if co=255 then co:=254;
  inc(co);
  palb[co*3+1]:=63;
  paleta;
  zobraz;
 end;
 if kl=ord('-') then
 begin
  if co<>0 then palb[co*3+1]:=27 else palb[co*3+1]:=0;
  paleta;
  if co=0 then co:=1;
  dec(co);
  palb[co*3+1]:=63;
  paleta;
  zobraz;
 end;
 if kl=ord('n') then new;
 if kl=ord('s') then
 begin
 assign(f,name+'.nnn');
 rewrite(f,1);
  blockwrite(f,obrazok2^,64000);
 close(f);
 zobraz;
 end;
 if (kl=ord('a'))and(sc=0) then
 begin
  kurzor(2);
  boxdo;
  newx:=x;
  newy:=y;
  assign(f,name+'.spr');
  rewrite(f,1);
  blockwrite(f,olldx,2);
  blockwrite(f,olldy,2);
  a:=(newy-olldy+1);
  blockwrite(f,a,2);
  a:=(newx-olldx+1);
  blockwrite(f,a,2);
  for a:=0 to newy-olldy do
   blockwrite(f,obrazok^[olldx+olldy*320+a*320+1],newx-olldx+1);
  for a:=0 to newy-olldy do
   blockwrite(f,obrazok2^[olldx+olldy*320+a*320+1],newx-olldx+1);
  close(f);
  zobraz;
  tloff;
 end;
 end;
 if lave then boxmake;
 if prave then
 begin
  scrswap;
  zmaz;
  paleta;
  zobraz;
 end;
 kl:=1;
 until Stredne;
 asm
  mov ax,03h
  int 10h
 end;
 write('Save A/N :');
 kl:=ord(readkey);
 if upcase(chr(kl))='A' then
 begin
  assign(f,name+'.nnn');
  rewrite(f,1);
  blockwrite(f,obrazok2^,64000);
  close(f);
 end;
 writeln;
 freemem(tmppoi,64786);
 freemem(spritpoi,6400);
 freemem(obrpoi,64000);
 freemem(obr2poi,64000);
 freemem(pallpoi,64000);
 freemem(mappoi,64000);
 freemem(map2poi,64000);
 freemem(fontpoi,10000);
end.