{skontrolovat menu svetlo v kabinete}

var f:TFakeFile;
    kabinet,co:byte;
    reg,neber,telcis:string[20];
var a,b:word;

procedure kabload;
var a,b,c:word;
    str:string;
begin
 win:=false;
 zm(har);zmaz;
 loadobr('data\kabinet');
 assign(f,'data\kabinet.nnm');reset(f,1);
 blockread(f,mapa^,filesize(f));
 depack(filesize(f),mappoi);close(f);
 move(tmp^,mapa^,49600);
 tassign(t,'data\kabinet.nnt');
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
 tmav;zobraz;kabsvetlo;
end;

procedure loadroomcele(meno:string);
var a,b,c:word;
    str:string;
begin
 win:=false;
 zmcele(har);zmazcele;
 loadobrcele(meno);
 move(palletspri,paletta^[631],138);
 assign(f,meno+'.nnm');reset(f,1);
 blockread(f,mapa^,filesize(f));
 depack(filesize(f),mappoi);close(f);
 move(tmp^,mapa^,64000);
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
 tmavcele;zobrazcele;obcele(har);
end;

procedure klavesa;
begin
 pauza(6700);
end;

procedure zmazfont;
begin
 pis(165,1,'                                                      ');
 pis(174,1,'                                                      ');
 pis(183,1,'                                                      ');
 pis(192,1,'                                                      ');
end;

procedure intro;
label endintro;
begin
 zmcele(har);
 zmazcele;
 if soundis then begin
 stopsound;initsound(cfg,speed,'uvod.mod');end;
 loadobrcele('uvod\uvod1');move(palletspri,paletta^[631],138);
 movepal(paletta^);
 tmavcele;
 zobrazcele;
 ob(0);
 pis(165,1,'        JE 31. JóN. VõETCI Só Uí NETRPEZLIVù.');
 pis(174,1,' V TRIEDE 3.B. SA MARTINKA ROZPRèVA S PRIATEúKAMI :');
 pis(183,1,'"NO TAK POÖ Uí ! P~JDEME EõTE DO CUKROõKY ?"');
 pis(192,1,'"JA NEM~íEM, IDEME NA VùLET A EõTE NIE SOM POBALENè."');
 mainform.DXDraw.Flip;
 obfont(0);
 klavesa;if kl=27 then goto endintro;
 zmfont(0);zmazfont;
 pis(165,1,'"TAK SA MAJ. MY IDEME. PRãJEMNê PRèZDNINY !"');
 pis(174,1,'"AJ TEBE."');
 pis(183,1,'MARTINKA SA OTOÄILA A CHCELA SA ROZBEHNóÜ DOMOV,');
 pis(192,1,'KEÖ TU ZRAZU PRED •OU ZASTAVILO DLHê ÄIERNE AUTO.');
 mainform.DXDraw.Flip;
 obfont(0);
 klavesa;if kl=27 then goto endintro;
 zmfont(0);zmazfont;
 pis(165,1,'"AHOJ MARTINKA !", OZVAL SA HRUBù HLAS.');
 pis(174,1,'"DOBRù DE•."');
 pis(183,1,'"JA SOM KAMARèT TVOJHO OTECKA A IDEM S VAMI NA CHATU."');
 pis(192,1,'"AHA, TO STE VY ? OTEC VèS Uí SPOMãNAL."');
 mainform.DXDraw.Flip;
 obfont(0);
 klavesa;if kl=27 then goto endintro;
 zmfont(0);zmazfont;
 pis(165,1,'"MèM ÜA ODVIEZÜ DOMOV. AUTOM JE TO RùCHLEJõIE."');
 pis(174,1,'"DOBRE, TAK TEDA IDEM."');
 pis(183,1,'"SADNI SI SEM. HEJ ! JANO ! DUPNI NA TO. MèME JU."');
 mainform.DXDraw.Flip;
 obfont(0);klavesa;if kl=27 then goto endintro;
 zmfont(0);zmcele(0);zmazcele;
 loadobrcele('uvod\uvod2');move(palletspri,paletta^[631],138);
 movepal(paletta^);
 zobrazcele;
 tmavcele;ob(0);
 zmfont(0);
 pis(165,1,'PO CHVãLI CESTOVANIA :');
 pis(174,1,'"PUSTITE MA ! HEJ ! ÄO MI ROBãTE. Aóóóóó."');
 pis(183,1,'"TAK, A JE TO V SUCHU. BUDE SPAÜ ASPO• 4 HODINY."');
 pis(192,1,'"AK P~JDEME RùCHLO, STIHNEME TO."');
 mainform.DXDraw.Flip;
 obfont(0);
 klavesa;if kl=27 then goto endintro;
 zmfont(0);zmazfont;
 pis(165,1,'PO TROCH HODINèCH RùCHLEJ CESTY :');
 pis(174,1,'"SME NA MIESTE, õêFE."');
 pis(183,1,'"O.K. VYSTóP A ZOBER JU HORE."');
 mainform.DXDraw.Flip;
 obfont(0);
 klavesa;if kl=27 then goto endintro;
 zmfont(0);zmcele(0);zmazcele;
 loadobrcele('uvod\uvod3');move(palletspri,paletta^[631],138);
 movepal((paletta^));
 zobrazcele;
 tmavcele;ob(0);
 zmfont(0);
 pis(165,1,'O HODINU NESK~R SA MARTINKA PREBRALA A ZISTILA,');
 pis(174,1,'íE NIE JE DOMA. ZRAZU PRIõIEL OTCOV óDAJNù PRIATEú.');
 pis(183,1,'"KDE Só OTEC A MAMA ?"');
 pis(192,1,'"PRãDU ZA CHVãúU. POZERAJ SA NA TELKU."');
 mainform.DXDraw.Flip;
 obfont(0);klavesa;if kl=27 then goto endintro;
 zmfont(0);zmazfont;
 pis(165,1,'TAK SI TEDA PUSTILA TELKU A POZERALA SA Aí KùM JU');
 pis(174,1,'NEPRERUõILO ZVONENIE TELEFïNU.');
 pis(183,1,'"TU JE PROFESOR NEMEHLO. MèTE TO DIEVÄA ?"');
 pis(192,1,'"èNO, POZAJTRA JU PRIVEZIEME. KAMIL, VYBER TEN RUM !"');
 mainform.DXDraw.Flip;
 obfont(0);klavesa;if kl=27 then goto endintro;
 zmfont(0);zmazfont;
 pis(165,1,'MARTINKA SI SADLA A ZAMYSLELA SA.');
 pis(174,1,'"TAKíE MèM CELê DVA DNI NA óTEK."');
 pis(183,1,'');
 pis(192,1,'PODARã SA JEJ DOSTAÜ S PAZóROV PROFESORA ???');
 mainform.DXDraw.Flip;
 obfont(0);klavesa;kl:=1;tloff;
 endintro:zmcele(0);
 if soundis then begin stopsound;initsound(cfg,speed,'title.mod');end;
 move(palletspri,paletta^[631],138);
 loadroomcele('code\uvod');umiestni(160,142);
