procedure prezri;
begin
 if cast=1 then begin
 {--------------izba1---------------------------}
 if izba=1 then
 begin
  if predmet=('KLUÄKA`') then
   say(192,9,'TAKè KOVOVè.');
  if predmet=('DVERE`') then
   say(192,9,'Só RIADNE PEVNê.');
  if predmet='KVETY' then say(192,9,'Só VO•AVê !!!');
  if predmet='ST~L' then say(192,9,'POSKèKALA SOM PO •OM. JE PEVNù.');
  if predmet='OKNO' then say(192,9,'TERAZ SA NECHCEM POZERAÜ.');
  if predmet='VèZA' then say(192,9,'PEKNè, PORCELèNOVè.');
  if predmet='KUCHY•A' then say(192,9,'V KUCHYNI SU óNOSCOVIA ...');
  if predmet='KUCH. LINKA' then say(192,9,'NEVIEM VARIÜ, ALE TERAZ MUSãM óJSÜ ...');
  if predmet='LAMPA' then say(192,9,'NEDOÄIAHNEM NA •U.');
  if predmet='OBRAZ' then say(192,9,'TAKù PEKNù SOM EõTE NEVIDELA.');
  if predmet='FúAõA' then say(192,9,'Tã DVAJA Só ALE OíRANI !');
  if predmet='POKRÄENù PAPIER' then say(192,9,'JE TO ÄISTù PAPIER !');
  if predmet='K~õ' then say(192,9,'NIE JE NA •OM NIÄ ZAUJãMAVê.');
  if predmet='K~õ' then begin
   loadspr('data\detail11');
   if not predm[6] then newspr('data\detail12');
   zobraz;
  end;
  if predmet='MINCA' then begin
   say(192,9,'50 HALIEROV !');end;
 end else
 {--------------chodba---------------------------}
 if izba=2 then
 begin
  if predmet='DVERE`' then say(192,9,'NORMèLNE DREVENNê.');
  if predmet='DVERE'+CHR(1)+'`' then say(192,9,'NORMèLNE DREVENNê.');
  if predmet='DVERE'+CHR(2)+'`' then say(192,9,'NORMèLNE DREVENNê.');
  if predmet='DVERE'+CHR(3)+'`' then say(192,9,'NORMèLNE DREVENNê.');
  if (predmet='PRãZEMIE`')and(not predm[1]) then say(192,9,'SCHODY Só ÄERSTVO UMYTê.');
  if (predmet='PRãZEMIE`')and(predm[1]) then say(192,9,'Uí Só VYSUõENê OD M~JHO PèDU.');
  if predmet='GARNãíA' then say(192,9,'DREVENNè ...');
  if predmet='ZèBRADLIE' then say(192,9,'JE NA TO, ABY úUDIA NEPADLI NA SCHODY.');
  if predmet='VYPãNAÄ' then say(192,9,'CEZ DE• SA NESVIETI.');
  if predmet='NEïNKA' then say(192,9,'JE CELè NEïNOVè.');
  if predmet='OKNO' then say(192,9,'JêêêJ, TO JE VùHúAèèèèD ...');
 end else
 {--------------izba2---------------------------}
 if izba=3 then
 begin
  if predmet='PAPUÄE' then say(192,9,'FóóóóóJ, JAKê SMRADúAVê !!!');
  if predmet='SKRI•A' then
  begin
   if not predmal[15] then say(192,9,'JE ZAMKNUTè, ALE DALA BY SA OTVORIÜ AJ PLIEõKOM.');
   if predmal[15] then begin loadspr('data\detail21');
   if not predm[8] then newspr('data\detail22');zobraz;end;
  end;
  if predmet='SKRI•A' then say(192,9,'SKORO AKO Z DREVA.');
  if predmet='VùCHOD`' then say(192,9,'JE TO VùCHOD AKO KAíDù INù.');
  if predmet='õUPLãK' then say(192,9,'JE PLNù ZBYTOÄNùCH VECã.');
  if predmet='OKNO' then say(192,9,'JE TO VèKUOVê OKNO, AJ DOMA MèME TAKê ...');
   if (predmet='VEúKù õUPLãK')and(predmal[5])and(predmal[10]) then
   begin loadspr('data\detail23');if not predmal[16] then
   newspr('data\detail24');zobraz;end else
  if (predmet='VEúKù õUPLãK')and(predmal[5])and(not predmal[10]) then
   begin loadspr('data\detail23');newspr('data\detail24');zobraz;
    say(192,9,'UFF, PODARILO SA.');predmal[10]:=true;end;
   if (predmet='VEúKù õUPLãK')and(not predmal[5]) then
   begin predmal[5]:=true;say(192,9,'JE ÜAíKù ASI HO NEOTVORãM.');end;
  if predmet='KúóÄ' then say(192,9,'TEN KúóÄ BY SA ZIõIEL.');
  if predmet='LAMPA' then say(192,9,'NEDOÄIAHNEM NA •U.');
  if predmet='SKRINKA' then say(192,9,'NORMèLNE NENORMèLNA SKRINKA.');
  if predmet='PRIMITùVNY ZèMOK' then say(192,9,'BOíE, VRAJ ZèMOK !');
  if predmet='VEõIAKY' then say(192,9,'NIE SOM DOSÜ VYSOKè NA VEõANIE.');
  if predmet='ZRKADLO' then say(192,9,'ZRKADIELKO, ZRKADIELKO, KTO JE NAJKRAJõã NA SVETE ?');
  if predmet='POSTEú' then say(192,9,'TERAZ NECHCEM SPINKAÜ.');
  if predmet='STOLOVè LAMPA' then say(192,9,'LAMPA SA ZAíãNA Aí VEÄER ! ÄO NEVIEõ ?');
  if predmet='ZèVES' then say(192,9,'VEúMI PEKNù ZèVES, ALE NEVIEM ÄO S NãM.');
 end else
 {--------------izba3---------------------------}
 if izba=4 then
 begin
  if predmet='VùCHOD`' then say(192,9,'JE TO VùCHOD AKO KAíDù INù.');
  if predmet='STOLIÄKA' then say(192,9,'èNO. JE TO STOLIÄKA. DOKONCA DREVENNè.');
  if predmet='AKVèRIUM' then begin loadspr('data\detail31');zobraz;end;
  if (predmet='AKVARKO')and(not predmal[2]) then say(192,9,'PLèVAJó V •OM PIRANE. MYSLãM, íE Só HLADNê.');
  if (predmet='AKVARKO')and(predmal[2])and(predmal[8]) then
   say(192,9,'Uí TAM NIE JE NIÄ ZAUJãMAVê.');
  if (predmet='VODA')and(predmal[2])and(predmal[8]) then
   say(192,9,'Uí TAM NIE JE NIÄ ZAUJãMAVê.');
  if (predmet='VODA')and(not predmal[2]) then
   say(192,9,'NIE, NIE, RUKU TAM NESTRÄãM.');
  if (predmet='AKVARKO')and(predmal[2])and(not predmal[8]) then
   say(192,9,'PIRA•U TO VZALO !');
  if (predmet='VODA')and(predmal[2])and(not predmal[8]) then
   say(192,9,'NA DNE VIDãM ZHRDZAVENù KúóÄ.');
  if predmet='ZèVES' then say(192,9,'ODHRNULA SOM HO, ALE NAõLA SOM NIÄ.');
  if predmet='STOLÄEK' then say(192,9,'STOLÄEK PRESTRI SA... PROSãM. Nïïïïïï. ASI JE POKAZENù.');
  if predmet='GARNãíA' then say(192,9,'NIÄ SOM NENAõLA.');
  if predmet='OKNO' then say(192,9,'VONKU JE KRèSNY DE•.');
  if predmet='LUSTER' then say(192,9,'NIÄ POTREBNê NA •OM NEVIDãM.');
  if predmet='KNIíNICA' then say(192,9,'VEúMI ZAUJãMAVê KNIHY, ALE NEMèM ÄAS.');
  if predmet='ST~L' then say(192,9,'VEúMI SA PODOBè NA STARêHO OTCA, ALEBO NIE ?');
  if predmet='POSTEú' then say(192,9,'TAKè TVRDè AKO MOJA. JA CHCEM ãSÜ DOMOV !!!');
 end else
 {--------------izba4---------------------------}
 if izba=5 then
 begin
  if predmet='KNIíNICA' then say(192,9,'AHA. PRãRUÄKA MLADùCH óNOSCOV. JA NEVIEM PãSAÜ.');
  if predmet='POSTEú' then say(192,9,'TAKó ISTó SOM VIDELA V ANTIKVARIèTE.');
  if predmet='SKRI•A' then say(192,9,'JE NA NEJ VYRYTê :BOL SOM TU.  RUMBURAK');
  if predmet='ZèVES' then say(192,9,'NIÄ POTREBNê, LEN ZèVES.');
  if predmet='OKNO' then say(192,9,'VONKU Uí ZAÄãNA PADAÜ LãSTIE ZO STROMOV.');
  if predmet='K~õ' then say(192,9,'NIE JE V •OM NIÄ POTREBNê.');
  if (predmet='ST~L')and(predm[17]) then say(192,9,'JE PRèZDNY. JE NA •OM ASI POL KILA PRACHU.');
  if (predmet='ST~L')and(not predm[17]) then say(192,9,'JE ZAMKNUTù. JE NA •OM ASI POL KILA PRACHU.');
  if predmet='HODINY' then say(192,9,'Só TO DIGITèLKY ?! MALè RUÄIÄKA JE NA TROJKE ...');
  if predmet='HIFI VEíA' then say(192,9,'ZNAÄKA : MOCKBA ELEKTRONIKA.');
  if predmet='LUSTER' then say(192,9,'EõTE SVIETI SVETLO. NETREBA HO ZAPãNAÜ.');
  if predmet='VùCHOD`' then say(192,9,'JE TO VùCHOD AKO KAíDù INù.');
 end else
 {--------------chodba1---------------------------}
 if izba=6 then
 begin
  if (predmet='KUCHY•A`') then say(192,9,'M•AM, M•AM.');
  if (predmet='KABINET`')and(kabinet=3) then say(192,9,'JE ZAMKNUTù.') else
  if predmet='KABINET`' then say(192,9,'NIÄ ZAUJãMAVêHO.');
  if predmet='DVERE`' then  say(192,9,'NIÄ ZAUJãMAVêHO.');
  if (predmet='ULICA`')and(predmal[14]) then say(192,9,'MUSãM óJSÜ, KùM SA Tù ! PããããP ! NEZOBUDIA.');
  if (predmet='ULICA`')and(not predmal[14]) then
   say(192,9,'VRèTNIK MA NECHCE PUSTIÜ, KùM MU NEDèM KúóÄ OD IZBY.');
  if predmet='VRèTNICA' then say(192,9,'JE CELè DREVENNè.');
  if (predmet='VRèTNIK')and(not predmal[14]) then
   say(192,9,'VRèTNIK SI MA POZORNE OBZERè. AJ JA SI HO OBZERèM.');
  if (predmet='VRèTNIK')and(predmal[14]) then
   say(192,9,'ASI BY HO BOLO TREBA ODVIEZÜ DO NEMOCNICE.');
  if predmet='POSCHODIE`' then say(192,9,'CESTOU POSCHODOCH, POSCHODOCH...');
  if predmet='VYPãNAÄ' then say(192,9,'CEZ DE• SA NESVIETI.');
 end else
 {--------------kuchy§a---------------------------}
 if izba=7 then
 begin
  if predmet='VùCHOD`' then say(192,9,'JE TO VùCHOD AKO KAíDù INù.');
  if predmet='KACHLIÄKY' then say(192,9,'Só TO KACHLIÄKY BIELEJ FARBY A Só õPINAVê.');
  if predmet='NEïNKA' then say(192,9,'AJ BY SOM JU CHCELA, ALE JE VYSOKO.');
  if predmet='OKNO' then say(192,9,'JE õPINAVê.');
  if predmet='VODOVODNè BATêRIA' then say(192,9,'NEMèM DO ÄOHO NABRAÜ VODU.');
  if predmet='UMùVADLO' then say(192,9,'JE PEKNE VYÄISTENê.');
  if predmet='ST~L' then say(192,9,'NEVIEM, ÄO S NãM.');
  if predmet='STOLIÄKA' then say(192,9,'AJ BY SOM SI SADLA, ALE NEMèM ÄAS.');
  if predmet='DRES' then say(192,9,'JE PRãLIõ TAíKù.');
  if predmet='õPAJZA' then
   begin loadspr('data\detail41');if not predmal[4] then newspr('data\detail42');zobraz;end;
  if predmet='STEHNO' then say(192,9,'M•AM, M•AM.');
  if predmet='VYTRHNUTè RóÄKA' then say(192,9,'ASI Mè OPRAVèR DOVOLENKU.');
  if predmet='KORENIÄKY' then begin loadspr('data\detail43');zobraz;end;
  if predmet='SKRI•A' then say(192,9,'SKORO AKO õPAJZA.');
  if predmet='KORENIE' then say(192,9,'HAPÄãK.');
  if predmet='KORENIÄKA' then say(192,9,'JE TO NèDOBA NA KORENIE S HODINOVùM VRCHNèKOM.');
  if predmet='VRCHNèK' then say(192,9,'ÄASOVê ZNAMENIE OHLèSILO 4:61 HODãN.');
  if predmet='SKRINKA' then say(192,9,'PRèZDNA.');
  if predmet='POLIÄKA NA KORENIÄKY' then say(192,9,'DRíã PEVNE.');
 end else
 {--------------kabinet---------------------------}
 if izba=8 then
 begin
  if predmet='VùCHOD`' then say(192,9,'JE TO VùCHOD AKO KAíDù INù.');
  if predmet='METLA' then say(192,9,'TO JE TAKè PALICA SO STRAPATùM NA KONCI.');
  if predmet='ZèMOK' then say(192,9,'JE TO KOVOVù ZèMOK. BEZ KúóÄA HO ASI NEOTVORãM.');
  if predmet='RóRY' then say(192,9,'PREHLIADLA SOM ICH, ALE NIÄ PODOZRIVê NA NICH NIE JE.');
  if predmet='OKNO' then say(192,9,'NEDè SA OTVORIÜ. JE PRIPEVNENê VEúMI PEVNE.');
  if predmet='KRABICA' then say(192,9,'SCHOVALA SOM SA DO NEJ, ALE HNEÖ SOM VYLIEZLA.');
  if predmet='RIEDIDLO' then say(192,9,'JE RIEDKE.');
  if predmet='POKLOP`' then say(192,9,'JE PRIVALENù SKRI•OU.');
  if predmet='LEP' then say(192,9,'JE VYSOKO.');
  if predmet='LUSTER' then say(192,9,'JE TO OBYÄAJNù KUS PLECHU, NIÄ MOÄ.');
  if predmet='PLECHOVè SKRI•A' then say(192,9,'JE CELè VYROBENè Z PEVNêHO PLECHU.');
  if predmet='VEDRO' then say(192,9,'EõTE JE MOKRê, MUSELO SA S NãM PRED CHVãúOU UMùVAÜ.');
  if predmet='POLIÄKA' then say(192,9,'PREHLIADLA SOM JU. JE TO POLIÄKA ? ASI !');
  if predmet='VYPãNAÄ' then say(192,9,'BOíE AKê TRèPNE. NèJSÜ VYPãNAÄ !');
 end else
 {--------------kabinet tma---------------------------}
 if izba=10 then
 begin
  if predmet='VùCHOD`' then say(192,9,'JE TO VùCHOD AKO KAíDù INù.');
  if predmet='METLA' then say(192,9,'TO JE TAKè PALICA SO STRAPATùM NA KONCI.');
  if predmet='RóRY' then say(192,9,'JE ICH VIDIEÜ LEN SLABO.');
  if predmet='OKNO' then say(192,9,'JE CELê ZAPRAõENê.');
  if predmet='KRABICA' then say(192,9,'NEDOÄIAHNEM.');
  if predmet='POKLOP`' then say(192,9,'JE PRIVALENù SKRI•OU.');
  if predmet='RIEDIDLO' then say(192,9,'JE RIEDKE.');
  if predmet='ZèMOK' then say(192,9,'SKORO HO NIE JE VIDIEÜ.');
  if predmet='LEP' then say(192,9,'JE VYSOKO.');
  if predmet='LUSTER' then say(192,9,'JE TO OBYÄAJNù KUS PLECHU, NIÄ MOÄ.');
  if predmet='PLECHOVè SKRI•A' then say(192,9,'JE CELè VYROBENè Z PEVNêHO PLECHU.');
  if predmet='VEDRO' then say(192,9,'EõTE JE MOKRê, MUSELO SA S NãM PRED CHVãúOU UMùVAÜ.');
  if predmet='VYPãNAÄ' then say(192,9,'YES, SWI.. VYPãNAÄ.');
  if predmet='POLIÄKA' then say(192,9,'PREHLIADLA SOM JU. JE TO POLIÄKA, ALEBO NIE ?');
 end else
 {KABINET BORDEL}
 if izba=11 then
 begin
  if predmet='CHODBA`' then say(192,9,'NORMèLNA CHODBA.');
  if predmet='HARABURDY' then begin loadspr('data\detail51');
   if not predmal[9] then newspr('data\detail52');zobraz;end;
  if predmet='íELEZNè PALICA' then say(192,9,'JE PRãLIõ ÜAíKè.');
  if predmet='HELMA' then say(192,9,'JE TOTèLNE ZACEMENTOVANè.');
  if predmet='POKLOP`' then say(192,9,'JE PRIVALENù SKRI•OU.');
  if predmet='RóRY' then say(192,9,'PREHLIADLA SOM ICH, NIÄ PODOZRIVê NA NICH NIE JE.');
  if predmet='METLA' then say(192,9,'TO JE TAKè PALICA SO STRAPATùM NA KONCI.');
  if predmet='OKNO' then say(192,9,'NEDè SA OTVORIÜ. JE PRIPEVNENê NA PEVNO.');
  if predmet='KRABICA' then say(192,9,'SCHOVALA SOM SA DO NEJ, ALE HNEÖ SOM VYLIEZLA.');
  if predmet='LEP' then say(192,9,'JE VYSOKO.');
  if predmet='LUSTER' then say(192,9,'JE TO OBYÄAJNù KUS PLECHU, NIÄ MOC.');
  if predmet='PLECHOVè SKRI•A' then say(192,9,'JE CELè VYROBENè Z PEVNêHO PLECHU.');
  if predmet='VEDRO' then say(192,9,'EõTE JE MOKRê, MUSELO SA S NãM PRED CHVãúOU UMùVAÜ.');
  if predmet='POLIÄKA' then say(192,9,'PREHLIADLA SOM JU. JE TO POLIÄKA, ALEBO NIE ?');
  if predmet='SKRI•A' then say(192,9,'JE CELè VYROBENè Z PEVNêHO PLECHU.');
  if predmet='PALICA' then say(192,9,'JE PRãLIõ ÜAíKè.');
  if predmet='FúAõA' then say(192,9,'JE Uí VYPITè.');
  if predmet='õROBOVèK' then say(192,9,'Uí JE VYDRATù.');
  if predmet='HELMA'+#01 then say(192,9,'õPINAVè A VEúKè.');
 end else
 {-------------- kabinet - poklop --------------------------}
 if izba=13 then
 begin
  if predmet='VùCHOD`' then say(192,9,'JE TO VùCHOD AKO KAíDù INù.');
  if predmet='METLA' then say(192,9,'TO JE TAKè PALICA SO STRAPATùM NA KONCI.');
  if predmet='ZèMOK' then say(192,9,'JE TO KOVOVù ZèMOK. BEZ KúóÄA HO ASI NEOTVORãM.');
  if predmet='RóRA' then say(192,9,'PREHLIADLA SOM JU, ALE NIÄ PODOZRIVê NA NEJ NIE JE.');
  if predmet='OKNO' then say(192,9,'NEDè SA OTVORIÜ. JE PRIPEVNENê NA PEVNO.');
  if predmet='KRABICA' then say(192,9,'SCHOVALA SOM SA DO NEJ, ALE HNEÖ SOM VYLIEZLA.');
  if predmet='RIEDIDLO' then say(192,9,'JE RIEDKE.');
  if predmet='POKLOP`' then say(192,9,'KEÖ TO TU UPRATOVALI, MUSELI ODSUNóÜ SKRI•U.');
  if predmet='LEP' then say(192,9,'JE VYSOKO.');
  if predmet='LUSTER' then say(192,9,'JE TO OBYÄAJNù KUS PLECHU, NIÄ MOÄ.');
  if predmet='PLECHOVè SKRI•A' then say(192,9,'JE CELè VYROBENè Z PEVNêHO PLECHU.');
  if predmet='VEDRO' then say(192,9,'EõTE JE MOKRê, MUSELO SA S NãM PRED CHVãúOU UMùVAÜ.');
  if predmet='POLIÄKA' then say(192,9,'PREHLIADLA SOM JU. JE TO POLIÄKA, ALEBO NIE ?');
  if predmet='VYPãNAÄ' then say(192,9,'BOíE AKê TRèPNE. NèJSÜ VYPãNAÄ !');
 end else
 {-------------- ULICA --------------------------}
 if izba=15 then
 begin
  if predmet='DO PENZIïNU`' then say(192,9,'NASPéÜ SA MI VERU NECHCE.');
  if predmet='LAMPA' then say(192,9,'NORMèLNA 8 METROVè LAMPA.');
  if predmet='REKLAMA' then say(192,9,'REKLAMA NA BAVLNENê PADèKY.');
  if predmet='DVERE`' then say(192,9,'Só ZAMKNUTê.');
  if predmet='OKNO' then say(192,9,'NEDè SA OTVORIÜ. JE PRIPEVNENê PEVNE.');
  if predmet='DO MESTA`' then say(192,9,'JUPããã, KONEÄNE PREÄ.');
 end else
 {--------------PiVNICA-----------------------}
 if izba=14 then
 begin
  if predmet='REBRãK`' then say(192,9,'JE PEVNù A DREVENNù.');
  if predmet='DIERA' then say(192,9,'VIDãM KABINET A POÄUJEM SVETLO !');
  if predmet='TRUHLICA' then say(192,9,'NEMèM KúóÄIK A POKLOP JE TAíKù.');
  if predmet='SUD' then say(192,9,'JA SA SóDU BOJãM.');
  if predmet='DEMIíïN' then say(192,9,'JE PRèZDNY.');
  if predmet='FúAõA' then say(192,9,'JE SKORO PRèZDNA.');
  if predmet='FúAõA' then say(192,9,'JE PLNè VãNA.');
  if predmet='FúAõA'+#3 then say(192,9,'JE SKORO PRèZDNA.');
  if predmet='POLIÄKA' then say(192,9,'SLóíI NA POKLADANIE FLIAõ.');
  if predmet='PRASKNUTè FúAõA' then say(192,9,'JE PRASKNUTè.');
 end else
 {--------------izba 5 telefon-----------------------}
 if izba=12 then
 begin
  if predmet='IZBA`' then say(192,9,'Uí MA TO NEBAVãããã !');
  if predmet='SLóCHADLO' then say(192,9,'NESLóCHA. ASI JE POKAZENê.');
  if predmet='MIESTO NA KAZETY' then say(192,9,'STRÄ PRST SKRZ KRK ...');
  if predmet='KóSOK PAPIERA' then say(192,9,'NIEKTO SóRNE POTREBOVAL PAPIER. ASI NA WC.');
  if predmet='PLAY' then say(192,9,'POTLAÄ.');
  if predmet='REC' then say(192,9,'POTLAÄ.');
  if predmet='REW' then say(192,9,'POTLAÄ.');
  if predmet='STOP' then say(192,9,'POTLAÄ.');
  if predmet='#' then say(192,9,'POTLAÄ.');
  if predmet='*' then say(192,9,'POTLAÄ.');
  if predmet='0' then say(192,9,'POTLAÄ.');
  if predmet='1' then say(192,9,'POTLAÄ.');
  if predmet='2' then say(192,9,'POTLAÄ.');
  if predmet='3' then say(192,9,'POTLAÄ.');
  if predmet='4' then say(192,9,'POTLAÄ.');
  if predmet='6' then say(192,9,'POTLAÄ.');
  if predmet='5' then say(192,9,'POTLAÄ.');
  if predmet='7' then say(192,9,'POTLAÄ.');
  if predmet='8' then say(192,9,'POTLAÄ.');
  if predmet='9' then say(192,9,'POTLAÄ.');
 end else
 {--------------izba 5---------------------------}
 if izba=9 then
 begin
  if predmet='VùCHOD`' then say(192,9,'JE TO VùCHOD AKO KAíDù INù.');
  if predmet='SEKRETèR' then begin loadspr('data\detail61');
   if not predmal[13] then newspr('data\detail62');zobraz;end;
  if predmet='SEKRETèR' then say(192,9,'S KùM JE ASI JEHO MANíELKA ?');
  if predmet='KúóÄ' then say(192,9,'KRIÄã NA M•A ABY SOM SI HO ZOBRALA.');
  if predmet='STOLãK' then say(192,9,'JE NA •OM POLOíENù TELEFïN.');
  if predmet='NèBYTOK' then say(192,9,'JE VYROBENù Z BOROVICE.');
  if predmet='GAUÄ' then say(192,9,'JE VYíRATù MOúAMI.');
  if predmet='LUSTER' then say(192,9,'TIETO LUSTRE MA Uí NUDIA, KTO SI ICH Mè PREZERAÜ.');
  if predmet='TELEFïN' then begin telcis:='';izba:=12;loadroom('data\telefon');end;
  if predmet='SKRI•A' then say(192,9,'KEÖ SA NA TO POZRIEM, NIÄ NEVIDãM.');
  if predmet='OKNO' then say(192,9,'PRI PODROBNOM PREHLIADNUTã SOM NAõLA VELKù P.. .');
 end;
 end;
 if cast=2 then
 begin
 {--------------posch 1-----------------------}
 if izba=1 then
 begin
  if predmet='VSUNUTù PLAGèT' then say(192,9,'NAJLEPõIE BY BOLO HO VYTIAHNUÜ.');
  if predmet='KúUÄKA' then say(192,9,'TAKè KOVOVè.');
  if predmet='DVERE`' then say(192,9,'Só ZAMKNUTê. ASI ABY SOM NEUõLA !');
  if predmet='PLAGèT' then say(192,9,'SUPER ! KDE HO ZOHNALI !');
  if predmet='ZèMOK' then say(192,9,'DO ZèMKU SA PCHAJó KúóÄE.');
  if predmet='ZèRUB•A' then say(192,9,'AKè ZèRUB•A ? ÄO ? JèèèJ. ZèRUB•A. Nïïï.');
  if predmet='NèBYTOK' then say(192,9,'JE MI NA NIÄ.');
  if predmet='RóÄKA' then say(192,9,'PODALA SOM JE RóÄKU.');
  if predmet='PRAH' then say(192,9,'VIDãM TADIAú NA CHODBU.');
  if predmet='DR~TIK' then say(192,9,'PCHE. JEDEN DRïT MI NEPOM~íE.');
  if predmet='OBTRHANù PLAGèT' then say(192,9,'JA SA ZA TO TAK STRAõNE HAMBãM.');
 end else
 if izba=2 then
 begin
  if predmet='OBRèZOK' then say(192,9,'SCREEN SHOT Z óTEKU.');
  if predmet='DVERE`' then say(192,9,'SêZAM OTVOR SA.');
  if predmet='DVERE`' then say(192,9,'SêZAM OTVOR SA.');
  if predmet='DVERE`' then say(192,9,'SêZAM OTVOR SA.');
  if predmet='ZèMOK' then say(192,9,'DO ZèMKU SA PCHAJó KúóÄE.');
  if predmet='CHODBA`' then say(192,9,'TREBA STóPIÜ úAVOU NOHOU DO úAVA.');
  if predmet='KúóÄOVè DIERKA' then say(192,9,'VIDãM CEZ •U TMU.');
  if predmet='DIERA' then say(192,9,'NEVOPCHèM SA.');
 end else
 if izba=3 then
 begin
  if predmet='POSTEú' then say(192,9,'NEMèM ÄAS.');
  if predmet='STOLãK' then say(192,9,'TOALETNù STOLãK.');
  if predmet='NOíNICE' then say(192,9,'Só RIADNE OSTRê.');
  if predmet='STOLãK' then begin
   if predmal[13] then begin
    if predmal[12] then begin loadspr('data2\posch22');zobraz;end else
     begin loadspr('data2\posch21');zobraz;end;
   end else say(192,9,'JE ZAMKNUTù.');
  end;
  if predmet='DVERE`' then say(192,9,'SKóS ICH OTVORIÜ.');
  if predmet='ZèMOK' then say(192,9,'DO ZèMKU SA PCHAJó KúóÄE.');
  if predmet='ZèRUB•A' then say(192,9,'AKè ZèRUB•A ? ÄO ? JèèèJ. ZèRUB•A. Nïïï.');
  if predmet='SKRI•A' then say(192,9,'JE MI NA NIÄ.');
  if predmet='KúóÄ' then say(192,9,'JE PRIZVèRANù.');
 end else
 if izba=4 then
 begin
  if predmet='OKNO' then say(192,9,'Uí JE LETO.');
  if predmet='VODOVOD' then say(192,9,'NETEÄIE TEPLè VODA.');
  if predmet='VODA' then say(192,9,'NIE JE TO NèHODOU VODA ?');
  if predmet='SPRCHA' then say(192,9,'NAPOSLEDY SOM SA SPRCHOVALA MINULê VIANOCE.');
  if predmet='MYDLO' then say(192,9,'VO•AVê.');
  if predmet='PODLOíKA NA MYDLO' then say(192,9,'JE PODLOíENè POD MYDLO.');
  if predmet='UMùVADLO' then say(192,9,'UMYJEM SI RUKY, NOHY, ...');
  if predmet='VA•A' then say(192,9,'JE NENAPUSTENè.');
  if predmet='UTERèK' then say(192,9,'VONIA LENOROM A KRVAVùM SLIZOM.');
  if predmet='VEõIAK' then say(192,9,'JE ZO ZLATA.');
  if predmet='õNóRA' then say(192,9,'ASI JE TO HRDZAVù DR~T, ALE KTO VIE ?');
  if predmet='õTIPEC' then say(192,9,'õTãPE. KOMèR JEDEN HNUSNù.');
  if predmet='RóRA' then say(192,9,'JE HORóCA.');
  if predmet='DIERA' then say(192,9,'MALA BY TADIAú VYTEKAÜ VODA.');
  if predmet='VùCHOD`' then say(192,9,'VEÖ Uí IDEM.');
 end else
 if izba=5 then
 begin
  if predmet='OBRèZOK' then say(192,9,'SCREEN SHOT Z DOOMA 2.');
  if predmet='OBRèZOK' then say(192,9,'SCREEN SHOT Z MANICA MINER 2000.');
  if predmet='OBRèZOK' then say(192,9,'SCREEN SHOT Z HERETICA.');
  if predmet='OBRèZOK' then say(192,9,'SCREEN SHOT Z óTEKU. ');
  if predmet='DVERE`' then say(192,9,'SêZAM OTVOR SA.');
  if predmet='DVERE`' then say(192,9,'SêZAM OTVOR SA.');
  if predmet='DVERE`' then say(192,9,'SêZAM OTVOR SA.');
  if predmet='ZèMOK' then say(192,9,'DO ZèMKU SA PCHAJó KúóÄE.');
  if predmet='CHODBA`' then say(192,9,'TREBA STóPIÜ PRAVOU NOHOU DO PRAVA.');
 end else
 if izba=6 then
 begin
  if predmet='ZVON' then say(192,9,'CINGI LINGI BOM.');
  if predmet='VENTILèTOR' then say(192,9,'FIJó Fã. SOM SLNEÄNù VIETOR.');
  if predmet='SPLACHOVAÄ' then say(192,9,'EõTE NIEJE PLNè MISA.');
  if predmet='õNóRKA' then say(192,9,'CHYTILA V~•U.');
  if predmet='MISA' then say(192,9,'PLNè DO TROCH õTVRTãN.');
  if predmet='POKLOP' then say(192,9,'ABY NEUNIKALI PLYNY.');
  if predmet='NèDRí' then say(192,9,'JE TAM ÄISTè VODA. ASPO• DóFAM.');
  if predmet='RóRA' then say(192,9,'NECHCEM ANI VEDIEÜ ÄO JE VNóTRI.');
  if predmet='VùCHOD`' then say(192,9,'EõTE CHVãúU.');
  if predmet='RóÄKA' then say(192,9,'DRíã PEVNE.');
  if predmet='PAPIER' then say(192,9,'SILA.');
  if predmet='TOALETNù PAPIER' then begin loadspr('data2\zachodet');zobraz;end;
 end else
 if izba=7 then
 begin
  if predmet='TREZOR' then say(192,9,'VEÖ NIE JE ZAMKNUTù.');
  if predmet='OVLèDAÄ' then say(192,9,'SKóS ZATOÄIÜ.');
  if predmet='PENIAZE' then say(192,9,'JêêJ. CELè KOPA PE•AZã. JEDNA. DVE. ...');
  if predmet='OKNO' then say(192,9,'FóKA STUDENù ZIMNù VIETOR.');
  if predmet='BALKïNOVê DVERE' then say(192,9,'ZAMKNUTê.');
  if predmet='OBRAZ' then
  begin loadspr('data2\trezor');zobraz;end;
  if predmet='LUSTER' then say(192,9,'NESVIETI.');
  if predmet='DVERE`' then say(192,9,'NIKAM NEJDEM.');
  if predmet='STOLãK' then say(192,9,'Uí ZAS ?');
  if predmet='ÄASOPIS' then say(192,9,'NIE JE TO RIKI ? NIE.');
  if predmet='POPOLNãK' then say(192,9,'JE óPLNE PRèZDNY.');
  if predmet='FúAõA' then say(192,9,'Uí JE DOPITè.');
  if predmet='POHèR' then say(192,9,'JE PRèZDNY.');
  if predmet='SEDAÄKA' then say(192,9,'NEMèM ÄAS.');
  if predmet='VùCHOD`' then say(192,9,'PèÄI SA MI TU.');
 end else
 if izba=8 then
 begin
  if predmet='OKNO' then say(192,9,'OPADèVAJó LISTY ZO STROMOV.');
  if predmet='LAVICA' then say(192,9,'NEPOTREBUJEM.');
  if predmet='ST~L' then say(192,9,'JE TO O NIÄOM.');
  if predmet='KACHLIÄKY' then say(192,9,'TAKê õTVORCE NAUKLADANê VEDúA SEBA.');
  if predmet='VODOVOD' then say(192,9,'VEDIE VODU.');
  if predmet='õUPLãK' then begin
   if predmal[10] then begin loadspr('data2\kuchdet1');zobraz;end;
   if not predmal[10] then begin loadspr('data2\kuchdet');zobraz;end;
  end;
  if predmet='PRãBOR' then say(192,9,'TO SA NA ÄO POUíãVA ?');
  if predmet='VùVRTKA' then say(192,9,'TOÄã SA.');
  if predmet='SKRINKA' then say(192,9,'ÄO S •OU.');
  if predmet='POLIÄKA' then say(192,9,'NEMèM SI ÄO ODLOíIÜ.');
  if predmet='VùCHOD`' then say(192,9,'Uí ZAS ?');
 end else
 if izba=9 then
 begin
  if predmet='DVERE`' then say(192,9,'NIKAM NEJDEM.');
  if predmet='DVERE`' then say(192,9,'NIKAM NEJDEM.');
  if predmet='DVERE`' then say(192,9,'NIKAM NEJDEM.');
  if predmet='DVERE`' then say(192,9,'NIKAM NEJDEM.');
  if predmet='DVERE`' then say(192,9,'NIKAM NEJDEM.');
  if predmet='PLYNOVù MERAÄ' then
   begin if predmal[24] then begin loadspr('data2\prizcho4');zobraz;end else
   begin loadspr('data2\prizcho1');zobraz;end;end;
  if predmet='SKRINKA' then say(192,9,'JE CELè DREVENNè.');
  if predmet='DISPLAY' then say(192,9,'UKAZUJE ÄIERNU FARBU.');
  if predmet='HANDRA' then say(192,9,'FóóJ SMRDã.');
  if predmet='HADICA' then say(192,9,'JE AKèSI KúUKATè.');
  if predmet='RóRA' then say(192,9,'ASI Mè íLTAÄKU.');
  if predmet='HORE`' then say(192,9,'DOLE, DOLE.');
  if predmet='DOLE`' then say(192,9,'HORE, HORE.');
 end else
 if izba=10 then
 begin
  if predmet='SPLACHOVAÄ' then say(192,9,'EõTE NIEJE PLNè MISA.');
  if predmet='VODOVOD' then say(192,9,'Uí HO DRíãM.');
  if predmet='ZèCHODOVè MISA' then say(192,9,'PLNè DO TROCH õTVRTãN.');
  if predmet='UMùVADLO' then say(192,9,'NIE ! RUKY SI NEUMYJEM !');
  if predmet='NèDRí' then say(192,9,'JE TAM ÄISTè VODA. ASPO• DóFAM.');
  if predmet='RóRA' then say(192,9,'NECHCEM ANI VEDIEÜ ÄO JE VNóTRI.');
  if predmet='DVERE`' then say(192,9,'EõTE CHVãúU.');
  if predmet='DRíIAK' then say(192,9,'DRíã PEVNE.');
  if predmet='TOALETNù PAPIER' then say(192,9,'TAKù õPINAVù ? BOíE.');
  if predmet='HANDRA' then say(192,9,'NEVIZERè BYÜ VEúMI ÄISTè.');
 end else
 if izba=11 then
 begin
  if predmet='N~í' then say(192,9,'èUU. POREZALA SOM SA.');
  if predmet='SKRINKA' then say(192,9,'JE PRèZNDA.');
  if predmet='DRES' then say(192,9,'NEJAKù JE MOKRù.');
  if predmet='UMùVADLO' then say(192,9,'NIE ! RUKY SI NEUMYJEM !');
  if predmet='VODOVOD' then say(192,9,'TEÄIE V •OM VODA.');
  if predmet='OKNO' then say(192,9,'Uí JE ZNOVA JAR ?');
  if predmet='SKRI•A' then say(192,9,'TIEí PRèZDNA.');
  if predmet='STOLÄEK' then say(192,9,'NOT ENOUGH TIME.');
  if predmet='DVERE`' then say(192,9,'EõTE CHVãúU.');
  if predmet='DVERE`' then say(192,9,'EõTE CHVãúU.');
  if predmet='STOLIÄKA' then say(192,9,'JE ÄERSTVO NALAKOVANè.');
 end else
 if izba=12 then
 begin
  if predmet='OKNO' then say(192,9,'SILA. SNEíã. YES. SNEíããã.');
  if predmet='VèZA' then say(192,9,'A KDE Só KVETY ?.');
  if predmet='ST~L' then say(192,9,'JE NA •OM POLOíENè VèZA.');
  if predmet='OBRóSOK' then say(192,9,'BEREM. DAVAJ. BEREM.');
  if predmet='STOLIÄKA' then say(192,9,'MHHHH. DREVENNè.');
  if predmet='DVERE`' then say(192,9,'TIEí BY MOHLI BYÜ INAKõIE.');
  if predmet='VùCHOD' then say(192,9,'ANI CHVãúU NEÄAKAJ A CHOÖ.');
 end else
 if izba=13 then
 begin
  if predmet='ST~L' then say(192,9,'ZASE ST~L. TO SI EõTE NEVIDEL ST~L ?');
  if predmet='MISKA' then say(192,9,'PEKNE VYTIE•OVANè.');
  if predmet='TELEFïN' then say(192,9,'MALù EUROTELãK.');
  if predmet='KRESLO' then say(192,9,'HOJDI, HOJDI. TO NIE JE HOJDACIE ?');
  if predmet='LAMPA' then say(192,9,'NIE JE TAM íIAROVKA.');
  if predmet='DVERE`' then say(192,9,'VõAK SI CHOÖ.');
  if predmet='VùCHOD`' then say(192,9,'OPAK VùCHODU JE ZèCHOD.');
 end else
 if izba=14 then
 begin
  if predmet='MLèKA' then say(192,9,'ÄISTè VODA. SRANDA.');
  if predmet='KONõTRUKCIA' then say(192,9,'JE RIADNE PEVNè.');
  if predmet='SCHODY' then say(192,9,'NEMAJó ZABRADLIE !');
  if predmet='HORE`' then say(192,9,'DIERA V STROPE ?');
  if predmet='REBRãK' then say(192,9,'POZOR ABY NESPADOL.');
  if predmet='VEDúA`' then say(192,9,'EõTE SEKUNDIÄKU.');
  if predmet='VEDúA`' then say(192,9,'EõTE CHVãúU.');
 end else
 if izba=15 then
 begin
  if predmet='OKNO' then say(192,9,'BOíE TO JE ALE DUSNO.');
  if predmet='VEDRO' then say(192,9,'JE PRèZDNE.');
  if predmet='REBRãK' then say(192,9,'JE TROCHU ÄUDNù.');
  if predmet='HADICA' then say(192,9,'POZOR ! HAD ! UTEKAJ PREÄ ! TO JE HADICA ? AHA.');
  if predmet='VYPãNAÄ' then say(192,9,'ÄIK.');
  if predmet='VEDúA`' then say(192,9,'TAM RADõEJ NECHOÖ !');
 end else
 if izba=16 then
 begin
  if predmet='VYPãNAÄ' then say(192,9,'ÄIK.');
  if predmet='KONõTRUKCIA' then say(192,9,'DRíã PEVNE.');
  if predmet='KRABICA' then say(192,9,'JE PRãLIõ VYSOKO.');
  if predmet='ZAVèRANINA' then say(192,9,'Uí JE POKAZENè.');
  if predmet='BED•A' then say(192,9,'JE CELè ZAOLEJOVANè.');
  if predmet='HARABURDY' then say(192,9,'JêJ. OLEJNIÄKA, KOMBINAÄKY A KúóÄ.');
  if predmet='SèNKY' then say(192,9,'CHOÖ O POSCHODIE VYíõIE DO JEDèLNE A POZRI Z OKNA.');
  if predmet='PNEUMATIKA' then say(192,9,'JE PRASKNUTè.');
  if predmet='VIDLY' then say(192,9,'NAPICHNEM SA NA NE ? NIE.');
  if predmet='MOTYKA' then say(192,9,'BUDEM IM TU RùúOVAÜ ZAHRADU ! NO URÄITE !');
  if predmet='OKNO' then say(192,9,'PANE BOíE. Uí PADAJó LISTY.');
  if predmet='MLèKA' then say(192,9,'ÄISTè VODA.');
  if predmet='VEDúA`' then say(192,9,'NECHOÖ TAM !');
  if predmet='SCHODY' then say(192,9,'Só NEJAKê KúUKATê.');
 end else
 if izba=17 then
 begin
  if predmet='POLIÄKA' then say(192,9,'JE RIADNE ZAPRèõENè.');
  if predmet='SKRINKA NA OBUV' then say(192,9,'SRANDA. JE PRèZDNA. ONI Só VõETCI OBUTã.');
  if predmet='GARNãíA' then say(192,9,'ABY NESPADLA.');
  if predmet='ZèVES' then say(192,9,'JE CELù õPINAVù.');
  if predmet='OKNO' then say(192,9,'Uí SA SPRèZDNINIEVA.');
  if predmet='DVERE`' then say(192,9,'TO Só DVERE VON.');
  if predmet='VùCHOD`' then say(192,9,'Uí IDEM.');
  if predmet='KúUÄKA' then say(192,9,'JE CELè KOVOVè.');
 end else
 end;
 if cast=3 then
 begin
 if izba=1 then
 begin
  if predmet='OVLèDAÄ' then say(192,9,'Dè SA S NãM ZAVOLAÜ VùÜAH.');
  if predmet='TLAÄãTKO' then say(192,9,'VõAK HO STLAÄ !');
  if predmet='VùÜAH`' then say(192,9,'Mè PLECHOVê DVERE.');
  if predmet='VRèTNICA' then say(192,9,'SEDã V NEJ VRèTNIK.');
 end else
 if izba=2 then
 begin
  if predmet='DVERE`' then say(192,9,'SêZAM OTVOR SA.');
  if predmet='DVERE`' then say(192,9,'Uí SA TEõãM.');
  if predmet='KúUÄKA' then say(192,9,'PODALA SOM JEJ RUKU.');
 end;
 end;
end;