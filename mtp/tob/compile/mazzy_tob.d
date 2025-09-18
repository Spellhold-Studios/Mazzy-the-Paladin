BEGIN tb#mage

IF ~True()~ THEN BEGIN hey
SAY @0
IF ~~ THEN DO ~SetGlobal("tb#sucineri_insulted","global",1) SetGlobal("tb#sucineri_flag","global",1) SetGlobal("tb#sucineri_was_here","global",4)~ REPLY @1 GOTO rolleyes
IF ~~ THEN DO ~SetGlobal("tb#sucineri_lied","global",1) SetGlobal("tb#sucineri_flag","global",4) SetGlobal("tb#sucineri_was_here","global",4)~ REPLY @2 GOTO rolleyes
IF ~~ THEN REPLY @3 GOTO aledreth
IF ~~ THEN DO ~SetGlobal("tb#sucineri_insulted","global",1) SetGlobal("tb#sucineri_flag","global",1) SetGlobal("tb#sucineri_was_here","global",4)~ REPLY @4 GOTO rolleyes
END

IF ~~ THEN BEGIN aledreth
SAY @5 = @6 = @7 = @8 = @9 = @10
IF ~~ THEN DO ~IncrementGlobal("tb#sucineri_insulted","global",1) SetGlobal("tb#sucineri_flag","global",1) SetGlobal("tb#sucineri_was_here","global",7) SetGlobal("tb#sucineridone","global",3)~ REPLY @11 GOTO rolleyes
IF ~~ THEN DO ~IncrementGlobal("tb#sucineri_insulted","global",1) SetGlobal("tb#sucineri_flag","global",1) SetGlobal("tb#sucineri_was_here","global",7) SetGlobal("tb#sucineridone","global",4)~ REPLY @12 GOTO rolleyes
IF ~~ THEN DO ~IncrementGlobal("tb#sucineri_lied","global",1) SetGlobal("tb#sucineri_flag","global",4) SetGlobal("tb#sucineri_was_here","global",7) SetGlobal("tb#sucineridone","global",2)~ REPLY @13 GOTO rolleyes
IF ~~ THEN DO ~SetGlobal("tb#sucineridone","global",4)~ REPLY @14 GOTO convince
IF ~~ THEN DO ~SetGlobal("tb#sucineridone","global",4)~ REPLY @15 GOTO sorry
END

IF ~~ THEN BEGIN sorry
SAY @16 = @17
IF ~~ THEN DO ~DestroySelf()~ EXIT END

IF ~~ THEN BEGIN convince
SAY @18 = @19 = @20
= @21 = @22 = @23
IF ~~ THEN DO ~IncrementGlobal("tb#sucineri_insulted","global",1) SetGlobal("tb#sucineri_flag","global",1) SetGlobal("tb#sucineri_was_here","global",1)~ REPLY @24 GOTO rolleyes
IF ~~ THEN DO ~IncrementGlobal("tb#sucineri_lied","global",1) SetGlobal("tb#sucineri_flag","global",4) SetGlobal("tb#sucineri_was_here","global",1)~ REPLY @25 GOTO rolleyes
IF ~~ THEN REPLY @26 GOTO talk
IF ~Global("tb#sucineridone","global",3)~ THEN GOTO die
END

IF ~~ THEN BEGIN die
SAY @27 = @28
IF ~~ THEN EXIT END


IF ~~ THEN BEGIN talk
SAY @29
IF ~~ THEN GOTO trial
IF ~IsGabber(Player1)~ THEN GOTO triala
END

IF ~~ THEN BEGIN trial
SAY @30
IF ~~ THEN REPLY @31 GOTO trial1
IF ~~ THEN DO ~IncrementGlobal("tb#sucineri_lied","global",1) SetGlobal("tb#sucineri_flag","global",3) SetGlobal("tb#sucineri_was_here","global",2)~ REPLY @32 GOTO rolleyes
IF ~~ THEN DO ~IncrementGlobal("tb#sucineri_insulted","global",1) SetGlobal("tb#sucineri_flag","global",2) SetGlobal("tb#sucineri_was_here","global",2)~ REPLY @33 GOTO rolleyes
END