end;

procedure memory;
begin
 getmem(tmppoi,64786);getmem(obrpoi,64000);getmem(spritpoi,64000);
 getmem(mappoi,64000);getmem(pallpoi,6400);

 getmem(strpoi,sizeof(strings^));
 getmem(fontpoi,10000);
 font:=fontpoi;tmp:=tmppoi;mapa:=mappoi;
 paletta:=pallpoi;sprites:=spritpoi;obrazok:=obrpoi;strings:=strpoi;
end;

procedure loadsave(cislo:char);
var pomoc:byte;
f:tfakefile;
a:word;
begin
  assign(f,'saves\save'+cislo+'.sav');
  reset(f,1);
  seek(f,14);
  blockread(f,pomoc,1);
  izba:=pomoc-34;
  blockread(f,pomoc,1);
  cast:=pomoc-36;
  blockread(f,pomoc,1);
  kabinet:=pomoc-38;
  blockread(f,predreal,40);
  for a:=1 to 40 do
  begin if predreal[a]-a-70=14 then predm[a]:=true else
   if predreal[a]-a-70=4 then predm[a]:=false;end;
  blockread(f,predreal,40);
  for a:=1 to 40 do
  begin if predreal[a]-a-70=14 then predmal[a]:=true else
   if predreal[a]-a-70=4 then predmal[a]:=false;end;
  close(f);
end;

procedure save(cislo:char;name2:string);
var by,pomoc:byte;
 a:word;
