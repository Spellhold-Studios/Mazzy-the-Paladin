APPEND ~bmazzy~
IF WEIGHT #-100 ~RealGlobalTimerExpired("tb#mazzypctimer","global") Global("tb#pc","locals",0)~ pc_1
SAY ~I... I can't believe what happened. In my wildest dream I couldn't even imagine something like this... and now it turned into reality.~
++ ~Hey, this is your wildest dream? Believe me, *my* wildest dream involves you too. And you'd better bring it into relity, since I helped it happen.~ + porky_pig
++ ~I'm glad I could help you with something so important to you.~ + pc_1a
++ ~(Nod and let her continue talking)~ + pc_1a
+ ~Alignment(Player1,LAWFUL_GOOD) !Class(Player1,PALADIN_ALL)~ + ~Really, I make my compliments with you for achieving such a goal; it's beyond my reach, even if I really wish I was as worthy as you...~ + pc_1b
+ ~Class(Player1,PALADIN_ALL)~ + ~Welcome into paladinhood, Mazzy! If you let another unworthy paladin such as me dare address you in such a way..~ + pc_1c
+ ~!Alignment(Player1,LAWFUL_GOOD)~ + ~Really, I make my compliments with you for achieving such a goal; my choiches in life differ from yours, but I am happy you are succesful with yours..~ + pc_1d
+ ~!Alignment(Player1,LAWFUL_GOOD)~ + ~Blah, another upholder of virtue and law has born. What have I done wrong?~ + heretic
++ ~You aren't here to speak, but to serve. Now SHUT UP!~ + shut_up
+ ~GlobalLT("chapter","global",4)~ + ~I don't want to appear too harsh, but we're in a hurry to rescue Imoen. Let's get moving.~ + pc_1_end
+ ~GlobalGT("chapter","global",3)~ + ~I don't want to appear too harsh, but I am missing my soul, and would want it back soon.. Let's get moving.~ + pc_1_end
END

IF ~~ pc_1a
SAY ~Thanks for your support, I suppose...~ = ~Really, I don't know what to say... it's just...~
++ ~You don't have to say anything. Actually, you *must* not say a thing.~ + shut_up
++ ~Really, I don't honestly know what to say... but I'm really happy for you, nonetheless.~ + pc_1a1
++ ~I really hope people will respect you more now, and don't treat you with prejudice.~ + pc_1a2
+ ~GlobalLT("chapter","global",4)~ + ~I don't want to appear too harsh, but we're in a hurry to rescue Imoen. Let's get moving.~ + pc_1_end
+ ~GlobalGT("chapter","global",3)~ + ~I don't want to appear too harsh, but I am missing my soul, and would want it back soon.. Let's get moving.~ + pc_1_end
END

IF ~~ pc_1b
SAY ~Don't blame yourself. You are a worthy man, wether with or without a Paladin Status.~ = ~Maybe if you can purge you of your taint, things would be easier, and you could concentrate on virtue and goodness instead of having to ally with thieves to kill all sort of power-mad wizards...~
IF ~~ + pc_1a
END

IF ~~ pc_1d
SAY ~Until you support my cause, like what you did now, and don't commit evil acts, you'll do fine. The path of a paladin is tough, and long, not for everybody. There's no shame if it's beyond your reach.~
IF ~~ + pc_1a
END

IF ~~ pc_1c
SAY ~Indeed, I don't know which is more wonderful: somebody with your dark taint, or a non-human like me, becoming a paladin against all odds..~
IF ~~ + pc_1a
END

IF ~~ pc_1a1
SAY ~Really, I have to thank you for helping me through this.~ = ~Wow!~
IF ~~ + pc_1_end
END

IF ~~ pc_1a2
SAY ~The respect of others doesn't concern me, I'm concerned with myself and my worthiness.~
IF ~~ + pc_1_end
END

IF ~~ porky_pig
SAY ~You dare even dream of saying such a thing!~ = ~Patrick is warm under the ground and you address me that way?~ = ~And I thought you a friend!~ = ~Don't expect to find me again. *Hope* never to find me again.~
IF ~~ DO ~LeaveParty() DestroySelf()~ EXIT
END

