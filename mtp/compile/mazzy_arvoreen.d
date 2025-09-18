BEGIN tb#arvor

IF ~~ THEN BEGIN gift
SAY @178 = @179 = @180 = @181 = @182
IF ~~ THEN REPLY @183 DO ~SetGlobal("mazzyisgoingtobeapaladinkit","global",2) GiveItemCreate("tb#swarv","mazzy",1,0,0)~ GOTO goodbye
IF ~~ THEN REPLY @184 DO ~SetGlobal("mazzyisgoingtobeapaladinkit","global",3) GiveItemCreate("tb#magic","mazzy",1,0,0)~ GOTO goodbye
IF ~~ THEN REPLY @185 DO ~SetGlobal("mazzyisgoingtobeapaladinkit","global",4) GiveItemCreate("tb#undea",Player1,6,0,0)~ GOTO goodbye
END

IF ~~ THEN BEGIN goodbye
SAY @186 = @187
IF ~~ THEN DO ~SetGlobal("Mazzyisgoingtobeapaladin","global",3) SetGlobal("tb#mazzygift","global",1) DestroySelf()~ EXIT END

CHAIN
IF ~Global("Mazzyisnotgoingtobeapaladin","global",1)~ THEN tb#arvor nopal
~MAZZY, YOU HAVE KILLED PEOPLE YOU SHOULDN'T HAVE.~
== tb#arvor IF ~Dead("gyron")~ THEN ~WHY HAVE YOU LET <CHARNAME> KILL GYRON?~
== tb#arvor IF ~Global("tb#shireguardswillhelpme","global",1)~ THEN ~WHY DID YOU KILL THE SHIRE-GUARDS, AND NOT ONLY THE EVIL TED SANDY?~
== tb#arvor ~I SEE THAT YOU HAVE NO EXCUSES. YOU ARE UNWORTHY OF MY BLESSING. KEEP YOUR MUNDANE GLORY IF YOU WISH.~ DO ~ActionOverride("mazzy",AddKit(TRUECLASS)) ReallyForceSpellRES("tb#losem","mazzy") TakePartyItem("npsw01") TakePartyItem("c2mazz01") TakePartyItem("npbow") TakePartyItem("u#bow02") DestroySelf()~
EXIT

CHAIN
IF ~Global("tb#mazzygift","global",0)~ THEN tb#arvor hello
@188 = @189 DO ~SetGlobal("tb#mazzygift","global",1)~
== MAZZYJ @190
== tb#arvor @191
== MAZZYJ @192 = @193
== tb#arvor @194
== MAZZYJ @195
== tb#arvor @196
END
/*IF ~InParty("Anomen") Alignment("Anomen",LAWFUL_GOOD)~ THEN EXTERN Anomenj arvoreenLG
IF ~InParty("Anomen") Alignment("Anomen",LAWFUL_NEUTRAL)~ THEN EXTERN Anomenj arvoreenLN
IF ~InParty("Anomen") Alignment("Anomen",CHAOTIC_NEUTRAL)~ THEN DO ~SetGlobal("tb#hadanomen","global",1)~ EXTERN Anomenj arvoreenCN */
IF ~~ THEN EXTERN tb#arvor gift

/* CHAIN
IF "" THEN anomenj arvoreenLG
@197
== MAZZYJ @198 = @199
== tb#arvor @200 = @201
== ANOMENJ @202
== MAZZYJ @203
== tb#arvor @204
END tb#arvor gift

CHAIN
IF "" THEN anomenj arvoreenLN
@197
== MAZZYJ @198 = @199
== tb#arvor @205 = @201
== ANOMENJ  @202
== MAZZYJ @203
== tb#arvor @204
END tb#arvor gift

CHAIN
IF "" THEN anomenj arvoreenCN
@197
== MAZZYJ @198 = @199
== tb#arvor @206 = @207
== MAZZYJ @208
== ANOMENJ @209
== tb#arvor @210
==ANOMENJ @211
== tb#arvor @212 DO ~ActionOverride("anomen",LeaveParty()) ActionOverride("anomen",GivePartyAllEquipment()) ActionOverride("anomen",DestroySelf())~
== MAZZYJ @213
== tb#arvor @204
END tb#arvor gift    */