begin
 {assign(f,'saves\save'+cislo+'.sav');
 rewrite(f,1);
 close(f);
 assign(f,'saves\save'+cislo+'.sav');reset(f,1);
 for a:=1 to length(name2) do
 begin by:=ord(name2[a])+60+a;
 blockwrite(f,by,1);
 end;
 for a:=length(name2)+1 to 14 do
 begin by:=$20+60+a;
 blockwrite(f,by,1);
 end;
 pomoc:=izba+34;
 blockwrite(f,pomoc,1);
 pomoc:=cast+36;
 blockwrite(f,pomoc,1);
 pomoc:=kabinet+38;
 blockwrite(f,pomoc,1);
 for a:=1 to 40 do
 begin if predm[a] then predreal[a]:=a+70+14 else predreal[a]:=a+70+4; end;
 blockwrite(f,predreal,40);
 for a:=1 to 40 do
 begin if predmal[a] then predreal[a]:=a+70+14 else predreal[a]:=a+70+4; end;
 blockwrite(f,predreal,40);
 close(f); }
end;

procedure loadsav;
var cisl:string;
    name2:array [0..9] of string[20];
    cis:char;
 a,b,c:word;
    sejvy:array [0..9] of boolean;
    ddsd:tddsurfacedesc;
    f:file;
begin
{ if (not DirectoryExistsUTF8('saves') ) then begin
  MkDir('saves');
 end;
 for a:=0 to 9 do sejvy[a]:=false;
 pisat:=false;
 loadspr('code\load');zobraz;a:=0;
 repeat
 str(a,cisl);
 name2[a]:='';
 if (FileExistsUTF8('saves\save'+cisl+'.sav') ) then
  sejvy[a]:=true;
 if sejvy[a] then begin
  assign(f,'saves\save'+cisl+'.sav');
  reset(f,1);
  for c:=1 to 14 do
  begin
   blockread(f,b,1);
   name2[a]:=name2[a]+chr(b-60-c);
  end;
  close(f);
 end;
 inc(a);
 until a=10;

 for a:=0 to 9 do begin
  pis(19+12*(a+1),118,name2[a]);
  mainform.DXDraw.Surface.Lock(PRect(nil)^,ddsd);
  for b:=0 to 8 do
//   move(mem[$a000:(17+12*(a+1))*320+118+b*320],obrazok^[(17+12*(a+1))*320+119+b*320],14*6);
   move(pointer(ddsd.lpsurface+118+((a+1)*12+17+b)*ddsd.lpitch)^,obrazok^[(17+12*(a+1))*320+119+b*320],14*6);
  mainform.DXDraw.Surface.UnLock;
 end;
 mainform.DXDraw.Flip;

 repeat
 kurzor(0);
 if prave then kl:=27;
 if lave then kl:=13;
 tl(0);
 b:=mapa^[x+y*320+1];
 until (kl=27)or((b>=232)and(b<=241)and(sejvy[b-232])and(kl=13));
 if kl<>27 then begin
 str(b-232,cisl);
 cis:=cisl[1];
 if cisl='10' then cis:='0';
 loadsave(cis);
 end;
 closewin;zobraz;
 pisat:=true;      }
end;

procedure savesav;
var cisl:string;
    meno:string[14];
    name2:array [0..9] of string[20];
    kolke:byte;
    cis:char;
    sejvy:array [0..9] of boolean;
    ddsd:tddsurfacedesc;
 a,b,c:byte;
begin
 if (not DirectoryExists('saves') { *Converted from DirectoryExists* }) then
 begin
  MkDir('saves');
 end;

 for a:=0 to 9 do sejvy[a]:=false;

 pisat:=false;
 loadspr('code\save');zobraz;a:=0;

 repeat
 str(a,cisl);
 name2[a]:='';
 if (FileExists('saves\save'+cisl+'.sav') { *Converted from FileExists* }) then
  sejvy[a]:=true;

 if sejvy[a] then begin
  assign(f,'saves\save'+cisl+'.sav');
  reset(f,1);
  for c:=1 to 14 do
  begin
       blockread(f,b,1);
       name2[a]:=name2[a]+chr(b-60-c);
  end;
  close(f);
 end;
 inc(a);
 until a=10;

 for a:=0 to 9 do begin
  pis(19+12*(a+1),118,name2[a]);
  mainform.DXDraw.Surface.Lock(PRect(nil)^,ddsd);
  for b:=0 to 8 do
