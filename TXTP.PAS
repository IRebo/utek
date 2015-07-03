program hoepack;
uses crt;
type ras=array[0..65534] of byte;
var f,f2:file;
    size,sizes:word;
    a,a2:^ras;
    meno:string;
    p,p2:pointer;
    c,d:byte;
    e,ff:word;

procedure packuj(siz:word);
begin
 blockread(f2,a^,siz);
 ff:=0;
 e:=0;
 c:=0;
 while e<siz do
 begin
  if (a^[e]<>13)and((a^[e]<>$a)) then a2^[e]:=a^[e]+30 else a2^[e]:=a^[e];
  inc(e);
  inc(ff);
 end;
 blockwrite(f,a2^,ff);
end;

begin
 writeln('TXT-packer 1995 Ver 0.00.01');
 if paramstr(2)='' then begin writeln;
  writeln('Neboli zadane parametre: 1. Meno suboru na packovanie');
  writeln('                         2. Pripona buduceho suboru');
  writeln;halt(1);end;
 write('Packing...');
 getmem(p,65535);
 getmem(p2,65535);
 a:=p;
 a2:=p2;
 meno:=copy(paramstr(1),1,length(paramstr(1))-4);
 assign(f2,paramstr(1));
 reset(f2,1);
 assign(f,meno+'.'+paramstr(2));
 rewrite(f,1);
 size:=filesize(f2);
 repeat
  if size>64000 then
  begin
   size:=size-64000;
   sizes:=64000;
  end
  else sizes:=size;
  packuj(sizes);
 until size=sizes;
 close(f2);close(f);
 freemem(p,65535);freemem(p2,65535);
 writeln; writeln;
 writeln('Vela stastia a uspechov v DOSe.');
end.