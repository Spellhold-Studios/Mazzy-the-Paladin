BEGIN tb#guard
BEGIN tb#robin

BEGIN tb#sandy

CHAIN
  IF ~Global("tb#robinintana","global",0)~ THEN tb#robin meet 
@22 DO ~SetGlobal("tb#robinintana","global",1)~ = @23
== Mazzyj IF ~InParty("mazzy")~ THEN  @24
== tb#robin @25
== tb#sandy @26 = @27
== tb#robin @28 = @29
END mazzyj help

APPEND ~mazzyj~
IF ~~ THEN BEGIN help
SAY @30
IF ~~ THEN REPLY @31 EXTERN tb#sandy solo
IF ~~ THEN REPLY @32 EXTERN tb#sandy party
END
END

APPEND ~tb#robin~
IF ~Dead("tb#sandy")~ THEN BEGIN thanks
SAY @33 
IF ~True()~ THEN GOTO live
IF ~Global("tb#shireguardswillhelpme","global",1)~ THEN GOTO dead
END

IF ~~ THEN BEGIN live
SAY @35 = @34
IF ~True()~ THEN DO ~AddXPObject(Player1,3000)
AddXPObject(Player2,3000)
AddXPObject(Player3,3000)
AddXPObject(Player4,3000)
AddXPObject(Player5,3000)
AddXPObject(Player6,3000)~
EXIT END

IF ~~ THEN BEGIN dead
SAY @36 = @37
IF ~~ THEN DO ~ReputationInc(-1) SetGlobal("d0change","global",-2)~
EXIT END
END


APPEND tb#sandy

IF ~~ THEN BEGIN solo
SAY @38
IF ~~ THEN DO ~Enemy()~ EXIT END

IF ~~ THEN BEGIN party
SAY @39
IF ~~ THEN DO ~Enemy() SetGlobal("mazzyisnotgoingtobeapaladin","global",1) SetGlobal("tb#SHireguardswillhelpme","global",1)~ EXIT END
END


