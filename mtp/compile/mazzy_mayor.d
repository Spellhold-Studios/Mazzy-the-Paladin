BEGIN tb#mayor
IF ~NumTimesTalkedTo(0) !Dead("tb#lich")~ THEN BEGIN firstmeet
SAY @106 /* = @107 = @108 = @109 = @110 */
IF ~Global("mazzyisnotgoingtobeapaladin","global",0)~ THEN REPLY @111 GOTO quest
IF ~Global("mazzyisnotgoingtobeapaladin","global",1)~ THEN REPLY @111 GOTO noquest
IF ~Global("mazzyisnotgoingtobeapaladin","global",0)~ THEN REPLY @112 GOTO quest
IF ~Global("mazzyisnotgoingtobeapaladin","global",1)~ THEN REPLY @112 GOTO noquest
END

CHAIN
IF ~~ THEN tb#mayor quest
@112
== MAZZYJ IF ~InParty("Mazzy")~ THEN @113
/* == tb#mayor @114 = @115 = @116
== MAZZYJ @117
== tb#mayor @118
== MAZZYJ @119 */
== tb#mayor @120 = @121 /* = @122 
== MAZZYJ @123
== tb#mayor @124 */ = @125
== MAZZYJ @126
DO ~SetGlobal("mazzyisgoingtobeapaladin","global",2)~
EXIT

CHAIN
IF ~~ THEN tb#mayor noquest
@112
== MAZZYJ IF ~InParty("Mazzy")~ THEN @113
/* == tb#mayor @114 = @115 = @116
== MAZZYJ @117
== tb#mayor @118
== MAZZYJ @119 */
== tb#mayor @120 = @121 /* = @127
== MAZZYJ @123
== tb#mayor @124 */ = @125
== MAZZYJ @126
EXIT /**/
/* == tb#mayor @129
== MAZZYJ @130
== ANOMENJ IF ~InParty("anomen") Alignment("Anomen",LAWFUL_GOOD)~ THEN @131
== ANOMENJ IF ~InParty("Anomen") Alignment("anomen",LAWFUL_NEUTRAL)~ THEN @132
== ANOMENJ IF ~InParty("Anomen") Alignment("Anomen",CHAOTIC_NEUTRAL)~ THEN @133
== MAZZYJ IF ~InParty("Anomen") Alignment("Anomen",CHAOTIC_NEUTRAL)~ THEN @134
== MAZZYJ IF ~InParty("Anomen")~ THEN @135
== ANOMENJ IF ~InParty("Anomen")~ THEN @136 = @137
END MAZZYJ goingtokillanomen

APPEND ANOMENJ
IF ~~ THEN BEGIN anomenattacks
SAY @138
IF ~~ THEN DO ~LeaveParty() Enemy()~ EXIT
END

IF ~~ THEN BEGIN sorry
SAY @139 = @140 = @141
IF ~~ THEN EXTERN MAZZYJ backin
END
END

APPEND MAZZYJ
IF ~~ THEN BEGIN backin
SAY @142
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN mazzyleaves
SAY @143
IF ~~ THEN DO ~LeaveParty() ReallyForceSpell(Myself,DRYAD_TELEPORT) Wait(1) DestroySelf()~ EXIT
END

IF ~~ THEN BEGIN drunk
SAY @144
IF ~~ THEN EXIT
END



IF ~~ THEN BEGIN goingtokillanomen
SAY @145
IF ~!InParty("Anomen")~ THEN GOTO drunk
IF ~InParty("Anomen")~ THEN REPLY @146 EXTERN ANOMENJ anomenattacks
IF ~InParty("Anomen")~ THEN REPLY @147 EXTERN MAZZYJ mazzyleaves
IF ~InParty("Anomen")~ THEN REPLY @148 EXTERN ANOMENJ anomenattacks
IF ~InParty("Anomen") Alignment("anomen",CHAOTIC_NEUTRAL)~ THEN EXTERN ANOMENJ sorry
END

END */
CHAIN
IF "" THEN tb#mayor strangepalehalfling
@149
== mazzyj @150
== tb#mayor @151
== mazzyj @152
/* == mazzyj IF ~InParty("anomen")~ THEN @153
== anomenj IF ~InParty("anomen")~ THEN @154
== mazzyj IF ~Global("tb#hadanomen","global0",1)~ THEN @155 */
== mazzyj @156
== tb#mayor @157 = @158
/* == mazzyj @159 = @160
== tb#mayor @161
== mazzyj @162
== tb#mayor @163 = @164 = @165 = @166 */ = @167
== mazzyj @168 = @169 = @170 = @171 = @172
== tb#mayor IF ~!Global("tb#mazzyisgoingtobeapaladinkit","global",2)~ THEN @173  DO ~SetGlobal("tb#ritual","global",1) GiveItemCreate("tb#swm1","mazzy",1,0,0) GiveItemCreate("tb#bow1","mazzy",1,0,0) TakePartyItem("npbow") TakePartyItem("npsw01")~
== tb#mayor IF ~Global("tb#mazzyisgoingtobeapaladinkit","global",2)~ THEN @173  DO ~SetGlobal("tb#ritual","global",1) GiveItemCreate("tb#swm1","mazzy",1,0,0) GiveItemCreate("tb#bow1a","mazzy",1,0,0) TakePartyItem("npbow") TakePartyItem("npsw01")~
EXIT



APPEND tb#mayor
/*IF ~Global("mazzyisnotgoingtobeapaladin","global",1)~ THEN BEGIN noquest2
SAY @174
IF ~~ THEN EXIT
END */

IF "" nopaladin
SAY @158 = @167
IF ~~ THEN DO ~SetGlobal("tb#ritual","global",1)~ EXIT END

IF ~GlobalLT("Mazzyisgoingtobeapaladin","global",4)~ THEN BEGIN killlich
SAY @175
IF ~~ THEN EXIT
END

IF ~GlobalGT("tb#ritual","global",0)~ THEN BEGIN farewell
SAY @176
IF ~~ THEN REPLY #46876 EXIT END

IF ~OR(2) Dead("tb#lich") Global("mazzyisgoingtobeapaladinkit","locals",1)~ THEN BEGIN paladinhood
SAY @177
IF ~~ THEN GOTO strangepalehalfling
IF ~Global("mazzyisnotgoingtobeapaladin","global",1)~ THEN GOTO nopaladin END
END



