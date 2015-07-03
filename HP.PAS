program hoepack;
uses crt;
type ras=array[0..65534] of byte;
var f,f2:file;
    size,sizes:word;
    meno:string;
    a,a2:^ras;
    p,p2:pointer;
    c,d:byte;
    e,ff:word;

procedure zisti;
begin
  d:=a^[e];
  c:=1;
  inc(e);
  while (c<255)and(e<sizes)and(a^[e]=d) do
  begin
   inc(c);
   inc(e);
  end;
end;

procedure packuj(siz:word);
begin
 blockread(f2,a^,siz);
 ff:=0;
 e:=0;
 c:=0;
 while e<siz do
 begin
  zisti;
  if c=1 then
  begin
   a2^[ff]:=d;
   inc(ff);
  end
  else
  begin
   a2^[ff]:=d;
   inc(ff);
   a2^[ff]:=d;
   inc(ff);
   a2^[ff]:=c;
   inc(ff);
  end;
 end;
 blockwrite(f,a2^,ff);
end;

begin
 writeln('packer 1995 Ver 0.00.01');
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
  if size>65535 then
  begin
   size:=size-65535;
   sizes:=65535;
  end
  else sizes:=size;
  packuj(sizes);
 until size=sizes;
 close(f2);close(f);
 freemem(p,65535);freemem(p2,65535);
 writeln; writeln;
 writeln('Vela stastia a uspechov v DOSe.');
end.