{$i-}
program nastavenie;
{$M $4000,0,0 }
uses crt,dos;
var  f,f1:file;
     kl:char;
     a,b,c:byte;
     r:registers;
label iov;

procedure hc;
begin
    r.ah:=1;
    r.ch:=$20;
    intr($10,r);
end;
procedure sc;
begin
    r.ah:=1;
    r.ch:=3;
    r.cl:=4;
    intr($10,r);
end;

begin
 clrscr;
 textcolor(15);textbackground(1);
 hc;
 write('ษอออออ F1-Create help !!! อออออออออออออออออออออออออออออออออออออออออออออออออออออป');
 for a:=1 to 22 do begin write('บ                                                                              บ'); end;
 write('ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');
 textcolor(lightblue);
 gotoxy(21,12);
 writeln(' ÛÛÛÛ            ÛÛ');gotoxy(21,13);
 writeln('ÛÛ   Û           ÛÛ');gotoxy(21,14);
 writeln('ÛÛ       ÛÛÛÛ   ÛÛÛÛ   ÛÛ  ÛÛ  ÛÛÛÛÛ');gotoxy(21,15);
 writeln(' ÛÛ     ÛÛ  ÛÛ   ÛÛ    ÛÛ  ÛÛ  ÛÛ  ÛÛ');gotoxy(21,16);
 writeln('  ÛÛ    ÛÛ  ÛÛ   ÛÛ    ÛÛ  ÛÛ  ÛÛ  ÛÛ');gotoxy(21,17);
 writeln('   ÛÛ   ÛÛÛÛÛ    ÛÛ    ÛÛ  ÛÛ  ÛÛ  ÛÛ');gotoxy(21,18);
 writeln('    ÛÛ  ÛÛ       ÛÛ    ÛÛ  ÛÛ  ÛÛ  ÛÛ');gotoxy(21,19);
 writeln('Û   ÛÛ  ÛÛ   Û   ÛÛ    ÛÛ  ÛÛ  ÛÛ  ÛÛ');gotoxy(21,20);
 writeln(' ÛÛÛÛ    ÛÛÛÛ    ÛÛ     ÛÛÛÛÛ  ÛÛÛÛÛ');gotoxy(21,21);
 writeln('                               ÛÛ');gotoxy(21,22);
 writeln('                               ÛÛ');
 textcolor(15);textbackground(1);
 assign(f,'utek.cfg');
 reset(f,1);
 close(f);
 if IOResult <> 0 then
 begin
 a:=1;
 b:=1;
 c:=1;
 end else
 begin
  assign(f,'utek.cfg');
  reset(f,1);
  blockread(f,a,1);
  blockread(f,b,1);
  c:=1;
  close(f);
 end;
 gotoxy(12,3);
 write('Zvukova karta :');
 gotoxy(15,5);
 write('Ziadna');
 gotoxy(15,6);
 write('PC Speaker');
 gotoxy(15,7);
 write('Covox (D/A prevodnik)');
 gotoxy(15,8);
 write('Sound Blaster');

 gotoxy(50,3);
 write('Kvalita zvuku :');
 gotoxy(53,5);
 write('Slaba');
 gotoxy(53,6);
 write('Dobra');
 gotoxy(53,7);
 write('Velmi dobra');
 gotoxy(53,8);
 write('Vyborna');

 textbackground(7);
 gotoxy(12,3);
 write('Zvukova karta :');

 iov:
 textcolor(15);
 textbackground(1);
 gotoxy(50,4+b);
 write(chr($10));
 gotoxy(12,4+a);
 write(chr($10));
 gotoxy(2,10);
 write('                                                                  ');
 kl:=readkey;
 if ord(kl)=0 then
 begin
  textbackground(1);
  kl:=readkey;
  if ord(kl)=72 then
  begin
   if c=1 then
   begin
    gotoxy(12,4+a);
    write(' ');
    if a=1 then a:=4 else
    dec(a);
   end;
   if c=2 then
   begin
    gotoxy(50,4+b);
    write(' ');
    if b=1 then b:=4 else
    dec(b);
   end;
  end;
  if ord(kl)=80 then
  begin
   if c=1 then
   begin
    gotoxy(12,4+a);
    write(' ');
    if a=4 then a:=1 else
    inc(a);
   end;
   if c=2 then
   begin
    gotoxy(50,4+b);
    write(' ');
    if b=4 then b:=1 else
    inc(b);
   end;
  end;
  if ord(kl)=77 then
  begin
   if c=1 then c:=2 else c:=1;
   if c=2 then
   begin
    gotoxy(12,3);
    write('Zvukova karta :');
    textbackground(7);
    gotoxy(50,3);
    write('Kvalita zvuku :');
   end;
   if c=1 then
   begin
    gotoxy(50,3);
    write('Kvalita zvuku :');
    textbackground(7);
    gotoxy(12,3);
    write('Zvukova karta :');
   end;
  end;
  if ord(kl)=75 then
  begin
   if c=2 then c:=1
   else c:=2;
   if c=2 then
   begin
    gotoxy(12,3);
    write('Zvukova karta :');
    textbackground(7);
    gotoxy(50,3);
    write('Kvalita zvuku :');
   end;
   if c=1 then
   begin
    gotoxy(50,3);
    write('Kvalita zvuku :');
    textbackground(7);
    gotoxy(12,3);
    write('Zvukova karta :');
   end;
  end;
  if ord(kl)=59 then
  begin
   textbackground(7);
   gotoxy(26,10);
   write('Formating : Please wait ...');delay(900);
   gotoxy(16,10);
   write('Help - Sipkamy nastav co chces a stlac ENTER.');
   textbackground(1);
   kl:=readkey;
   if ord(kl)=0 then readkey;
  end;
  goto iov;
 end;
 if kl=#27 then
 begin
  textcolor(7);textbackground(0);sc;clrscr;textcolor(lightred);
  writeln('Konfiguracia nebola zapisana !!!');
  sound(2000);delay(100);nosound;textcolor(7);
  halt(1);
 end;
 if kl<>#13 then
 begin
  goto iov;
 end;
 textcolor(7);
 textbackground(0);
 sc;
 clrscr;
 assign(f,'utek.cfg');
 rewrite(f,1);
 close(f);
 if ioresult<>0 then
 begin
  sound(2990);
  delay(100);
  nosound;
  writeln('Error 875467:355 Skus prist na to kde je chyba !');
  readkey;
  halt(1);
 end;
 assign(f,'utek.cfg');
 reset(f,1);
 blockwrite(f,a,1);
 blockwrite(f,b,1);
 close(f);
 if ioresult<>0 then
 begin
  sound(2990);
  delay(100);
  nosound;
  writeln('Error 45745:4538. Skus prist na to kde je chyba !');
  readkey;
  halt(1);
 end;
 writeln('Konfiguracia zapisana.');
end.