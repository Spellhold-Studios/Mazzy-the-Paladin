BEGIN tb#terry      // if necessary
BEGIN tb#lich

IF ~Global("tb#gyronisthief","global",1)~ secondmeet
SAY @0
++ @1 + die
+ ~PartyHasItem("boot03")~ + @2 + peace
+ ~PartyHasItem("boot03")~ + @3 + peace
+ ~!PartyHasItem("boot03")~ + @4 + gyron_dead
END

IF ~~ loop
SAY @5
++ @6 + die
++ @7 + threaten_who
END

IF ~~ threaten_who
SAY @8
++ @9 + die
++ @10 + duh_me_remember
END

IF ~~ duh_me_remember
SAY @11 = @12 = @13 = @14
+ ~PartyHasItem("boot02")~ + @2 + peace
++ @15 + die
++ @16 + will_ask_gyron
+ ~Dead("tb#gyron") !PartyHasItem("boot03")~ + @17 + gyron_dead
END

IF ~~ will_ask_gyron
SAY @18
IF ~~ DO ~SetGlobal("tb#gyronisthief","global",1)~ EXIT
END

IF ~~ gyron_dead
SAY @19
IF ~~ DO ~SetGlobal("tb#gyronisthief","global",1)~ EXIT
END

IF ~~ peace
SAY @20 = @21
IF ~~ DO ~TakePartyItem("boot03") DestroyItem("tb#invis") SetGlobal("mazzyisgoingtobeapaladinkit","global",1) IncrementGlobal("d0change","global",1) Kill(Myself)~ EXIT
END

IF ~~ die
SAY @22 = @23
IF ~~ THEN DO ~SetGlobal("tb#fightwiththelich","global",1) Enemy()~ EXIT
END

IF ~~ hello_charname
SAY @24
++ @25 + die
++ @26 + terry
++ @7 + threaten_who
END

IF ~~ terry
SAY @27 = @28
++ @29 DO ~SetGlobal("knowterry","locals",1)~ + mind_your_business
++ @30 DO ~SetGlobal("knowterry","locals",1)~ + threaten_who
++ @25 + die
END

IF ~~ luca_is_completely_told_of
SAY @31
++ @32 + die
++ @33 + loop
END

IF ~~ mind_your_business
SAY @34
++ @35 + going_to_tell
++ @30 + threaten_who
++ @25 + die
END

IF ~~ going_to_tell
SAY @36
IF ~~ + telling_about_luca
END

IF ~~ THEN BEGIN telling_about_luca
SAY @37
 = @38
 = @39
 = @40
 = @41
 = @40 = @42
 = @43
 = @42
 = @44
 = @45
 = @46
IF ~~ THEN DO ~SetGlobal("tb#toldaboutluca","global",1)~ GOTO luca_is_completely_told_of
END

CHAIN
IF ~NumTimesTalkedTo(0)~ THEN tb#lich heya
@47
== mazzyj @48
== tb#lich @49
END
+ ~Global("mazzyisnotgoingtobeapaladin","global",1)~ + @50 EXTERN mazzyj not_paladin
+ ~Global("mazzyisnotgoingtobeapaladin","global",0)~ + @50 EXTERN mazzyj paladin
++ @51 EXTERN tb#lich die
++ @52 EXTERN tb#lich hello_charname

CHAIN
IF ~~ THEN mazzyj not_paladin
@53
== tb#lich @54
== mazzyj @55
== tb#lich @56
== mazzyj @57
END tb#lich die

CHAIN
IF ~~ THEN mazzyj paladin
@58
== tb#lich @59
== mazzyj @60
== tb#lich @61
END
++ @26 EXTERN tb#lich terry
++ @25 EXTERN tb#lich die
++ @7 EXTERN tb#lich threaten_who
++ @50 EXTERN mazzyj lich_mazzy

APPEND ~mazzyj~
IF ~~ lich_mazzy
SAY @62
IF ~~ EXTERN tb#lich threaten_who
END
END