APPEND tb#arvor
IF ~Dead("tb#lich") Global("mazzyisgoingtobeapaladinkit","global",1)~ THEN BEGIN takebackgifts_pal
SAY ~MAZZY, YOU HAVE DEFENDED THE PATH OF THE LAWFUL. INDEED THE BOOTS YOU FETCHED WERE OF THE LICH.~ = ~GYRON WAS A THIEF AND ATTACKED YOU IN THE FIRST PLACE, SO YOU WERE RIGHT ABOUT KILLING HIM.~ = ~SINCE YOU PROVED YOURSELF IN DEFENDING THE LAW, YOU ARE NOW WORTHY OF BEING A PALADIN.~
IF ~~ DO ~ChangeClass("mazzy",PALADIN)~ EXTERN MAZZYJ asyouwish
END

IF ~Dead("tb#lich") !Global("mazzyisgoingtobeapaladinkit","global",1)~ THEN BEGIN takebackgifts_pal
SAY ~MAZZY, YOU DECIDED TO KILL A MONSTER.~ = ~WHEREBY HE WAS THE RIGHTFUL OWNER OF THE BOOTS, AND GYRON WAS A THIEF, HIS THREATS AGAINST THE TOWN ARE AN ABUSE AGAINST GOOD INNOCENTS.~ = ~THUS, BY DEFENDING THE INNOCENT AGAINST ALL HARM, YOU PROVED YOURSELF TO BE A DEFENDER OF THE GOOD AGAINST THE EVIL, AND NOW YOU ARE WORTHY OF BEING A PALADIN.~
IF ~Global("mazzyisgoingtobeapaladinkit","global",2)~ THEN DO ~ChangeClass("mazzy",PALADIN)~ EXTERN MAZZYJ asyouwish2
IF ~Global("mazzyisgoingtobeapaladinkit","global",3)~ THEN DO ~ChangeClass("mazzy",PALADIN)~ EXTERN MAZZYJ asyouwish3
IF ~Global("mazzyisgoingtobeapaladinkit","global",4)~ THEN DO ~ChangeClass("mazzy",PALADIN)~ EXTERN MAZZYJ asyouwish4
END

IF ~~ THEN BEGIN adieux
SAY @216
IF ~~ THEN DO ~RealSetGlobalTimer("tb#mazzypctimer","locals",120) TakePartyItem("tb#magic") TakePartyItem("tb#swarv") TakePartyItem("tb#undea") DestroySelf()~ EXIT END
END

APPEND MAZZYJ

IF ~~ THEN BEGIN asyouwish
SAY @217
IF ~~ THEN DO ~ApplySpellRES("tb#portr",Myself) AddKit(TRUECLASS) SetGlobal("mazzyisgoingtobeapaladin","global",4)~ EXTERN tb#arvor adieux
END

IF ~~ THEN BEGIN asyouwish2
SAY @217
IF ~~ THEN DO ~ApplySpellRES("tb#portr",Myself) AddKit(CAVALIER) SetGlobal("mazzyisgoingtobeapaladin","global",4)~ EXTERN tb#arvor adieux
END

IF ~~ THEN BEGIN asyouwish3
SAY @217
IF ~~ THEN DO ~ApplySpellRES("tb#portr",Myself) AddKit(INQUISITOR) SetGlobal("mazzyisgoingtobeapaladin","global",4)~ EXTERN tb#arvor adieux
END

IF ~~ THEN BEGIN asyouwish4
SAY @217
IF ~~ THEN DO ~ApplySpellRES("tb#portr",Myself) AddKit(UNDEADHUNTER) SetGlobal("mazzyisgoingtobeapaladin","global",4)~ EXTERN tb#arvor adieux
END
END