//   move(mem[$a000:(17+12*(a+1))*320+118+b*320],obrazok^[(17+12*(a+1))*320+119+b*320],14*6);
   move(pointer(ddsd.lpsurface+118+((a+1)*12+17+b)*ddsd.lpitch)^,obrazok^[(17+12*(a+1))*320+119+b*320],14*6);
  mainform.DXDraw.Surface.UnLock;
 end;
 mainform.DXDraw.Flip;
 repeat kurzor(0);
 if prave then kl:=27;if lave then kl:=13;tl(0);b:=mapa^[x+y*320+1];
 until (kl=27)or((b>=232)and(b<=241)and(kl=13));
 if kl<>27 then begin
 str(b-232,cisl);kolke:=b-232;cis:=cisl[1];if cisl='10' then cis:='0';
 meno:='';pis(19+12*(kolke+1),118,'              ');
 mainform.dxdraw.flip;
 repeat
  while not keypressed do sleep(100);
  kl:=ord(readkey);
  if (upcase(chr(kl))>='A')and(upcase(chr(kl))<='Z')and(length(meno)<14) then
   meno:=meno+upcase(chr(kl));
  if (upcase(chr(kl))>='0')and(upcase(chr(kl))<='9')and(length(meno)<14) then
   meno:=meno+chr(kl);
  if (kl=8)and(length(meno)>0) then meno[0]:=chr(length(meno)-1);
  if (kl=32)and(length(meno)<14) then meno:=meno+' ';
  pis(19+12*(kolke+1),118,'              ');
  pis(19+12*(kolke+1),118,meno);
  mainform.dxdraw.flip;
 until ((kl=13)and(length(meno)<>0)and(length(meno)<>15))or(kl=27);
 if kl=13 then save(cis,meno);
 end;
 closewin;zobraz;
 if kl<>27 then say(192,9,'O.K. GAME SAVED !');
 pisat:=true;
end;

procedure uvodd;
begin
 move(palletspri,paletta^[631],138);
 loadroomcele('code\uvod');
 pisat:=false;
 repeat
  kurzor(0);
  if (lave)or(kl=13) then
  begin
   if mapa^[x+y*320+1]<>0 then predmet:=strings^[mapa^[x+y*320+1]]
    else predmet:='';tl(0);
   if predmet=chr(3) then intro;
   if predmet=chr(2) then begin
    umiestni(160,80);zmcele(har);
    zmazcelemapa(mapa^);
    zmazcelemapa(obrazok^);
    zobrazcele;zobrazpred;obcele(har);loadsav;
    if kl<>13 then begin loadroomcele('code\uvod');
    umiestni(160,142);end;pisat:=false;
   end;
   if predmet=chr(4) then ende;
  end else begin if kl=27 then ende;
   if prave then tl(0);end;
 until (predmet=chr(1))or((predmet=chr(2))and(kl=13));
 if predmet<>chr(2) then
 begin
  loadobrcele('data\cast1');nuluj;cast:=1;izba:=1;kabinet:=3;
  zmcele(har);zmazcele;
  movepal((paletta^));
  tmavcele;zobrazcele;obcele(0);
  pauza(1500);
  zmcele(0);zmazcele;
 end;
 pisat:=true;
end;

procedure uvod;
begin
 if soundis then
 begin
  initsound(cfg,speed,'title.mod');
 end;
 loadobrcele('code\present');
 logw('1');
 movepal(paletta^);
 logw('2');
 tmavcele;
  logw('3');

 zobrazcele;
  logw('4');

 obcele(har);
  logw('5');

 a:=0;

 pauza(3500);
 if kl=27 then ende;
 tloff;zmcele(har);
 move(palletspri,paletta^[631],138);
 loadobrcele('code\uvadza');
 movepal(paletta^);
 tmavcele;
 zobrazcele;obcele(har);
 pauza(2000);
 if kl=27 then ende;
 tloff;
 uvodd;
end;


procedure loadfirst;
var a,b,c:word;
 str:string;
begin
 for a:=0 to 255 do strings^[a]:='';
 assign(f,'code\sprites.nnp');reset(f,1);
 blockread(f,sprites^,filesize(f));
 depack(filesize(f),spritpoi);
 close(f);
 move(tmp^[19+630],palletspri,138);
 move(tmp^[787],sprites^,64000);
