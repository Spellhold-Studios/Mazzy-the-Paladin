BEGIN tb#gyron

IF ~!Global("discoveredtheft","locals",1) Global("Violence","locals",1)~ THEN BEGIN violence
SAY @40
IF ~~ THEN GOTO friends
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN firstmeet
SAY @41 = @42 = @43 = @44 = @45
IF ~~ THEN REPLY @46 GOTO test
IF "" THEN REPLY @47 GOTO test
IF ~~ THEN REPLY @48 GOTO talk
END

IF ~~ THEN BEGIN talk
SAY @49
IF ~~ THEN GOTO test
END

IF ~~ THEN BEGIN test
SAY @50
IF "" THEN GOTO test1
IF ~!InParty("aerie") !InParty("Anomen") InParty("jan")~ THEN EXTERN janj tb#gyron
IF ~!InParty("aerie") InParty("Anomen")~ THEN EXTERN anomenj tb#gyron
IF ~InParty("aerie")~ THEN EXTERN aeriej tb#gyron
END

IF ~!NumTimesTalkedTo(0) Allegiance(Myself,NEUTRAL)~ talk_again
SAY @0
++ @1 EXIT
++ @2 + start
+ ~Global("tb#gyronisthief","global",1)~ + @3 + lich_right
END

IF ~~ lich_right
SAY @4
IF ~~ DO ~SetGlobal("discoveredtheft","locals",1)~ EXIT
END


IF ~~ THEN BEGIN challenge
SAY @51
IF ~~ THEN REPLY @52 EXIT
IF ~~ THEN REPLY @53 GOTO start
END

IF ~~ THEN BEGIN start
SAY @54
IF ~~ THEN DO ~Enemy() SetGlobal("started","locals",1)~ EXIT END

CHAIN IF "" THEN AERIEJ tb#gyron
@55
== tb#gyron @56
== AERIEJ  @57
== tb#gyron @58
END
IF ~~ THEN EXTERN aeriej tb#gyronnonlove
IF ~Global("aerieromanceactive","global",2)~ THEN EXTERN aeriej tb#gyronlove

APPEND "Aeriej"
IF "" THEN BEGIN tb#gyronlove
SAY @59
IF "" THEN EXTERN tb#gyron test1
IF ~InParty("jan") !InParty("anomen")~ THEN EXTERN janj tb#gyron
IF ~InParty("anomen")~ THEN EXTERN anomenj withaerie
END
END

CHAIN IF "" THEN AERIEJ tb#gyronnonlove
@60
== tb#gyron @61
== AERIEJ @62
== tb#gyron @63
END
IF "" THEN EXTERN tb#gyron test1
IF ~InParty("jan") !InParty("anomen")~ THEN EXTERN janj tb#gyron
IF ~InParty("anomen")~ THEN EXTERN anomenj withaerie

CHAIN IF "" THEN anomenj withaerie
@64
== tb#gyron @65
END
IF "" THEN EXTERN tb#gyron test1
IF ~InParty("jan")~ THEN EXTERN janj tb#gyron

CHAIN IF "" THEN anomenj tb#gyron
@66
== tb#gyron @65
END
IF "" THEN EXTERN tb#gyron test1
IF ~InParty("jan")~ THEN EXTERN janj tb#gyron

CHAIN IF "" THEN janj tb#gyron
@67 =@68
== tb#gyron @69
== JANJ @70 = @71
== tb#gyron @72
== JANJ @73
END tb#gyron test1

CHAIN IF "" THEN tb#gyron test1
@74
== MAZZYJ @75
END tb#gyron challenge

BEGIN tb#phala
BEGIN tb#merik
BEGIN tb#lorun

CHAIN
IF ~Global("discoveredtheft","locals",1)~ THEN tb#gyron discovered_theft
@76
== tb#phala @77
/* == tb#gyron @78
== tb#phala @79
== tb#lorun @80 = @81 = @82 = @83 = @84
== tb#merik @85
== tb#gyron @86
== tb#merik @87
== tb#phala IF ~PartyHasItem("amul21")~ THEN @88
== tb#merik IF ~PartyHasItem("amul21")~ THEN @89
== tb#phala IF ~PartyHasItem("amul21")~ THEN @90
== tb#gyron @91
== tb#lorun @92 = @93
== tb#phala @94
== tb#merik @95
== tb#lorun @96
== tb#merik @97*/
== tb#gyron /* @98 = */ @99
== tb#lorun @100
== tb#merik @101
== tb#phala /* @102 = @103 = */ @104
== tb#gyron @105
EXIT

CHAIN
IF ~Allegiance(Myself,ENEMY)~ THEN tb#gyron friends
@76
== tb#phala @77
/* == tb#gyron @78
== tb#phala @79
== tb#lorun @80 = @81 = @82 = @83 = @84
== tb#merik @85
== tb#gyron @86
== tb#merik @87
== tb#phala IF ~PartyHasItem("amul21")~ THEN @88
== tb#merik IF ~PartyHasItem("amul21")~ THEN @89
== tb#phala IF ~PartyHasItem("amul21")~ THEN @90
== tb#gyron @91
== tb#lorun @92 = @93
== tb#phala @94
== tb#merik @95
== tb#lorun @96
== tb#merik @97*/
== tb#gyron /* @98 = */ @99
== tb#lorun @100
== tb#merik @101
== tb#phala /* @102 = @103 = */ @104
== tb#gyron @105
DO ~SetGlobal("mazzyisnotgoingtobeapaladin","global",1)~
EXIT


