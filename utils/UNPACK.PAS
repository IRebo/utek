uses crt;
type ras=array[0..65534] of byte;

var f,f2:file;
    p,p2:pointer;
    a,a2:^ras;
    c,d:byte;
    size,sizes:longint;
    e,ff:longint;

procedure depack(siz:longint);
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
 getmem(p,65535);
 getmem(p2,65535);
 a:=p;
 a2:=p2;
 assign(f2,paramstr(1));
 reset(f2,1);
 assign(f,paramstr(2));
 rewrite(f,1);
 size:=filesize(f2);
 repeat
  if size>64000 then
  begin
   size:=size-64000;
   sizes:=64000;
  end
  else sizes:=size;
  depack(sizes);
 until size=sizes;
 close(f2);
 close(f);
 freemem(p,65535);
 freemem(p2,65535);
end.