IF ~~ THEN BEGIN trial1
SAY @34
IF ~~ THEN REPLY @35 GOTO die
IF ~~ THEN DO ~IncrementGlobal("tb#sucineri_lied","global",1) SetGlobal("tb#sucineri_flag","global",3) SetGlobal("tb#sucineri_was_here","global",3)~ REPLY @36 GOTO rolleyes
IF ~~ THEN DO ~IncrementGlobal("tb#sucineri_insulted","global",1) SetGlobal("tb#sucineri_flag","global",2) SetGlobal("tb#sucineri_was_here","global",3)~ REPLY @33 GOTO rolleyes
END

IF ~~ THEN BEGIN triala
SAY @37
IF ~~ THEN REPLY @38 GOTO trial1a
IF ~~ THEN DO ~IncrementGlobal("tb#sucineri_lied","global",1) SetGlobal("tb#sucineri_flag","global",3) SetGlobal("tb#sucineri_was_here","global",5)~ REPLY @39 GOTO rolleyes
IF ~~ THEN DO ~IncrementGlobal("tb#sucineri_insulted","global",1) SetGlobal("tb#sucineri_flag","global",2) SetGlobal("tb#sucineri_was_here","global",5)~ REPLY @33 GOTO rolleyes
END

IF ~~ THEN BEGIN trial1a
SAY @40
IF ~~ THEN REPLY @41 GOTO die
IF ~~ THEN DO ~IncrementGlobal("tb#sucineri_lied","global",1) SetGlobal("tb#sucineri_flag","global",3) SetGlobal("tb#sucineri_was_here","global",6)~ REPLY @42 GOTO rolleyes
IF ~~ THEN DO ~IncrementGlobal("tb#sucineri_insulted","global",1) SetGlobal("tb#sucineri_flag","global",4) SetGlobal("tb#sucineri_was_here","global",6)~ REPLY @33 GOTO rolleyes
END

IF ~~ THEN BEGIN rolleyes
SAY @43
IF ~~ THEN GOTO die
IF ~Global("tb#sucineri_flag","global",1)~ THEN GOTO donotinsult1
IF ~Global("tb#sucineri_flag","global",2)~ THEN GOTO donotinsult
IF ~Global("tb#sucineri_flag","global",3)~ THEN GOTO lie
IF ~Global("tb#sucineri_flag","global",4)~ THEN GOTO lie1
IF ~Global("tb#sucineri_insulted","global",2)~ THEN GOTO insulted
IF ~Global("tb#sucineri_lied","global",2)~ THEN GOTO lied
END

IF ~~ THEN BEGIN donotinsult1
SAY @44
IF ~Global("tb#sucineri_was_here","global",1)~ THEN GOTO talk
IF ~Global("tb#sucineri_was_here","global",4)~ THEN GOTO aledreth
IF ~Global("tb#sucineri_was_here","global",7)~ THEN GOTO convince
END

IF ~~ THEN BEGIN lie1
SAY @45
IF ~Global("tb#sucineri_was_here","global",1)~ THEN GOTO talk
IF ~Global("tb#sucineri_was_here","global",4)~ THEN GOTO aledreth
IF ~Global("tb#sucineri_was_here","global",7)~ THEN GOTO convince
END

IF ~~ THEN BEGIN donotinsult
SAY @44 = @46
IF ~Global("tb#sucineri_was_here","global",2)~ THEN GOTO trial
IF ~Global("tb#sucineri_was_here","global",3)~ THEN GOTO trial1
IF ~Global("tb#sucineri_was_here","global",5)~ THEN GOTO triala
IF ~Global("tb#sucineri_was_here","global",6)~ THEN GOTO trial1a
END

IF ~~ THEN BEGIN lie
SAY @45 = @46
IF ~Global("tb#sucineri_was_here","global",2)~ THEN GOTO trial
IF ~Global("tb#sucineri_was_here","global",3)~ THEN GOTO trial1
IF ~Global("tb#sucineri_was_here","global",5)~ THEN GOTO triala
IF ~Global("tb#sucineri_was_here","global",6)~ THEN GOTO trial1a
END

IF ~~ THEN BEGIN insulted
SAY @47
IF ~~ THEN GOTO die
END

IF ~~ THEN BEGIN lied
SAY @48
IF ~~ THEN GOTO die
END