IF ~~ shut_up
SAY ~I don't accept your throwing orders like this.~ = ~(Casts a spell)~
IF ~Alignment(Player1,MASK_GOOD) ReputationGT(Player1,15) GlobalGT("d0virtue","global",14)~ DO ~SpellNoDec(Myself,4212)~/*paladin detect evil; not on spell.ids */ + shut_up_g
IF ~!Alignment(Player1,MASK_EVIL) !ReputationLT(Player1,9) GlobalGT("d0virtue","global",8) OR(3) Alignment(Player1,MASK_GENEUTRAL) ReputationLT(Player1,15) GlobalLT("d0virtue","global",15)~ DO ~SpellNoDec(Myself,4212)~ + shut_up_n
IF ~OR(3) Alignment(Player1,MASK_EVIL) ReputationLT(Player1,9) GlobalGT("d0virtue","global",0) OR(3) Alignment(Player1,MASK_EVIL) ReputationLT(Player1,9) GlobalLT("d0virtue","global",9)~ DO ~SpellNoDec(Myself,4212)~ + shut_up_e
END

IF ~~ shut_up_g
SAY ~I will stay here and won't utter a word more.~ = ~At least, we're doing good acts.~
IF ~~ DO ~SetGlobal("tb#mazzypcblock","locals",1)~ EXIT
END

IF ~~ shut_up_n
SAY ~I won't stand the such of you after this.~
IF ~~ DO ~ActionOverride("mazzy",LeaveParty()) ActionOverride("mazzy",DestroySelf())~ EXIT
END


IF ~~ heretic
SAY ~How you dare..?~ = ~(Casts a spell)~
IF ~Alignment(Player1,MASK_GOOD) ReputationGT(Player1,15) GlobalGT("d0virtue","global",14)~ DO ~SpellNoDec(Myself,4212)~/*paladin detect evil; not on spell.ids */ + heretic_g
IF ~!Alignment(Player1,MASK_EVIL) !ReputationLT(Player1,9) GlobalGT("d0virtue","global",8) OR(3) Alignment(Player1,MASK_GENEUTRAL) ReputationLT(Player1,15) GlobalLT("d0virtue","global",15)~ DO ~SpellNoDec(Myself,4212)~ DO ~SpellNoDec(Myself,4212)~ + heretic_n //paladin detect evil; not on spell.ids
IF ~OR(3) Alignment(Player1,MASK_EVIL) ReputationLT(Player1,9) GlobalGT("d0virtue","global",0) OR(3) Alignment(Player1,MASK_EVIL) ReputationLT(Player1,9) GlobalLT("d0virtue","global",9)~ DO ~SpellNoDec(Myself,4212)~ + heretic_e
END

IF ~~ heretic_g
SAY ~<CHARNAME>, that joke was not good at all! Please, be more serious, or at least make *good* jokes.~
IF ~~ EXIT
END

END //of append

CHAIN bmazzy shut_up_e
~I won't accept any orders from the likes of you! Prepare to die!~ DO ~ActionOverride("mazzy",ChangeAIScript("",DEFAULT))
	  ActionOverride("mazzy",ChangeAIScript("",GENERAL))
	  ActionOverride("mazzy",ChangeAIScript("",CLASS))
	  ActionOverride("mazzy",ChangeAIScript("mazzyx",SPECIFICS))
	  ActionOverride("mazzy",SetDialog(""))
	  ActionOverride("mazzy",LeaveParty())
	  ActionOverride("mazzy",Enemy())~
== bkeldor IF ~InParty("keldorn")~ THEN ~Mazzy may be sometimes too quick in her decisions, given her age, but in this case she is doubtless right. I'll follow her example.~
DO ~ActionOverride("keldorn",ChangeAIScript("",DEFAULT))
	  ActionOverride("keldorn",ChangeAIScript("",GENERAL))
	  ActionOverride("keldorn",ChangeAIScript("",CLASS))
	  ActionOverride("keldorn",ChangeAIScript("keldornx",SPECIFICS))
	  ActionOverride("keldorn",SetDialog(""))
	  ActionOverride("keldorn",LeaveParty())
	  ActionOverride("keldorn",Enemy())~
== bminsc IF ~InParty("minsc")~ THEN ~Boo, what is happening here? Who is evil and who is good?~ = ~Sqweek!~ = ~Are you sure, Boo? Is <CHARNAME> evil?~ = ~Sqweek!~ = ~I see Boo, you are smarter than me.~ = ~I don't like this, but I'll add <CHARNAME>'s butt to the list of the ones I shall kick.~ = ~RAAAAAARGH!~
DO ~ActionOverride("minsc",ChangeAIScript("",DEFAULT))
	  ActionOverride("minsc",ChangeAIScript("",GENERAL))
	  ActionOverride("minsc",ChangeAIScript("",CLASS))
	  ActionOverride("minsc",ChangeAIScript("minscx",SPECIFICS))
	  ActionOverride("minsc",SetDialog(""))
	  ActionOverride("minsc",LeaveParty())
	  ActionOverride("minsc",Enemy())~
