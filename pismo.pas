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
 ord('í') : begin for g:=0 to 6 do
    move(font^[1921+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('•')
  : begin for g:=0 to 6 do
    move(font^[1927+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('è')
  : begin for g:=0 to 6 do
    move(font^[1933+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('ê')
  : begin for g:=0 to 6 do
    move(font^[1939+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('ã')
  : begin for g:=0 to 6 do
    move(font^[1946+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,3);
   inc(e,4);
  goto kon;end;
 ord('ï')
  : begin for g:=0 to 6 do
    move(font^[1951+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('ó')
  : begin for g:=0 to 6 do
    move(font^[1957+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('ä')
  : begin for g:=0 to 6 do
    move(font^[1964+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,4);
   inc(e,5);
  goto kon;end;
 ord('ú')
  : begin for g:=0 to 6 do
    move(font^[1970+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,4);
   inc(e,5);
  goto kon;end;
 ord('õ')
  : begin for g:=0 to 6 do
    move(font^[1975+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('Ä')
  : begin for g:=0 to 6 do
    move(font^[1981+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('Ö')
  : begin for g:=0 to 6 do
    move(font^[1987+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('ù')
  : begin for g:=0 to 6 do
    move(font^[1993+g*320],pointer(ddsd.lpsurface+(g-2)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('~')
  : begin for g:=0 to 7 do
    move(font^[1679+g*320],pointer(ddsd.lpsurface+(g-3)*ddsd.lpitch+e)^,5);
   inc(e,6);
  goto kon;end;
 ord('Ü')
  : begin for g:=0 to 7 do
    move(font^[1684+g*320],pointer(ddsd.lpsurface+(g-3)*ddsd.lpitch+e)^,6);
   inc(e,7);
  goto kon;end;
 ord('é')
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