// for a:=1 to 138 do palletspri[a]:=palletspri[a] div 4;
 for a:=0 to 45 do begin
  o:=palletspri[a*3+3];palletspri[a*3+3]:=palletspri[a*3+1];
  palletspri[a*3+1]:=o;
 end;
 assign(f,'code\sprites.nnm');reset(f,1);
 blockread(f,obrazok^,filesize(f));
 depack(filesize(f),obrpoi);close(f);
 move(tmp^[155*320],sprites^[110*320],45*320);
 tassign(t,'code\sprites.nnt');treset(t);a:=0;
 repeat inc(a);treadln(t,predstr[a]);until teof(t);
 for b:=1 to a do for c:=1 to length(predstr[b]) do
  predstr[b][c]:=chr(ord(predstr[b][c])-30);
 tclose(t);
 tassign(t,'code\texty.nnt');treset(t);a:=0;
 repeat
  inc(a);treadln(t,str);
  strings^[a+251]:=str;
 until teof(t);
 for b:=251 to a+251 do for c:=1 to length(strings^[b]) do
  strings^[b][c]:=chr(ord(strings^[b][c])-30);
 tclose(t);
 assign(f,'code\font.nnp');
 reset(f,1);
 blockread(f,obrazok^,filesize(f));
 depack(filesize(f),obrpoi);
 close(f);move(tmp^[787],font^,10000);
 {asm
  les di,paletta
  xor ax,ax
  mov cx,3
  rep stosw
 end;}
end;

procedure cheat;
var a:word;
begin
 for a:=6 to 14 do predm[a+12]:=true;
end;

procedure testuj;
begin
{ assign(f,'music\uvod.mod');reset(f,1);
 if (ioresult<>0)or(filesize(f)<>154940) then
 begin
  sound(1502);delay(154);nosound;writeln;
  writeln('Chyba - 463465:56874 - Chyba dolezity subor !!!');
  writeln('Thanx for trying to play Utek ---------------------- NoName Software');
  halt(0);
 end;
 close(f);assign(f,'music\music1-2.mod');reset(f,1);
 if (ioresult<>0)or(filesize(f)<>85596) then
 begin
  sound(1502);delay(154);nosound;writeln;
  writeln('Chyba - 463265:56874 - Chyba dolezity subor !!!');
  writeln('Thanx for trying to play Utek ---------------------- NoName Software');
  halt(0);
 end;
 close(f);
 assign(f,'music\music1-1.mod');reset(f,1);
 if (ioresult<>0)or(filesize(f)<>130060) then
 begin
  sound(1502);delay(154);nosound;writeln;
  writeln('Chyba - 463465:56874 - Chyba dolezity subor !!!');
  writeln('Thanx for trying to play Utek ---------------------- NoName Software');
  halt(0);
 end;
 close(f);assign(f,'music\happyend.mod');reset(f,1);
 if (ioresult<>0)or(filesize(f)<>82051) then
 begin
  sound(1502);delay(154);nosound;writeln;
  writeln('Chyba - 463265:56874 - Chyba dolezity subor !!!');
  writeln('Thanx for trying to play Utek ---------------------- NoName Software');
  halt(0);
 end;
 close(f);
 assign(f,'music\music2-1.mod');reset(f,1);
 if (ioresult<>0)or(filesize(f)<>68900) then
 begin
  sound(1502);delay(154);nosound;writeln;
  writeln('Chyba - 463465:56874 - Chyba dolezity subor !!!');
  writeln('Thanx for trying to play Utek ---------------------- NoName Software');
  halt(0);
 end;
 close(f);assign(f,'music\music2-2.mod');reset(f,1);
 if (ioresult<>0)or(filesize(f)<>111621) then
 begin
  sound(1502);delay(154);nosound;writeln;
  writeln('Chyba - 463265:56874 - Chyba dolezity subor !!!');
  writeln('Thanx for trying to play Utek ---------------------- NoName Software');
  halt(0);
 end;
 close(f);
 assign(f,'music\music2-3.mod');reset(f,1);
 if (ioresult<>0)or(filesize(f)<>101688) then
 begin
  sound(1502);delay(154);nosound;writeln;
  writeln('Chyba - 463465:56874 - Chyba dolezity subor !!!');
  writeln('Thanx for trying to play Utek ---------------------- NoName Software');
  halt(0);
 end;
 close(f);assign(f,'music\music3-1.mod');reset(f,1);
 if (ioresult<>0)or(filesize(f)<>137740) then
 begin
  sound(1502);delay(154);nosound;writeln;
  writeln('Chyba - 463265:56874 - Chyba dolezity subor !!!');
  writeln('Thanx for trying to play Utek ---------------------- NoName Software');
  halt(0);
 end;
 close(f);
 assign(f,'music\title.mod');reset(f,1);
 if (ioresult<>0)or(filesize(f)<>101681) then
 begin
  sound(1502);delay(154);nosound;writeln;
  writeln('Chyba - 463465:56874 - Chyba dolezity subor !!!');
  writeln('Thanx for trying to play Utek ---------------------- NoName Software');
  halt(0);
 end;
 close(f);}
end;

procedure naloaduj;
begin
if soundis then begin
 if playing then stopsound;