EXIT

CHAIN bmazzy heretic_n
~Since you do not seem to appreciate my views on the world, nor to tolerate them, I think I'll leave your presence. Goodbye.~ DO ~ActionOverride("mazzy",LeaveParty()) ActionOverride("mazzy",DestroySelf())~
== bkeldor IF ~InParty("keldorn")~ THEN ~Mazzy may be sometimes too quick in her decisions, given her age, but in this case she is doubtless right. I'll follow her example.~ DO ~LeaveParty() DestroySelf()~
== banomen IF ~InParty("Anomen") Alignment("Anomen",LAWFUL_GOOD)~ THEN ~I agree with Mazzy. Goodbye, <CHARNAME>.~ DO ~LeaveParty() DestroySelf()~
EXIT

CHAIN bmazzy heretic_e
~I understand all now! You are evil, that's why you said that! Prepare for punishment, <CHARNAME>!~ DO ~ActionOverride("mazzy",ChangeAIScript("",DEFAULT))
	  ActionOverride("mazzy",ChangeAIScript("",GENERAL))
	  ActionOverride("mazzy",ChangeAIScript("",CLASS))
	  ActionOverride("mazzy",ChangeAIScript("mazzyx",SPECIFICS))
	  ActionOverride("mazzy",SetDialog(""))
	  ActionOverride("mazzy",LeaveParty())
	  ActionOverride("mazzy",Enemy())~
== bkeldor IF ~InParty("keldorn")~ THEN ~Mazzy may be sometimes too quick in her decisions, given her age, but in this case she is doubtless right. I'll follow her example.~
DO ~ActionOverride("keldorn",ChangeAIScript("",DEFAULT))
	  ActionOverride("keldorn",ChangeAIScript("",GENERAL))
	  ActionOverride("keldorn",ChangeAIScript("",CLASS))
	  ActionOverride("keldorn",ChangeAIScript("keldornx",SPECIFICS))
	  ActionOverride("keldorn",SetDialog(""))
	  ActionOverride("keldorn",LeaveParty())
	  ActionOverride("keldorn",Enemy())~
== bminsc IF ~InParty("minsc")~ THEN ~Boo, what is happening here? Who is evil and who is good?~ = ~Sqweek!~ = ~Are you sure, Boo? Is <CHARNAME> evil?~ = ~Sqweek!~ = ~I see Boo, you are smarter than me.~ = ~I don't like this, but I'll add <CHARNAME>'s butt to the list of the ones I shall kick.~ = ~RAAAAAARGH!~
DO ~ActionOverride("minsc",ChangeAIScript("",DEFAULT))
	  ActionOverride("minsc",ChangeAIScript("",GENERAL))
	  ActionOverride("minsc",ChangeAIScript("",CLASS))
	  ActionOverride("minsc",ChangeAIScript("minscx",SPECIFICS))
	  ActionOverride("minsc",SetDialog(""))
	  ActionOverride("minsc",LeaveParty())
	  ActionOverride("minsc",Enemy())~
EXIT

