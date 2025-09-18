BEGIN tb#biff
IF ~!NumTimesTalkedTo(0)~ THEN BEGIN secondstart
SAY @0 = @1
IF "" THEN GOTO nomazzy
IF %InParty("mazzy")% THEN GOTO yesmazzy
END

IF "" THEN BEGIN nomazzy
SAY @2 = @3 IF "" THEN EXIT END

IF "" THEN BEGIN yesmazzy
SAY @4
IF "" THEN EXTERN MAZZYJ willhelp
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN firststart
SAY /*@5 = @6 =
@7 = */ @8 = @9
IF "" THEN GOTO nomazzy
IF ~InParty("mazzy")~ THEN EXTERN Mazzyj Imhere
END

CHAIN
IF "" THEN mazzyj Imhere
@10
== tb#biff @11
== MAZZYJ @12
== tb#biff @13 = @14
== tb#biff IF ~Exists(Player3)~ THEN @15
== tb#biff IF ~!Exists(Player3)~ THEN @16
END MAZZYJ willhelp

APPEND ~MAZZYJ~

IF ~~ THEN BEGIN willhelp
SAY @17
IF ~~ THEN REPLY @18 EXTERN tb#biff excellent
IF ~~ THEN REPLY @19 EXTERN tb#biff force
END
END

APPEND ~tb#biff~

IF ~~ THEN BEGIN excellent
SAY @20
IF ~~ THEN DO ~ActionOverride(Player1,LeaveAreaLUA("TB#000","",[252.571],0))
    ActionOverride(Player2,LeaveAreaLUA("TB#000","",[252.571],0))
    ActionOverride(Player3,LeaveAreaLUA("TB#000","",[252.571],0))
    ActionOverride(Player4,LeaveAreaLUA("TB#000","",[252.571],0))
    ActionOverride(Player5,LeaveAreaLUA("TB#000","",[252.571],0))
    ActionOverride(Player6,LeaveAreaLUA("TB#000","",[252.571],0))~ EXIT END

IF ~~ THEN BEGIN force
SAY @21
IF ~~ THEN EXIT END
END