end;
zobrazpred;
if cast=1 then
begin
 if izba=1 then loadroom('data\izba1');
 if izba=3 then loadroom('data\izba2');
 if izba=4 then loadroom('data\izba4');
 if izba=5 then loadroom('data\izba3');
 if izba=2 then loadroom('data\chodba');
 if izba=6 then loadroom('data\chodba1');
 if izba=7 then loadroom('data\kuchyna');
 if izba=8 then loadroom('data\kabinet');
 if izba=9 then loadroom('data\izba5');
 if izba=10 then kabload;
 if izba=11 then loadroom('data\kabinet2');
 if izba=12 then loadroom('data\telefon');
 if izba=13 then loadroom('data\kabinet');
 if izba=14 then loadroom('data\pivnica');
 if izba=15 then loadroom('data\ulica');
 if predmal[7] then predstr[14]:='VãNOKENA';
end;
if cast=2 then
begin
 if izba=1 then loadroom('data2\posch1');
 if izba=2 then loadroom('data2\poschod');
 if izba=3 then loadroom('data2\posch2');
 if izba=4 then loadroom('data2\poschkup');
 if izba=5 then loadroom('data2\poschod2');
 if izba=6 then loadroom('data2\poschzac');
 if izba=7 then loadroom('data2\poschoby');
 if izba=8 then loadroom('data2\poschkuc');
 if izba=9 then loadroom('data2\prizchod');
 if izba=10 then loadroom('data2\prizach');
 if izba=11 then loadroom('data2\prizkuch');
 if izba=12 then loadroom('data2\prizjeda');
 if izba=13 then loadroom('data2\prizoby');
 if izba=14 then loadroom('data2\sutere02');
 if izba=15 then loadroom('data2\suteren');
 if izba=16 then loadroom('data2\sutere01');
 if izba=17 then loadroom('data2\prizvcho');
end;
if cast=3 then
begin
 if izba=1 then loadroom('data3\vratnica');
 if izba=2 then loadroom('data3\vratposc');
end;
if soundis then
begin
 if cast=1 then if predmal[3] then meno:='music1-2.mod' else
  meno:='music1-1.mod';
 if cast=2 then if (izba>=1)and(izba<=8) then meno:='music2-1.mod' else
  if (izba>=9)and(izba<=13)or(izba=17) then meno:='music2-2.mod' else
   if (izba>=14)and(izba<=16) then meno:='music2-3.mod';
 if cast=3 then meno:='music3-1.mod';
 initsound(cfg,speed,meno);
end;
end;

procedure getreg;
begin
{ reg:='';
 assign(f,'utek.exe');
 reset(f,1);
 seek(f,30);
 blockread(f,hlava,51);
 close(f);
 for a:=1 to 20 do
 reg:=reg+chr(hlava[a+29]-a*3-50);
}reg:='This is FREEWARE !';
end;

procedure testreg;
begin
{ if hlava[51]<>$50 then
 begin writeln;writeln('Ilegalna kopia !!!');halt(40);end;
 if hlava[52]<>$40 then
 begin writeln;writeln('Ilegalna kopia !!!');halt(40);end;
 a:=52;repeat inc(a);
 until (hlava[a]-120<>mem[$f000:$78+(a-53)])or(a=81);
 if a<>81 then
 begin writeln;writeln('Ilegalna kopia !!!');halt(40);end;
}end;

{$i gamecode/prezri.pas}
{$i gamecode/vezmi.pas}
{$i gamecode/pouzi.pas}

