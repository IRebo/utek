program hoedepack;
uses crt;
type ras=array[0..65534] of byte;

var f,f2:file;
    p,p2:pointer;
    a,a2:^ras;
    c,d:byte;
    meno:string;
    size,sizes:word;
    e,ff:word;

procedure depack(siz:word);
begin
 blockread(f2,a2^,siz);
 e:=0;
 ff:=0;
 while ff<size do
 begin
  if a2^[ff]=a2^[ff+1] then
  begin
   c:=a2^[ff];
   inc(ff);
   inc(ff);
   d:=a2^[ff];
   inc(ff);
   for d:=1 to d do
   begin
    a^[e]:=c;
    inc(e);
   end;
  end
  else
  begin
   a^[e]:=a2^[ff];
   inc(ff);
   inc(e);
  end;
 end;
 blockwrite(f,a^,e);
end;

begin
 writeln('beta-de-packer 1995 Ver 0.00.01');
 if paramstr(2)='' then begin writeln;
  writeln('Neboli zadane parametre: 1. Meno suboru na de-packovanie');
  writeln('                         2. Pripona buduceho suboru');
  writeln;halt(1);end;
 write('De-packing...');
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
  depack(sizes);
 until size=sizes;
 close(f2);close(f);
 freemem(p,65535);freemem(p2,65535);
 writeln; writeln;
 writeln('Vela stastia a uspechov v DOSe.');
end.