CHAIN bmazzy pc_1_end
~Well, we've spent all the time we could on congratulations, and no less than we should.~ = ~It's time to hit the road again.~ = ~May our enemies tremble at the sight of our holy wrath!~ DO ~RealSetGlobalTimer("tb#mazzypctimer","global",3000) SetGlobal("tb#pc","locals",1)~
== baerie IF ~InParty("aerie")~ THEN ~I.. I am so glad good has triumphed and Mazzy had achieved her dream, notwithstanding prejudices...~ = ~I only wish I could get my wings back..~
== bmazzy IF ~InParty("aerie")~ THEN ~Fear not, Aerie! It seems like <CHARNAME> has an innate gift for solving all problems!~
== banomen IF ~InParty("anomen") Alignment("anomen",LAWFUL_GOOD)~ THEN ~Welcome, my sister in arms!~
== bmazzy IF ~InParty("anomen") Alignment("anomen",LAWFUL_GOOD)~ THEN ~I'm not sure why did you change so quickly from your constant mocking me, but I'll accept that as a compliment.~
== banomen IF ~InParty("anomen") Alignment("anomen",LAWFUL_NEUTRAL)~ THEN ~I'm glad you passed your test, while mine hasn't still come..~
== bmazzy IF ~InParty("anomen") Alignment("anomen",LAWFUL_NEUTRAL)~ THEN ~Anomen, just be virtuous all the time and uphold justice, and you'll do right.~
== banomen IF ~InParty("anomen") Alignment("anomen",LAWFUL_NEUTRAL)~ THEN ~I.. thanks for the advice, my lady.~
== banomen IF ~InParty("anomen") Alignment("anomen",CHAOTIC_NEUTRAL)~ THEN ~I hope you'll find your rathole of virtue and justice comfortable, my Lady Knight and miniature - Paladin Mazzy, if I can dare utter your Hallowed name.~
== bmazzy IF ~InParty("anomen") Alignment("anomen",CHAOTIC_NEUTRAL)~ THEN ~Anomen, I didn't tell you to kill Saerk. It was your choiche. Yours.~
== banomen IF ~InParty("anomen") Alignment("anomen",CHAOTIC_NEUTRAL)~ THEN ~So, why did >CHARNAME> give you the right advice and me the wrong one? Why?~
== bmazzy IF ~InParty("anomen") Alignment("anomen",CHAOTIC_NEUTRAL)~ THEN ~Anomen, it's because <HIMHER> learned from <PRO_HISHER> mistakes, and you know this well.~
== banomen IF ~InParty("anomen") Alignment("anomen",CHAOTIC_NEUTRAL)~ THEN ~Yes my Lady!~
== bcernd IF ~InParty("cernd")~ THEN ~Mother Nature's cycle foresees both laugh and cry, joy and sorrow. Remember this, if the winds change.~
== bmazzy IF ~InParty("cernd")~ THEN ~Yes, but I will live through this moment of happiness without pondering its metaphysic meaning.~
== bedwin IF ~InParty("Edwin") Gender("edwin",MALE)~ THEN ~I fail to see the difference from what you were before. (Has she yellow hair by chance? always the same, though.)~
== bmazzy IF ~InParty("Edwin") Gender("edwin",MALE)~ THEN ~Edwin, you too never change.~
== bedwin IF ~InParty("Edwin") Gender("edwin",FEMALE)~ THEN ~I hope *my* wish will become reality too. I'm tired of seeing my wonderful body and not being able to use it. Blah.~
== bmazzy IF ~InParty("Edwin") Gender("edwin",FEMALE)~ THEN ~Edwin, I waited fourty years to let my dream come true. I think it will be the same for you. *giggle*~
== bedwin IF ~InParty("Edwin") Gender("edwin",FEMALE)~ THEN ~(I'll kill her. Slowly, and painfully. I'll sow her head to the plant of the feet of another halfling. She will thank me for making her taller. Yes, really thank me.)~
== bhaerda IF ~InParty("haerdalis")~ THEN ~Really a worthwhile goal achieved, my sparrow.~ = ~I'll write a poem on you, as soon as <CHARNAME> leaves me some free time.~
== bmazzy IF ~InParty("haerdalis")~ THEN ~Em.. thanks for the offer, but I don't deserve this: I only did what I had to.~
== imoen2j IF ~InParty("imoen2") Global("chapter","global",6)~ THEN ~My compliments Mazzy. Now, please, let's kick Bodhi's ass, shall we?~
== bmazzy IF ~InParty("imoen2") Global("chapter","global",6)~ THEN ~It's a good idea Imoen. Actually, I can't wait to smite her with Aroveen's true blessing.~
== imoen2j IF ~InParty("imoen2") Global("chapter","global",7)~ THEN ~My compliments Mazzy. Let's have a party and rejoyce for your success, shall we?~
== bmazzy IF ~InParty("imoen2") Global("chapter","global",7)~ THEN ~There's nothing woth a party, it was just my duty.~
== imoen2j IF ~InParty("imoen2") Global("chapter","global",7)~ THEN ~Why are all you right-doers so shy? Go out loud and start screaming "I'm the best! Evil I shall kill you!"~
== bminsc IF ~InParty("imoen2") InParty("minsc") Global("chapter","global",7)~ THEN ~Yes Mazzy, do exactly like me!~ = ~EVIL, FEEL THE POINT OF MY BOOT! EVIL, FEEL MY SWORD!~
== bmazzy IF ~InParty("imoen2") InParty("minsc") Global("chapter","global",7)~ THEN ~I will do this one day, Minsc. Promised.~
== bjaheir IF ~InParty("jaheira")~ THEN ~I'm glad for you, Mazzy.~
== bmazzy IF ~InParty("jaheira")~ THEN ~Thanks, Jaheira. I look forward for the day when you could be a good-hearted druid.~
== bjaheir IF ~InParty("jaheira")~ THEN ~I can't. Druids must uphold balance, or at least I was taught that.~
== bjan IF ~InParty("jan")~ THEN ~Ah, desires come to an happy ending. It is like that time, back in the Underwear Shortage, that my Uncle Gerhard decided to...~
== bmazzy IF ~InParty("mazy")~ THEN ~Erm, no, thanks, my dear gnome. If I wanted a story, I'd asked a bard to tell it.~
== bhaerda IF ~InParty("haerdalis") InParty("jan")~ THEN ~I'm here. Do you want an epic poem?~ = ~I'll tell of Mazzy ...~
== bmazzy IF ~InParty("haerdalis") InParty("jan")~ THEN ~Thanks for the preview of your next song, Haer Dalis, but I'm not in the mood, at least now.~
== bkeldor IF ~InParty("keldorn")~ THEN ~There aren't words that we need exchange, my colleague. May our blades strike together in battle.~
== bmazzy IF ~InParty("keldorn")~ THEN ~I'm really happy to be in your company, Keldorn. I'm so glad that <CHARNAME> has a party of such good-doers.~
== bmazzy IF ~InParty("keldorn") Class(Player1,PALADIN_ALL)~ THEN ~Of course, <CHARNAME>, may our blades too strike together in battle.~
== bkeldor IF ~InParty("keldorn") Class(Player1,PALADIN_ALL)~ THEN ~Really, <CHARNAME>, in a short time there will be more paladins here than at the Order of the Radiant Heart in Athkatla.~ = ~May evil be forgiven by the Gods when he faces us!~
== bkorgan IF ~InParty("korgan")~ THEN ~Really, Mazzy, you've achieved your dream today. Will ye let me get to mine tonight?~
== bmazzy IF ~InParty("korgan")~ THEN ~Let me think.. No.~
== bminsc IF ~InParty("Minsc")~ THEN ~Ah, the little Mazzy became a Paladin. But why didn't she grew taller?~ = ~All other paladins I knew are tall; perhaps not like me, but at least like any normal human.~
== bmazzy IF ~InParty("Minsc")~ THEN ~Minsc, if I didn't knew you better, I would call this an insult. But I know you didn't do this to insult me, so you're excused.~
== bminsc IF ~InParty("Minsc")~ THEN ~Sorry if I insulted you, but you know that my tongue runs too much for my brains~ = ~But I do not understand, I'm better with blade than with brains.~
== bmazzy IF ~InParty("Minsc")~ THEN ~It's like this: have you ever met a smaller mage? A smaller fighter?~
== bminsc IF ~InParty("Minsc")~ THEN ~Oh, I understood. Boo told me. Boo is always smart.~
== bnalia IF ~InParty("nalia")~ THEN ~I hope that the poor ones will have more possibilities, now that racial prejudices are starting to fall.~
== bmazzy IF ~InParty("nalia")~ THEN ~Nalia, I don't think that my case will be of any help to the poors, since my God Herself had to intervene to let me achieve my dream.~
== bvalyga IF ~InParty("valygar")~ THEN ~Indeed, Mazzy, I see that you came to an happy conclusion to your higher dream.~ = ~I'll be all the merrier to be your squire.~
== bmazzy IF ~InParty("valygar")~ THEN ~As it should be.~
== bviconi IF ~InParty("viconia")~ THEN ~A notewhile goal indeed, for one of the short folk. Ha ha.~ = ~We drow are above these petty surfacer dreams.~
== bmazzy IF ~InParty("viconia")~ THEN ~Viconia, thank Shar or whatever twisted god you worship that you are under this party's tutelage, otherwise I would have killed you and your evil right there where you stand.~
== byoshim IF ~InParty("yoshimo")~ THEN ~Little Lady, for one so cute you are really amazing. Bravo Mazzy!~
== bmazzy IF ~InParty("yoshimo")~ THEN ~Really cute. Try saying that again and you'll withstand my cuteness.~
EXIT