{--------------------------------Hlavny program------------------------------}
procedure domain;
var a:word;
begin
{assign(f,'utek.exe');
reset(f,1);
if (ioresult<>0)or(filesize(f)<>46668) then
begin
 sound(1502);
 delay(154);
 nosound;
 writeln;
 writeln('Chyba - 466665:56873 - Chyba v UTEK.EXE ! (mozno virus)');
 writeln('Thanx for trying to play Utek ---------------------- NoName Software');
 halt(0);
end;
close(f);
}//checkbreak:=false;
getreg;
k:=4;kl:=1;kabinet:=3;predme:=3;pisat:=true;neber:='TO DO RUKY NEVEZMEM!';
{textcolor(lightmagenta);hc;
writeln;writeln('-------------------------------------------------------------------------------');
textcolor(lightgreen);
write('Utek 1.00');textcolor(7);write(' - ');textcolor(blue);
write(' REGISTERED TO : ');textcolor(lightblue);writeln(reg);
textcolor(lightmagenta);
writeln('-------------------------------------------------------------------------------');
writeln;
textcolor(lightred);write('Warning');textcolor(brown);
write(' COPIES are ');textcolor(lightred+blink);write('NOT');
textcolor(brown);writeln(' FREE !!!');writeln;}{textcolor(cyan);
write('Created by ');textcolor(lightcyan);write('NoName Software');
textcolor(cyan);writeln(', 6. 3. 1995 - All rights reserved.');
textcolor(7);sc;testinit;hc;textcolor(cyan);writeln;
write('Press any key or mouse button to continue ...');textcolor(7);
pauza(1500);
gotoxy(1,wherey);write('                                             ');
gotoxy(1,wherey);write('Loading ...');
sc;testuj;
}
testreg;setsound;
for a:=1 to 40 do predmal[a]:=false;for a:=1 to 40 do predm[a]:=false;
izba:=1;co:=1;cast:=1;
memory;
loadfirst;
umiestni(160,142);
nuluj;
uvod;
move(palletspri,paletta^[631],138);paleta;
movepal(paletta^);
zobrazpred;
ob(har);
mapaspod;
naloaduj;
b:=0;e:=19;d:=19;

