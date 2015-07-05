procedure pouzi;
begin
 if predmet[length(predmet)]='`' then
 begin
  if cast=1 then
  begin
   if predme=3 then
   begin
    if (predmet='VùCHOD`')and((izba=7)or(izba=8)or(izba=10)or(izba=13)) then
     begin izba:=6;loadroom('data\chodba1');end else
    if (predmet='VùCHOD`')and(izba=4) then begin izba:=2;loadroom('data\chodba');end else
    if (predmet='CHODBA`')and(izba=11) then begin izba:=6;loadroom('data\chodba1');end else
    if predmet='DO MESTA`' then begin say(192,9,'HêJ, PUSTITE MA. ÄO CHCETE.');ENDEEE;end else
    if predmet='DO PENZIïNU`' then begin izba:=6;loadroom('data\chodba1');end else
    if (predmet='REBRãK`')and(izba=14) then begin izba:=13;loadroom('data\kabinet');end else
    if (predmet='IZBA`')and(izba=12) then begin izba:=9;loadroom('data\izba5');end else
    if (predmet='DVERE`')and(izba=15) then say(192,9,'JE ZAMKNUTê.') else
    if (predmet='VùCHOD`')and(izba=9) then begin izba:=6;loadroom('data\chodba1');end else
    if (predmet='VùCHOD`')and(izba=5) then begin izba:=2;loadroom('data\chodba');end else
    if (predmet='VùCHOD`')and(izba=3) then begin izba:=2;loadroom('data\chodba');end else
    if (predmet='POKLOP`') then
    begin
     if izba=13 then begin izba:=14;loadroom('data\pivnica');
     end else
      say(192,9,'JE PRIVALENù SKRI•OU.');
    end else
    if izba=1 then
    begin
     if predmet=('KLUÄKA`') then
     begin
      if not predmal[1] then
      begin
       say(192,9,'AHA, VEÖ Só OTVORENê SKóSIM POTICHU UTIECÜ.');predmal[1]:=true;
      end;izba:=2;loadroom('data\chodba');
     end else
     if predmet=('DVERE`') then
     begin
      if not predmal[1] then
      begin
       say(192,9,'AHA, VEÖ Só OTVORENê SKóSIM POTICHU UTIECÜ.');predmal[1]:=true;
      end;izba:=2;loadroom('data\chodba');
     end;
    end else
    if izba=2 then
    begin
     if predmet='DVERE`' then begin izba:=3;loadroom('data\izba2');end;
     if predmet='DVERE'+CHR(1)+'`' then begin izba:=1;loadroom('data\izba1');end;
     if predmet='DVERE'+CHR(2)+'`' then begin izba:=4;loadroom('data\izba4');end;
     if predmet='DVERE'+CHR(3)+'`' then begin izba:=5;loadroom('data\izba3');end;
     if (predmet='PRãZEMIE`')and(not predm[1]) then say(192,9,'SCHODY Só ÄERSTVO UMYTê. MOHLA BY SOM SPADNóÜ !');
     if (predmet='PRãZEMIE`')and(predm[1]) then begin izba:=6;loadroom('data\chodba1');end;
    end else
    if izba=6 then
    begin
     if predmet='KUCHY•A`' then begin izba:=7;loadroom('data\kuchyna');end;
     if predmet='POSCHODIE`' then begin izba:=2;loadroom('data\chodba');end;
     if (predmet='KABINET`')and(kabinet=4) then begin izba:=11;loadroom('data\kabinet2');end;
     if (predmet='KABINET`')and(kabinet=2) then begin izba:=10;kabload;end;
     if (predmet='KABINET`')and(kabinet=3) then say(192,9,'JE ZAMKNUTù.');
     if (predmet='KABINET`')and(kabinet=1) then begin izba:=8;
      loadroom('data\kabinet');end;
     if (predmet='KABINET`')and(kabinet=5) then begin izba:=13;
      loadroom('data\kabinet');end;
     if predmet='DVERE`' then begin izba:=9;loadroom('data\izba5');end;
     if (predmet='ULICA`')and(predmal[14]) then begin izba:=15;loadroom('data\ulica');end;
     if (predmet='ULICA`')and(not predmal[14]) then
      say(192,9,'VRèTNIK MA NECHCE PUSTIÜ, KùM MU NEDèM KúóÄ OD IZBY.');
    end;
   end else
   begin
    if (izba=6)and(predmet='KABINET`') then
    begin
     if predme=13 then
     begin
      izba:=10;say(192,9,'KúóÄIK NEPASOVAL, TAK SOM VYKOPLA DVERE.');
      predm[13]:=false;
      kabinet:=2;predme:=3;
      kabload;zobrazpred;
     end else
     say(192,9,'POHúADAJ SPRèVNY KúóÄ.');
    end else
    if (predmet='DVERE`')and(izba=15) then say(192,9,'NEPASUJE.') else
    if (izba=2)and(predmet='PRãZEMIE`') then
    begin
     if predme=8 then
     begin
      say(192,9,'OBULA SOM SI PAPUÄE A SPADLA ...');izba:=6;
      predm[1]:=true;loadroom('data\chodba1');
      predme:=3;zobrazpred;
     end else say(192,9,'NO URÄITE !!!');
    end else say(192,9,'NO URÄITE !!!');
   end;
  end;
  if cast=2 then
  begin
   if predme=3 then
   begin
    if (predmet='DVERE`')and(izba=1) then
     if predmal[3] then
     begin loadroom('data2\poschod');izba:=2;end else
      say(192,9,'ONI MA TU ZAMKLI !!!') else
    if (predmet='DVERE'+#1+'`')and(izba=2) then
     if predmal[6] then
     begin loadroom('data2\posch2');izba:=3;end else
      say(192,9,'A KúUÄKU SI ÄO ?') else
    if (predmet='DVERE`')and(izba=2) then
     begin loadroom('data2\posch1');izba:=1;end else
    if (predmet='DVERE'+#1+'`')and(izba=2) then
     begin loadroom('data2\posch2');izba:=3;end else
    if (predmet='DVERE'+#2+'`')and(izba=2) then
     begin loadroom('data2\poschkup');izba:=4;end else
    if (predmet='CHODBA`')and(izba=2) then
     begin loadroom('data2\poschod2');izba:=5;end else
    if (predmet='CHODBA`')and(izba=5) then
     begin loadroom('data2\poschod');izba:=2;end else
    if (predmet='DVERE`')and(izba=3) then
     begin loadroom('data2\poschod');izba:=2;end else
    if (predmet='DVERE`')and(izba=5) then
     begin loadroom('data2\poschzac');izba:=6;end else
    if (predmet='VùCHOD`')and(izba=6) then
     begin loadroom('data2\poschod2');izba:=5;end else
    if (predmet='DVERE'+#1+'`')and(izba=5) then
     begin loadroom('data2\poschkup');izba:=4;end else
    if (predmet='DVERE'+#2+'`')and(izba=5) then
     begin loadroom('data2\poschoby');izba:=7;end else
    if (predmet='DVERE`')and(izba=7) then
     begin loadroom('data2\poschkuc');izba:=8;end else
    if (predmet='VùCHOD`')and(izba=4) then
     begin loadroom('data2\poschod2');izba:=5;end else
    if (predmet='VùCHOD`')and(izba=7) then
     begin loadroom('data2\poschod2');izba:=5;end else
    if (predmet='VùCHOD`')and(izba=8) then
     begin loadroom('data2\poschoby');izba:=7;end else
    if (predmet='DOLE`')and(izba=2) then
     begin if soundis then begin stopsound;
      initsound(cfg,speed,'music2-2.mod');end;
      loadroom('data2\prizchod');izba:=9;end else
    if (predmet='HORE`')and(izba=9) then
     begin if soundis then begin stopsound;
      initsound(cfg,speed,'music2-1.mod');end;
     loadroom('data2\poschod');izba:=2;end else
    if (predmet='DVERE'+#2+'`')and(izba=9) then
    begin
     if predmal[19] then
      begin loadroom('data2\prizach');izba:=10;end else
      say(192,9,'JèèJ. VEÖ õKRãPU. POÄULI BY MA VCHèDZAÜ.');
    end else
    if (predmet='DVERE'+#1+'`')and(izba=9)and(not predmal[26]) then
     begin say(192,9,'TAM Só óNOSCOVIA !');end else
    if (predmet='DVERE'+#1+'`')and(izba=9)and(predmal[26]) then
     begin say(192,9,'TAM JE PLYN !');end else
    if (predmet='DVERE`')and(izba=10) then
     begin loadroom('data2\prizchod');izba:=9;end else
    if (predmet='DVERE'+#3+'`')and(izba=9) then
     begin loadroom('data2\prizkuch');izba:=11;end else
    if (predmet='DVERE'+#1+'`')and(izba=11) then
     begin loadroom('data2\prizchod');izba:=9;end else
    if (predmet='DVERE`')and(izba=11) then
     begin loadroom('data2\prizjeda');izba:=12;end else
    if (predmet='DVERE`')and(izba=12) then
     begin loadroom('data2\prizkuch');izba:=11;end else
    if (predmet='DVERE'+#4+'`')and(izba=9) then
     begin loadroom('data2\prizoby');izba:=13;end else
    if (predmet='DVERE`')and(izba=13) then
     begin loadroom('data2\prizchod');izba:=9;end else
    if (predmet='VùCHOD`')and(izba=13) then
     begin loadroom('data2\prizjeda');izba:=12;end else
    if (predmet='VùCHOD`')and(izba=12) then
     begin loadroom('data2\prizoby');izba:=13;end else
    if (predmet='DOLE`')and(izba=9) then
     begin if soundis then begin stopsound;
      initsound(cfg,speed,'music2-3.mod');end;
     loadroom('data2\sutere02');izba:=14;end else
    if (predmet='HORE`')and(izba=14) then
     begin if soundis then begin stopsound;
      initsound(cfg,speed,'music2-2.mod');end;
     loadroom('data2\prizchod');izba:=9;end else
    if (predmet='VEDúA`')and(izba=14) then
     begin loadroom('data2\suteren');izba:=15;end else
    if (predmet='VEDúA`')and(izba=15) then
     begin loadroom('data2\sutere02');izba:=14;end else
    if (predmet='VEDúA`')and(izba=14) then
     begin loadroom('data2\sutere01');izba:=16;end else
    if (predmet='VEDúA`')and(izba=16) then
     begin loadroom('data2\sutere02');izba:=14;end else
    if (predmet='DVERE`')and(izba=9) then
     begin loadroom('data2\prizvcho');izba:=17;end else
    if (predmet='VùCHOD`')and(izba=17) then
     begin loadroom('data2\prizchod');izba:=9;end else
    if (predmet='DVERE`')and(izba=17)and(not predmal[26]) then
     begin say(192,9,'NO URÄITE ! ZNOVU MA CHYTIA.');end else
    if (predmet='DVERE`')and(izba=17)and(not predmal[22]) then
     begin say(192,9,'NEMèM KDE ãSÜ. HMMM. AKO ZAVOLAÜ TAXIKèRA ?');end else
    if (predmet='DVERE`')and(izba=17)and(not predmal[20]) then
     begin say(192,9,'NEMèM ÄãM ZAPLATIÜ TAXIKèROVI.');end else
    if (predmet='DVERE`')and(izba=17) then
     begin say(192,9,'HURRè. IDEM ZA MAMOU A OTCOM.');endee2;end else
   end else
   begin
    if izba=9 then
    begin
     if predmet='DVERE'+#1+'`' then begin
      if predme=34 then begin if win then begin closewin;zobraz;end;predme:=3;
       newspr('data2\prizcho2');zobraz;predmal[23]:=true;predm[34]:=false;
      zobrazpred;end else say(192,9,'NO URÄITE !!!');
     end else
     if (predmet='DVERE'+#2+'`')and(predme=28) then
     begin predmal[19]:=true;predme:=3;predm[28]:=false;zobrazpred;
      say(192,9,'DOBRù NèPAD.');
     end else say(192,9,'NO URÄITE !!!');
    end else say(192,9,'NO URÄITE !!!');
   end;
  end else
  if cast=3 then
  begin
   if predme=3 then
   begin
    if (predmet='VùÜAH`')and(izba=1) then
     if not predmal[1] then
      say(192,9,'NIE JE TU VùÜAH.') else
     if not predmal[2] then
      say(192,9,'NEVIEM, NA KTORê POSCHODIE ãSÜ.') else
      begin loadroom('data3\vratposc');izba:=2;end else
    if (predmet='DVERE`')and(izba=2) then
     begin thend;end else say(192,9,'NO URÄITE !!!');
    end else say(192,9,'NO URÄITE !!!');
   end;
  end else begin
  if cast=1 then
  begin
  {--------------izba1---------------------------}
  if izba=1 then
  begin
   if predmet<>'' then say(192,9,'TAK Z TOHTO SOM JELE•ICA.');
  end else
  {--------------chodba---------------------------}
  if izba=2 then
  begin
   if predmet='VYPãNAÄ' then say(192,9,'õTUK. NIÄ SA NESTALO.') else
   if predmet<>'' then say(192,9,'NIE SOM Aí TAKè MóDRA AKO MèRIA..');
  end else
  {--------------izba2---------------------------}
  if izba=3 then
  begin
   if (predmet='SKRI•A')and(predme=6)and(not predmal[15]) then
   begin
    say(192,9,'YES ! PODARILO SA !');predmal[15]:=true;
    loadspr('data\detail21');newspr('data\detail22');
    zobraz;
   end else
   if predme=3 then
   begin
    if (predmet='VEúKù õUPLãK')and(predmal[5])and(not predmal[10]) then
     begin loadspr('data\detail23');newspr('data\detail24');zobraz;
      say(192,9,'UFF, PODARILO SA.');predmal[10]:=true;end else
    if (predmet='VEúKù õUPLãK')and(not predmal[5]) then
     begin predmal[5]:=true;say(192,9,'JE ÜAíKù ASI HO NEOTVORãM.');end else
    if predmet<>'' then say(192,9,'IDEõ NA TO õPATNE, ALE NEZóFAJ.');
   end else
   if predmet<>'' then say(192,9,'IDEõ NA TO õPATNE, ALE NEZóFAJ.');
  end else
  {--------------izba3---------------------------}
  if izba=4 then
  begin
   if predmet='AKVèRIUM' then
    say(192,9,'ÄO JA VIEM ? SKóS TO RADõEJ POUíIÜ NA VODU.') else
   if (predmet='VODA')and(predme=10)and(not predmal[2]) then
   begin
    say(192,9,'PIRANA TOHO VEúA NEZJEDLA. KORENIA BOLO PRIVEúA !');
    predm[10]:=false;predme:=3;predmal[2]:=true;zobrazpred;
   end
   else
   if (predmet='VODA')and(predme<>7)and(not predm[11]) then
   begin
    say(192,9,'TO NEMè ZMYSEL !');
   end
   else
    if predmet<>'' then say(192,9,'NEDAJ SA VYSMIAÜ.');
  end else
  {--------------izba4---------------------------}
  if izba=5 then
  begin
   if (predmet='ST~L')and(predme=16)and(not predm[17]) then
   begin
    say(192,9,'NAõLA SOM VEúMI ÄUDNù PREDMET. JE TO RóÄKA !');
    predm[16]:=false;
    predm[17]:=true;predme:=3;zobrazpred;
   end else
   if predmet='HIFI VEíA' then
   begin
    if soundis then
    begin
     if not predmal[3] then
     begin say(192,9,'TO JE BOMBA ! JE TU AJ BRAVO HITS 98'' MUSIC BOX.');
      stopsound;initsound(cfg,speed,'music1-2.mod');predmal[3]:=true;
     end else
     begin say(192,9,'TO JE ALE õKODA, íE JU MUSãM VYPNóÜ.');
      stopsound;initsound(cfg,speed,'music1-1.mod');predmal[3]:=false;
     end;
    end else say(192,9,'ASI JE POKAZENè.');
    end else
    if predmet<>'' then say(192,9,'NAOZAJ NEVIEM, NA ÄO MYSLãõ.');
  end else
  {--------------chodba1---------------------------}
  if izba=6 then
  begin
   if (predmet='VYPãNAÄ')and(predme=3) then say(192,9,'õTUK. NIÄ SA NESTALO.') else
   if (predmet='VRèTNIK')and(predme=14)and(predmal[7]) then
   begin
    say(192,9,'TO SOM TEDA EõTE NEPIL !');
    say(192,9,'NARADOVANù VRèTNIK VYPIL CELó FúAõU NA JEDEN NèDYCH.');
    predme:=3;predm[14]:=false;predmal[14]:=true;newspr('data\chodba12');
    zobrazcele;say(192,9,'MYSLãM, íE NABUDóCE NAJPRV OKOõTUJE.');
   end else
   if (predmet='VRèTNIK')and(predme<>3) then
    if predmal[14] then say(192,9,'MYSLãM, íE Uí NECHCE.')
    else say(192,9,'IBA SA NA M•A USMIAL A POVEDAL, íE Uí TAKê Mè.')
   else if predmet<>'' then say(192,9,'V õKOLE NèS TOTO NEUÄILI.');
  end else
  {--------------kuchy§a---------------------------}
  if izba=7 then
  begin
   if (predmet='VYTRHNUTè RóÄKA')and(predme=17)and(not predmal[12]) then
   begin
    if predmal[9] then begin
     say(192,9,'SO õROBOVèKOM SOM JU PRIõRïBOVALA... BOíE, LEN OKENA ?');
     predm[15]:=true;predmal[12]:=true;zobrazpred;end else
     say(192,9,'PRESNE PASUJE! LEN 4 CM ROZDIEL! NEJDE PRIPEVNIÜ !!!');
   end
   else
   if predmet<>'' then say(192,9,'NIE,NIE, TAKTO TO NEP~JDE.');
  end else
  {--------------kabinet TMA---------------------------}
  if izba=10 then
  begin
   if (predmet='VYPãNAÄ')and(predme=3) then
   begin kabinet:=1;izba:=8;ob(har);
    say(192,9,'HURè, SVETLO.');end else
   if predmet='ZèMOK' then say(192,9,'V TEJ TME ASI TAíKO !') else
   if predmet<>'' then say(192,9,'KEÖ BUDEM VELKè, TAK TO URÄITE POCHOPãM.');
  end else
  {--------------kabinet---------------------------}
  if izba=11 then
  begin
   if predmet<>'' then say(192,9,'KEÖ BUDEM VELKè, TAK TO URÄITE POCHOPãM.');
  end else
  {--------------TELEFON---------------------------}
  if izba=12 then
  begin
   if predmet='PLAY' then say(192,9,'ZZZZZ. CHùBA KAZETA.') else
   if predmet='REC' then say(192,9,'õKVRRRK. CHùBA KAZETA..') else
   if predmet='REW' then say(192,9,'BZZZZZ. CHùBA KAZETA..') else
   if predmet='STOP' then say(192,9,'õTUK. CHùBA KAZETA..') else
   if predmet='#' then begin pis(4,9,'            ');
//    move(obrazok^[21*320],mem[$a000:21*320-1],21*320+1);
    telcis:='';say(192,9,'TUUUUT TUT TUUUUT ATÖ...');end else
   if predmet='*' then say(192,9,'TELEFïN NIÄ NEVIE, ASI BOL ODPOJENù.') else
   if (predmet='0')and(kabinet<>4)and(length(telcis)=0) then
   begin
    say(192,9,'HALï. TU RECEPCIA. KTO JE TAM ?');
    say(192,9,'DOBRù DE•. TU JE JEDNA NèVõTEVNIÄKA VèõHO PENZIïNU.');
    say(192,9,'DOBRù DE•. ÄO SI íELèTE ?');
    say(192,9,'AHA, DOVIDENIA. TUUUT TUT TUUUT');
   end else
   if (predmet='0')and(kabinet=4)and(length(telcis)=0) then
   begin
    say(192,9,'HALï. TU RECEPCIA. KTO JE TAM ?');
    say(192,9,'DOBRù DE•. TU JE JEDNA NèVõTEVNIÄKA VèõHO PENZIïNU.');
    say(192,9,'DOBRù DE•. ÄO SI íELèTE ?');
    say(192,9,'CHCELA BY SOM VèS UPOZORNIÜ NA BORDEL V KABINETE.');
    say(192,9,'èNO ? HNEÖ TO ZARIADIM.');
    say(192,9,'DOVIDENIA.');kabinet:=5;
   end else
   if (predmet='0')or(predmet='1')or(predmet='2')or(predmet='3')
    or(predmet='4')or(predmet='6')or(predmet='9') or
    (predmet='5')or(predmet='7')or(predmet='8') then
   begin
    if (predmet='0')and(length(telcis)<>0) then
    begin
     telcis:=telcis+'0';pis(4,9,'ÄãSLO : '+telcis);
//     for b:=0 to 8 do
  //    move(mem[$a000:1*320+9+b*320],obrazok^[1*320+10+b*320],13*6);
    end else
    if predmet='1' then
    begin
     telcis:=telcis+'1';pis(4,9,'ÄãSLO : '+telcis);
//     for b:=0 to 8 do
//      move(mem[$a000:1*320+9+b*320],obrazok^[1*320+10+b*320],13*6);
    end else
    if predmet='2' then
    begin
     telcis:=telcis+'2';pis(4,9,'ÄãSLO : '+telcis);
//     for b:=0 to 8 do
//      move(mem[$a000:1*320+9+b*320],obrazok^[1*320+10+b*320],13*6);
    end else
    if predmet='3' then
    begin
     telcis:=telcis+'3';pis(4,9,'ÄãSLO : '+telcis);
//     for b:=0 to 8 do
//      move(mem[$a000:1*320+9+b*320],obrazok^[1*320+10+b*320],13*6);
    end else
    if predmet='4' then
    begin
     telcis:=telcis+'4';pis(4,9,'ÄãSLO : '+telcis);
//     for b:=0 to 8 do
//      move(mem[$a000:1*320+9+b*320],obrazok^[1*320+10+b*320],13*6);
    end else
    if predmet='6' then
    begin
     telcis:=telcis+'6';pis(4,9,'ÄãSLO : '+telcis);
//     for b:=0 to 8 do
//      move(mem[$a000:1*320+9+b*320],obrazok^[1*320+10+b*320],13*6);
    end else
    if predmet='5' then
    begin
     telcis:=telcis+'5';pis(4,9,'ÄãSLO : '+telcis);
//     for b:=0 to 8 do
//      move(mem[$a000:1*320+9+b*320],obrazok^[1*320+10+b*320],13*6);
    end else
    if predmet='7' then
    begin
     telcis:=telcis+'7';pis(4,9,'ÄãSLO : '+telcis);
//     for b:=0 to 8 do
//      move(mem[$a000:1*320+9+b*320],obrazok^[1*320+10+b*320],13*6);
    end else
    if predmet='8' then
    begin
     telcis:=telcis+'8';pis(4,9,'ÄãSLO : '+telcis);
//     for b:=0 to 8 do
//      move(mem[$a000:1*320+9+b*320],obrazok^[1*320+10+b*320],13*6);
    end else
    if predmet='9' then
    begin
     telcis:=telcis+'9';pis(4,9,'ÄãSLO : '+telcis);
//     for b:=0 to 8 do
//      move(mem[$a000:1*320+9+b*320],obrazok^[1*320+10+b*320],13*6);
    end;
    if telcis='5413387' then
    begin
     say(192,9,'HALï. TU SOM JA ? ALEBO NIE. TAK ÄAU.');
     telcis:='';pis(4,9,'            ');
//     for b:=0 to 8 do
//      move(mem[$a000:1*320+9+b*320],obrazok^[1*320+10+b*320],13*6);
    end;
    if telcis='5411831' then
    begin
     say(192,9,'HALï. KTO JE TU ? TAM SI TY. Aí BUDEõ VEDIEÜ ZAVOLAJ.');
     telcis:='';pis(4,9,'            ');
//     for b:=0 to 8 do
//      move(mem[$a000:1*320+9+b*320],obrazok^[1*320+10+b*320],13*6);
    end;
    if telcis='158' then
    begin
     say(192,9,'POMïC, POMïC.');
     telcis:='';pis(4,9,'            ');
//     for b:=0 to 8 do
//      move(mem[$a000:1*320+9+b*320],obrazok^[1*320+10+b*320],13*6);
    end;
    if telcis='155' then
    begin
     say(192,9,'PRIDAJ SA DO KLUBU... TO JE ASI OMYL.');
     telcis:='';pis(4,9,'            ');
//     for b:=0 to 8 do
//      move(mem[$a000:1*320+9+b*320],obrazok^[1*320+10+b*320],13*6);
    end;
    if telcis='150' then
    begin
     say(192,9,'PREÄO TO NIKDO NEDVãHA ?');
     telcis:='';pis(4,9,'            ');
//     for b:=0 to 8 do
//      move(mem[$a000:1*320+9+b*320],obrazok^[1*320+10+b*320],13*6);
    end;
    if length(telcis)=5 then
    begin
     say(192,9,'TUUUUUUUT TUT TUUUUUUUT. TO JE OMYL.');
     telcis:='';pis(4,9,'            ');
//     for b:=0 to 8 do
//      move(mem[$a000:1*320+9+b*320],obrazok^[1*320+10+b*320],13*6);
    end;
   end else
   if predmet<>'' then say(192,9,'TUUUUUUUT TUT TUUUUUUUT.');
  end else
  {--------------ULICA---------------------------}
  if izba=15 then
  begin
   if predmet<>'' then say(192,9,'TO JE ALE BLBOSÜ.');
  end else
  {--------------PIVNICA---------------------------}
  if izba=14 then
  begin
   if (predmet='TRUHLICA')and(predme<>3) then say(192,9,'NEPASUJE.') else
   if predmet<>'' then say(192,9,'AJ JA SI TO MYSLãM.');
  end else
  {--------------kabinet---------------------------}
  if (izba=8)or(izba=13) then
  begin
   if (predmet='ZèMOK')and(predme=11) then
   begin
    izba:=11;
    loadroom('data\kabinet2');
    predme:=3;
    say(192,9,'VõETKO SA TO NA M•A VYSYPALO.');
    kabinet:=4;zobrazpred;
   end else
   if (predmet='VYPãNAÄ')and(predme=3) then say(192,9,'JA CHCEM SVETLO !!!') else
   if predmet<>'' then say(192,9,'KEÖ BUDEM VELKè, TAK TO URÄITE POCHOPãM.');
  end else
  {--------------izba 5---------------------------}
  if izba=9 then
  begin
   if (predmet='TELEFïN')and(predme=3) then begin telcis:='';izba:=12;loadroom('data\telefon');
   end else
   if predmet<>'' then say(192,9,'NIKTO MóDRY Z NEBA ... AAAAAAA. BUM.');
  end;
 end;
 if cast=2 then
 begin
  {--------------POSCH1---------------------------}
  if izba=1 then
  begin
   if (predmet='ZèMOK')and(predme=18) then
   begin
    if predmal[5] then say(192,9,'Uí TAM NIÄ NIE JE.') ELSE
    if not predmal[4] then say(192,9,'NO URÄITE ! A ÄO POTOM ?') else
    begin say(192,9,'VYTLAÄILA SOM KúóÄIK.');predmal[5]:=true;predme:=3;
    predm[18]:=false;zobrazpred;end;
   end else
   if (predmet='ZèMOK')and(predme=20)and(not predmal[3]) then begin
    say(192,9,'HURè ODOMKLA SOM.');predmal[3]:=true;
   end else
   if (predmet='ZèMOK')and(predme=20)and(predmal[3]) then
    say(192,9,'Uí JE ODOMKNUTê.') else
   if (predmet='PRAH')and(predme=19) then
   begin
    say(192,9,'O.K. VOPCHèM HO TAM.');
    predme:=3;predm[19]:=false;predmal[4]:=true;newspr('data2\poschpa');
    zobrazcele;
   end else
   if predmet<>'' then say(192,9,'TAK Z TOHTO SOM JELE•ICA.');
  end else
   {--------------POSCHod---------------------------}
  if izba=2 then
  begin
   if (predmet='DIERA')and(predme=22) then
   begin
    newspr('data2\poschklu');predmal[6]:=true;predm[22]:=false;predme:=3;
    zobrazcele;say(192,9,'A Uí JE TAM.');
   end else
   if (predmet='ZèMOK')and(predme=20)and(not predmal[3]) then begin
    say(192,9,'HURè ODOMKLA SOM.');predmal[3]:=true;
   end else
   if (predmet='ZèMOK')and(predme=20)and(predmal[3]) then
    say(192,9,'Uí JE ODOMKNUTê.') else
   if (predmet='PRAH')and(predme=19) then
   begin
    say(192,9,'O.K. VOPCHèM HO TAM.');
    predme:=3;predm[19]:=false;predmal[4]:=true;newspr('data2\poschpa');
    zobrazcele;
   end else
   if predmet<>'' then say(192,9,'TAK Z TOHTO SOM JELE•ICA.');
  end else
  {--------------POSCH2---------------------------}
  if izba=3 then
  begin
   if (predme=21)and(predmet='STOLãK') then
   begin predmal[13]:=true;predm[21]:=false;predme:=3;loadspr('data2\posch21');
   zobraz;say(192,9,'PODARILO SA ! JUPã.');end else
   if predmet<>'' then say(192,9,'TAK Z TOHTO SOM JELE•ICA.');
  end else
  {--------------POSCHkup---------------------------}
  if izba=4 then
  begin
   if (predmet='VODOVOD')and(predme=3)and(not predmal[25]) then begin
    newspr('data2\poschku1');zobraz;predmal[25]:=true;end else
   if (predmet='VODOVOD')and(predme=3)and(predmal[25]) then begin
    newspr('data2\poschkup');zobraz;predmal[25]:=false;end else
   if (predmet='VODA')and(predme=31) then begin
    predm[35]:=true;predm[31]:=false;predme:=3;zobrazpred;end else
   if predmet<>'' then say(192,9,'TAK Z TOHTO SOM JELE•ICA.');
  end else
  {--------------POSCHod2---------------------------}
  if izba=5 then
  begin
   if predmet<>'' then say(192,9,'TAK Z TOHTO SOM JELE•ICA.');
  end else
  {--------------POSCHzac---------------------------}
  if izba=6 then
  begin
   if (predmet='õNóRKA')and(predme=23) then begin if win then begin closewin;
    zobraz;end;newspr('data2\poschsnu');predm[23]:=false;predm[24]:=true;predme:=3;
    predmal[9]:=true;zobraz;zobrazpred;end else
   if predmet<>'' then say(192,9,'TAK Z TOHTO SOM JELE•ICA.');
  end else
  {--------------POSCHoby---------------------------}
  if izba=7 then
  begin
   if (predmet='OVLèDAÄ')and(predme=3) then
   begin if predmal[20] then begin newspr('data2\trezor2');zobraz;end else
    begin newspr('data2\trezor1');zobraz;end;end else
   if predmet<>'' then say(192,9,'TAK Z TOHTO SOM JELE•ICA.');
  end else
  {--------------POSCHkuc---------------------------}
  if izba=8 then
  begin
   if predmet<>'' then say(192,9,'TAK Z TOHTO SOM JELE•ICA.');
  end else
  {--------------prizchod---------------------------}
  if izba=9 then
  begin
   if (predmet='RóRA')and(predme=33)and(not predm[27]) then
    say(192,9,'NEMèM JU ÄãM ZATIAHNUÜ.')  else
   if (predmet='RóRA')and(predme=33)and(not predmal[23]) then
    say(192,9,'DVERE NEBUDó UTESNENê.')  else
   if (predmet='RóRA')and(predme=33)and(not predmal[24]) then begin
    predmal[24]:=true;predm[33]:=false;predme:=3;closewin;zobraz;
    predm[27]:=false;newspr('data2\prizcho3');zobraz;zobrazpred;end else
   if (predmet='RóRA')and(predme=26)and(not predm[36]) then
    say(192,9,'VEÖ SA ZADUSãM.') else
   if (predmet='RóRA')and(predme=26)and(predmal[24]) then begin
    predmal[26]:=true;predm[36]:=false;predme:=3;closewin;predm[26]:=false;
    zobraz;zobrazpred;say(192,9,'MYSLãM, íE ICH TO DALO DO PORIADKU.');end else
   if predmet<>'' then say(192,9,'TAK Z TOHTO SOM JELE•ICA.');
  end else
  {--------------prizach---------------------------}
  if izba=10 then
  begin
   if predmet<>'' then say(192,9,'TAK Z TOHTO SOM JELE•ICA.');
  end else
  {--------------prizkuch---------------------------}
  if izba=11 then
  begin
   if predmet<>'' then say(192,9,'TAK Z TOHTO SOM JELE•ICA.');
  end else
  {--------------prizjeda---------------------------}
  if izba=12 then
  begin
   if predmet<>'' then say(192,9,'TAK Z TOHTO SOM JELE•ICA.');
  end else
  {--------------prizoby---------------------------}
  if izba=13 then
  begin
   if (predmet='TELEFïN')and(predme=3)and(not predmal[22]) then begin
    predmal[22]:=true;
    say(192,9,'ZAVOLALA SOM SI TAXãK. BUDE MA ÄAKAÜ VONKU.');
   end else
   if (predmet='TELEFïN')and(predme=3)and(predmal[22]) then
    say(192,9,'Uí MA íIADNE ÄãSLO NENAPADè.') else
   if predmet<>'' then say(192,9,'TAK Z TOHTO SOM JELE•ICA.');
  end else
  {--------------sutere02---------------------------}
  if izba=14 then
  begin
   if predmet<>'' then say(192,9,'TAK Z TOHTO SOM JELE•ICA.');
  end else
  {--------------suteren---------------------------}
  if izba=15 then
  begin
   if (predmet='HADICA')and(predme=29) then
    begin predm[33]:=true;predm[29]:=false;predme:=3;zobrazpred;end else
   if predmet<>'' then say(192,9,'TAK Z TOHTO SOM JELE•ICA.');
  end else
  {--------------sutere01---------------------------}
  if izba=16 then
  begin
   if (predme=25)and(predmet='BED•A') then
   begin
    if predmal[18] then say(192,9,'Uí JE VYRABOVANè.') else
    begin loadspr('data2\sutere11');zobraz;predme:=3;predm[25]:=true;
    zobrazpred;end;
   end else
   if predmet<>'' then say(192,9,'TAK Z TOHTO SOM JELE•ICA.');
  end else
  {--------------prizvcho---------------------------}
  if izba=17 then
  begin
   if predmet<>'' then say(192,9,'TAK Z TOHTO SOM JELE•ICA.');
  end else
 end;
 if cast=3 then
 begin
  if izba=1 then
  begin
   if (predmet='TLAÄãTKO')and(predme=3) then
   begin
    if predmal[1] then say(192,9,'VùÜAH JE Uí TU.') else
    begin say(192,9,'PRIõIEL VùÜAH.');predmal[1]:=true;end;
   end else
   if (predmet='VRèTNICA')and(predme=3) then
   begin
    if predmal[2] then say(192,9,'NEVIEM, NA ÄO SA MèM SPùTAÜ.') else
    begin say(192,9,'HURèè. NAõI Só TU NAOZAJ UBYTOVANù.');predmal[2]:=true;end;
   end else
   if predmet<>'' then say(192,9,'TAK Z TOHTO SOM JELE•ICA.');
  end else
  if izba=2 then
  begin
   if predmet<>'' then say(192,9,'TAK Z TOHTO SOM JELE•ICA.');
  end else
 end;
 end;
end;