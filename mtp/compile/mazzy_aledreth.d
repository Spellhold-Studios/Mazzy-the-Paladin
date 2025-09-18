BEGIN tb#aledr

IF ~Global("tb#aledrethhasspoken","global",0) Global("talked","locals",0)~ THEN BEGIN hello
SAY @383
IF ~~ THEN REPLY @384 DO ~TakePartyItem("tb#invis")~ GOTO good
IF ~~ THEN REPLY @385 GOTO why
IF ~~ THEN REPLY @386 GOTO taste
END

IF ~~ THEN BEGIN good
SAY @387
IF ~~ THEN DO ~DestroySelf() TakePartyItem("tb#invis")~ EXIT
END

IF ~~ THEN BEGIN why
SAY @388 = @389
IF ~~ THEN REPLY @390 DO ~TakePartyItem("tb#invis")~ GOTO good
IF ~~ THEN REPLY @391 GOTO taste
END

IF ~GlobalGT("tb#aledrethhasspoken","global",0) GlobalLT("tb#aledrethhasspoken","global",6) Global("talked","locals",0)~ THEN BEGIN allies
SAY @392
IF ~~ THEN REPLY @393 GOTO taste
IF ~~ THEN REPLY @394 GOTO good1
IF ~~ THEN REPLY @395 GOTO realfight
END

IF ~GlobalGT("tb#aledrethhasspoken","global",5) Global("talked","locals",0)~ THEN BEGIN bigmage
SAY @396
IF ~~ THEN REPLY @397 GOTO lasttry
END

IF ~~ THEN BEGIN lasttry
SAY @398 = @399 = @400 = @401
IF ~~ THEN DO ~DestroyItem("minhp1")~ REPLY @402 GOTO reward
IF ~~ THEN DO ~DestroyItem("minhp1")~ REPLY @403 GOTO reward
END

IF ~~ THEN BEGIN reward
SAY @404
IF ~~ THEN GOTO realfight
END

IF ~~ THEN BEGIN good1
SAY @405 = @406
IF ~~ THEN GOTO win
END

IF ~~ THEN BEGIN taste
SAY @407
IF ~~ THEN REPLY @408 GOTO cross
IF ~~ THEN REPLY @409 GOTO win
END

IF ~~ THEN BEGIN cross
SAY @410
IF ~~ THEN REPLY @411 GOTO cross
IF ~~ THEN REPLY @412 GOTO win
IF ~~ THEN REPLY @413 GOTO realfight END

IF ~~ THEN BEGIN win
SAY @414
IF ~~ THEN REPLY @411 GOTO cross
IF ~~ THEN REPLY @415 GOTO win
IF ~~ THEN REPLY @413 GOTO realfight END

IF ~~ THEN BEGIN realfight
SAY @416
IF ~~ THEN DO ~SetGlobal("talked","locals",1) ApplySpell(Myself,WIZARD_INVISIBILITY) IncrementGlobal("tb#aledrethhasspoken","global",1)~ EXIT
END

IF ~Global("talked","locals",2)~ THEN BEGIN end
SAY @417
IF ~~ THEN GOTO nexttime1
IF ~Global("tb#AledrethHasSpoken","global",1)~ THEN GOTO nexttime
END

IF ~~ THEN BEGIN nexttime
SAY @418
IF ~~ THEN DO "DestroySelf()" EXIT END

IF ~~ THEN BEGIN nexttime1
SAY @419
IF ~~ THEN DO "DestroySelf()" EXIT END