repeat
 kurzor(predme);
 if (lave)or(kl=13) then
 begin
  if mapa^[x+y*320+1]<>0 then predmet:=strings^[mapa^[x+y*320+1]] else predmet:='';
  if predmet<>'' then
  begin
    if mapa^[x+y*320+1]>=241 then
    begin
     if mapa^[x+y*320+1]>=252 then
     begin
      tl(predme);
      //if predme<6 then
      if predmet='ZOBER' then begin prikaz:='zober';predme:=4;zobrazpred;end else
      if predmet='POUíI' then begin prikaz:='pouzi';predme:=3;zobrazpred;end else
      if predmet='PREZRI' then begin prikaz:='prezri';predme:=5;zobrazpred;end else
      if predmet='MENU' then begin
        predme:=3;zobrazpred;
        pisat:=false;loadspr('code\menu');zobraz;
        if izba<>10 then begin
         movepal((paletta^));
         //tmav;
         menusvetlo;
        end;
        umiestni(160,80);
        repeat
         kurzor(0);if prave then kl:=27;if lave then kl:=13;
         tl(0);
        until ((mapa^[x+y*320+1]>=238)and(mapa^[x+y*320+1]<=241)and(kl=13))or(kl=27);
        b:=mapa^[x+y*320+1];
        closewin;zobraz;
        if kl=27 then begin kl:=1;zobraz;end else
        if b=238 then begin umiestni(160,80);loadsav;if kl<>27 then naloaduj;kl:=1;end else
        if b=239 then begin umiestni(160,80);savesav;zobrazpred;kl:=1;end else
        if b=240 then begin umiestni(160,142);zobraz;zm(har);zmcele(har);
        if soundis then begin stopsound;initsound(cfg,speed,'title.mod');end;
         kabinet:=3;pisat:=true;
         uvodd;move(palletspri,paletta^[631],138);paleta;
         movepal((paletta^));zobrazpred;ob(har);
         mapaspod;naloaduj;
        end else
        if b=241 then ende;
        if izba<>10 then paleta;pisat:=true;
       end
      end else
      begin
      if prikaz='zober' then
       say(192,9,'VEÖ NEM~íEM VZIAÜ TO, ÄO Uí MèM.');
      if prikaz='prezri' then
      begin
       if predmet='50 HALIEROV' then say(192,9,'OBYÄAJNù KUS KOVU.');
       if predmet='PAPUÄE' then say(192,9,'FóóóJ. TO JE SMRAD.');
       if predmet='KúóÄ' then say(192,9,'ZNAÄKA FAB. S DOBERMANOM NA DRUHEJ STRANE.');
       if predmet='õROBOVèK' then say(192,9,'NORMèLNE JE VYDRATù, Aí DO MéSA.');
       if predmet='KúóÄIK' then say(192,9,'JE NEJAKù ÄUDNù. MOíNO, íE JE DREVENNù.');
       if predmet='VãNO' then say(192,9,'NIÄ PRE M•A, ALE TUHõIE TU NIE JE.');
       if predmet='OKENA' then say(192,9,'NEMèM íIADNE OKNO.');
       if predmet='RóÄKA' then say(192,9,'JA ZA NIÄ NERUÄãM.');
       if predmet='KORENIE' then say(192,9,'HAPÄãK.');
       if predmet='STEHNO' then say(192,9,'M•AM. M•AM.');
       if predmet='VãNOKENA' then say(192,9,'DOBRè KOMBINèCIA.');
       if predmet='ZHRDZAVENù KúóÄ' then say(192,9,'V TOM AKVèRIU MUSEL BYÜ VEúMI DLHO.');
       if predmet='POKORENENê STEHNO' then say(192,9,'KEÖ HO NIEKTO ZJE, TAK PèN BOH S NãM.');
       if predmet='DR~TIK' then say(192,9,'NEVERIM, íE MI POM~íE.');
       if predmet='KUS PLAGèTU' then say(192,9,'AKO SOM LEN MOHLA.');
       if predmet='KúóÄ' then say(192,9,'PEKNù DREVENNù.');
       if predmet='VùVRTKA'then say(192,9,'TOÄã SA TOÄã.');
       if predmet='KúUÄKA' then say(192,9,'JE CELè KOVOVè.');
       if predmet='NOíNICE' then say(192,9,'RIADNE OSTRê.');
       if predmet='õNóRKA' then say(192,9,'PèCHNE.');
       if predmet='OBRóSOK' then say(192,9,'PEKNè VZORKA.');
       if predmet='KLIEõTE' then say(192,9,'RIADNE KOMBINAÄKY.');
       if predmet='KúóÄ' then say(192,9,'JE TO JEDENèSTKA.');
       if predmet='OLEJNIÄKA' then say(192,9,'JE NAJAKè MASTNè.');
       if predmet='N~í' then say(192,9,'èóóóó.');
       if predmet='PENIAZE' then say(192,9,'A BUDE AJ KEN !');
       if predmet='TOALETNù PAPIER' then say(192,9,'JE NEJAKù HNEDù.');
       if predmet='LIEVIK' then say(192,9,'JE DERAVù.');
       if predmet='HADICA' then say(192,9,'JE TROCHU KúUKATè.');
       if predmet='HANDRA' then say(192,9,'NEVIZERè BYÜ VEúMI ÄISTè.');
       if predmet='MOKRù PAPIER' then say(192,9,'JE MOKRù.');
       if predmet='MASKA' then say(192,9,'PROTI PLYNU, RADIOAKTIVITE ...');
      end;
      if (prikaz='pouzi')and(predme<6) then
      begin
       predme:=predreal[mapa^[x+y*320+1]-241];
       zobrazpred;
      end else
      if (prikaz='pouzi')and(predme>5) then
      begin
       if cast=1 then
       begin
        if ((predme=9)and(predmet='STEHNO'))or((predme=7)and(predmet='KORENIE'))
        then begin
         predm[7]:=false;predm[9]:=false;predm[10]:=true;
         predme:=3;zobrazpred;
        end
        else
        if ((predme=14)and(predmet='OKENA'))or((predme=15)and(predmet='VãNO'))
        then
        begin
         predstr[14]:='VãNOKENA';predm[15]:=false;
         predme:=3;zobrazpred;predmal[7]:=true;
        end else
         if (predmet<>'')and(predmet<>'ZOBER')and(predmet<>'POUíI')and(predmet<>'PREZRI')and(predmet<>'MENU')
          then say(192,9,'NEVIEM ÄO STEAM.');
       end;
       if cast=2 then
       begin
        if ((predme=24)and(predmet='MOKRù PAPIER'))or((predme=35)and(predmet='õNóRKA'))
        then begin
         predm[24]:=false;predm[35]:=false;predme:=3;predm[36]:=true;
         zobrazpred;say(192,9,'NAõÜASTIE POZERèM MAC GYVERA.');
        end else
        say(192,9,'NEVIEM ÄO STEAM.');
       end;
       if cast=3 then say(192,9,'NEVIEM ÄO STEAM.');
      end;
     end;
    end else
    if predmet='ZATVOR OKNO' then begin closewin;zobraz;end else
    if prikaz='prezri' then prezri else
    if prikaz='zober' then vezmi else
    if prikaz='pouzi' then pouzi;
  end;
  tl(predme);
 end;
 if (prave)or(kl=32) then
 begin
  tl(predme);
  if predme>5 then begin predme:=3;zobrazpred;end else
  if predme=3 then begin predme:=4;prikaz:='zober';zobrazpred;end else
  if predme=4 then begin predme:=5;prikaz:='prezri';zobrazpred;end else
  if predme=5 then begin predme:=3;prikaz:='pouzi';zobrazpred;end;
 end;
 until kl=27;
 ende;
end;
