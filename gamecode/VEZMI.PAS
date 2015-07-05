procedure vezmi;
begin
 if cast=1 then
 begin
  if izba=1 then
  begin
   if predmet='MINCA' then begin
    newspr('data\detail11');zobraz;
    say(192,9,'HURèè. 50 HALIEROV ! KóPIM SI BARBIE !');
    predm[6]:=true;zobrazpred;end else
   if predmet<>'' then say(192,9,'TO ÜAíKO !!!');
  end else
  {--------------chodba---------------------------}
  if izba=2 then
  begin
   if predmet<>'' then say(192,9,'TO ÜAíKO !!!');
  end else
  {--------------izba2---------------------------}
  if izba=3 then
  begin
   if predmet='PAPUÄE' then begin
    newspr('data\detail21');zobraz;predm[8]:=true;zobrazpred;end else
   if predmet='KúóÄ' then begin predm[13]:=true;
    newspr('data\detail23');predmal[16]:=true;zobraz;zobrazpred;end else
   if predmet<>'' then say(192,9,neber);
  end else
  {--------------izba3---------------------------}
  if izba=4 then
  begin
   if (predmet='VODA')and(predmal[2])and(not predmal[8]) then
   begin
    say(192,9,'Z DNA SOM VYBRALA ZHRDZAVENù KúóÄ.');
    predm[11]:=true;predmal[8]:=true;zobrazpred;
   end else
   if predmet<>'' then say(192,9,neber);
  end else
  {--------------izba4---------------------------}
  if izba=5 then
  begin
   if predmet<>'' then say(192,9,'TO ÜAíKO !!!');
  end else
  {--------------chodba1---------------------------}
  if izba=6 then
  begin
   if predmet<>'' then say(192,9,'TO ÜAíKO !!!');
  end else
  {--------------kuchy§a---------------------------}
  if izba=7 then
  begin
   if (predmet='KORENIE')and(predmal[6]) then say(192,9,'Uí NECHCEM.') else
   if (predmet='KORENIE')and(not predmal[6]) then
   begin
    say(192,9,'TROõKU KORENIA SI VEZMEM.');
    predmal[6]:=true;predm[9]:=true;zobrazpred;end else
    if predmet='STEHNO' then begin predm[7]:=true;
    predmal[4]:=true;zobrazpred;
    newspr('data\detail41');zobraz;end else
   if predmet<>'' then say(192,9,neber);
  end else
  {--------------kabinet---------------------------}
  if izba=8 then
  begin
   if predmet<>'' then say(192,9,neber);
  end else
  {--------------kabinet tma---------------------------}
  if izba=10 then
  begin
   if predmet<>'' then say(192,9,neber);
  end else
  {KABINET BORDEL}
  if izba=11 then
  begin
   if predmet='õROBOVèK' then begin predmal[9]:=true;
    predm[12]:=true;zobrazpred;newspr('data\detail51');zobraz;
   end else
   if predmet<>'' then say(192,9,neber);
  end else
  {-------------- kabinet - poklop --------------------------}
  if izba=13 then
  begin
   if predmet<>'' then say(192,9,neber);
  end else
  {-------------- ULICA --------------------------}
  if izba=15 then
  begin
   if predmet<>'' then say(192,9,neber);
  end else
  {--------------PiVNICA-----------------------}
  if izba=14 then
  begin
   if (predmet='FúAõA')or(predmet='FúAõA'+#3) then
    say(192,9,'JE SKORO PRèZDNA.') else
   if predmet='FúAõA' then begin
    predmal[11]:=true;predm[14]:=true;zobrazpred;
    newspr('data\pivnica');zobraz;end else
   if predmet<>'' then say(192,9,neber);
  end else
  {--------------izba 5 telefon-----------------------}
  if izba=12 then
  begin
   if predmet<>'' then say(192,9,neber);
  end else
  {--------------izba 5---------------------------}
  if izba=9 then
  begin
   if predmet='KúóÄ' then
   begin
    predm[16]:=true;predmal[13]:=true;
    zobrazpred;newspr('data\detail61');zobraz;end else
   if predmet<>'' then say(192,9,neber);
  end;
 end;
 if cast=2 then
 begin
  {--------------posch1-----------------------}
  if izba=1 then
  begin
   if predmet='PLAGèT' then
   begin
    say(192,9,'NO NEVIEM, ALE SKóSIM TO ODRHNóÜ.');
    predm[19]:=true;predmal[1]:=true;newspr('data2\poschpla');
    zobrazcele;zobrazpred;
   end else
   if predmet='VSUNUTù PLAGèT' then
   begin
    if (predmal[4])and(predmal[5])and(not predmal[7]) then
    begin
     say(192,9,'JUPã. VYõLO TO !');predm[19]:=false;
     predmal[7]:=true;predmal[1]:=true;predmal[4]:=false;
     newspr('data2\poschpa2');zobrazcele;predm[20]:=true;zobrazpred;
    end else
    begin
     predm[19]:=true;predmal[1]:=true;predmal[4]:=false;
     newspr('data2\poschpa2');zobrazcele;zobrazpred;
    end;
   end else
   if predmet='DR~TIK' then
   begin
    if not predmal[16] then
    begin predmal[16]:=true;say(192,9,'NAÄO BY MI BOL !');end else
    if (predmal[16])and(not predmal[17]) then begin
     predmal[17]:=true;say(192,9,'PROSãM ÜA, VEÖ JE óPLNE ZBYTOÄNù.');end else
    if predmal[17] then begin say(192,9,'NO DOBRE.');
     predm[18]:=true;predmal[2]:=true;
     zobrazpred;newspr('data2\posch1dr');zobraz;end;
    end else
    if predmet<>'' then say(192,9,neber);
  end else
  {--------------poschod---------------------------}
  if izba=2 then
  begin
   if predmet='PAPIER' then
   begin
    predm[31]:=true;predmal[8]:=true;closewin;zobraz;
    newspr('data2\poschzac');loadspr('data2\zachode1');zobrazpred;zobraz;end else
   if predmet<>'' then say(192,9,neber);
  end;
  {--------------posch2---------------------------}
  if izba=3 then
  begin
   if predmet='NOíNICE' then
   begin predmal[12]:=true;predm[23]:=true;
   zobrazpred;newspr('data2\posch22');zobraz;
   end else
   if predmet<>'' then say(192,9,neber);
  end;
  {--------------poschkup---------------------------}
  if izba=4 then
  begin
   if predmet<>'' then say(192,9,neber);
  end;
  {--------------poschod2---------------------------}
  if izba=5 then
  begin
   if predmet<>'' then say(192,9,neber);
  end;
  {--------------poschzac---------------------------}
  if izba=6 then
  begin
   if predmet='TOALETNù PAPIER' then begin
    loadspr('data2\zachodet');zobraz;end else
   if predmet='PAPIER' then
   begin
    predm[31]:=true;predmal[8]:=true;
    closewin;zobraz;newspr('data2\poschzac');
    loadspr('data2\zachode1');zobrazpred;zobraz;end else
   if predmet<>'' then say(192,9,neber);
  end;
  {--------------poschoby---------------------------}
  if izba=7 then
  begin
   if predmet='PENIAZE' then begin newspr('data2\trezor2');zobraz;
    predmal[20]:=true;predm[30]:=true;zobrazpred;end else
   if predmet<>'' then say(192,9,neber);
  end;
 {--------------poschkuc---------------------------}
 if izba=8 then
 begin
  if predmet='VùVRTKA' then begin predmal[10]:=true;predm[21]:=true;
   newspr('data2\kuchdet1');zobraz;zobrazpred;end else
  if predmet<>'' then say(192,9,neber);
 end;
  {--------------prizchod---------------------------}
  if izba=9 then
  begin
   if predmet<>'' then say(192,9,neber);
  end;
  {--------------prizach---------------------------}
  if izba=10 then
  begin
   if predmet='HANDRA' then begin newspr('data2\prizach');zobraz;
    predmal[21]:=true;predm[34]:=true;zobrazpred;end else
   if predmet<>'' then say(192,9,neber);
  end;
  {--------------prizkuch---------------------------}
  if izba=11 then
  begin
   if predmet='N~í' then begin predmal[14]:=true;predm[29]:=true;
    zobrazpred;newspr('data2\prizkuch');zobraz;end else
   if predmet<>'' then say(192,9,neber);
  end;
  {--------------prizjeda---------------------------}
  if izba=12 then
  begin
   if predmet='OBRóSOK' then begin predmal[15]:=true;predm[25]:=true;
    zobrazpred;newspr('data2\prizjeda');zobraz;end else
   if predmet<>'' then say(192,9,neber);
  end;
  {--------------prizoby---------------------------}
  if izba=13 then
  begin
   if predmet<>'' then say(192,9,neber);
  end;
  {--------------sutere02---------------------------}
  if izba=14 then
  begin
   if predmet<>'' then say(192,9,neber);
  end;
  {--------------suteren---------------------------}
  if izba=15 then
  begin
   if predmet<>'' then say(192,9,neber);
  end;
  {--------------sutere01---------------------------}
  if izba=16 then
  begin
   if predmet='HARABURDY' then
   begin closewin;zobraz;predm[26]:=true;predm[27]:=true;predm[28]:=true;
   zobrazpred;predmal[18]:=true;end else
   if predmet<>'' then say(192,9,neber);
  end;
  {--------------prizvcho---------------------------}
  if izba=17 then
  begin
   if predmet='KúUÄKA' then
   begin predmal[11]:=true;predm[22]:=true;zobrazpred;
    newspr('data2\prizvcho');zobraz;end else
   if predmet<>'' then say(192,9,neber);
  end;
 end;
 if cast=3 then
 begin
  if izba=1 then
  begin
    if predmet<>'' then say(192,9,neber);
  end else
  {--------------poschod---------------------------}
  if izba=2 then
  begin
   if predmet<>'' then say(192,9,neber);
  end;
 end;
end;