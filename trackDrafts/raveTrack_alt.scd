

("../Setup/Setup.scd").loadRelative

p.clock.tempo = 160/60

s.record

s.stopRecording

(
~pianoChop = Pbind(\instrument,\vplay,\buf,d["piano"][0],\dur,Pwrand([1,0.5,Pseq([0.25],2),Pseq([0.125],4)],[0.1,0.7,0.15,0.05],inf),\atk,0,\sus,0.04,\rel,0.03,\pos,Pexprand(0.2,0.5),\amp,0.8,\rate,2);
~pianoChop2 = Pbind(\instrument,\vplay,\buf,d["piano"][0],\dur,Pwrand([1,0.5,Pseq([0.25],2),Pseq([0.125],4)],[0.1,0.7,0.15,0.05],inf),\atk,0,\sus,0.04,\rel,0.03,\pos,Pexprand(0.2,0.5),\amp,0.8,\rate,4);
~pianoAmp = {Line.kr(0,0.8,10)};
~pianoAmp2 = {Line.kr(0,0.8,20)};
~pianoChop.set(\amp,~pianoAmp);
~pianoChop2.set(\amp,~pianoAmp2);
~pianoChop.play;
~strings = Pbind(\instrument,\bplay,\buf,d["strings"][0],\dur,10,\rate,2.65,\amp,1);
~strings.play;
~pianoChop2.play;
~warp1 = {arg speed = 0.005, winsize = 0.2, rate = 0.5; Warp1.ar(2,d["piano"][0],SinOsc.kr(LFNoise1.kr(0.1).range(0.003,0.006)),rate,winsize,-1,16,0.5,4,Line.kr(0,0.3,30))};
~warp1.play;
)

(
~ravestab = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(Pwhite(1,5),8)/4,\rate,Pseq([1,1,1,1,1,1]*0.885,inf).stutter(3),\amp,1);
~ravestab.play
)

~strings.stop(20)
~warp1.stop(40)

(
~ravestab2 = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(Pwhite(1,14),16)/4,\rate,Pseq([1,1,1,1,1,1]*0.885,inf).stutter(3)*2,\amp,1);
~ravestab2.play
)

~k = Pbind(\instrument,\bplay,\buf,d["t"][1],\dur,1,\amp,1.4,\rate,2);
~k.play;

(
~ravestab3 = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(Pwhite(1,14),16)/4,\rate,Pseq([1,1,1,1,1,1]*0.885,inf).stutter(3)*4,\amp,1);
~ravestab3.play;
~shout = Pbind(\instrument,\bplay,\buf,d["shout"][5],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,Pseq([0,Pseq([1],inf)],inf),\rate,2);
~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,2,\amp,Pseq([0,Pseq([2],inf)],inf),\rate,0.8);
~c.play;
~shout.play;
)

(
~ravestab = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1,1,1,1,1,1]*0.885,inf).stutter(3),\amp,1);
~ravestab2 = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1,1,1,1,1,1]*0.885,inf).stutter(3)*2,\amp,1);
~ravestab3 = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1,1,1,1,1,1]*0.885,inf).stutter(3)*4,\amp,1);
~pianoChop.stop(4);
~pianoChop2.stop(6);
)

(
~k.stop;
~shout.stop;
~c.stop;
~ravestab = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1,1,1,1,1,1]*0.885,inf).stutter(3),\amp,1);
~ravestab2 = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1,1,1,1,1,1]*0.885,inf).stutter(3)*2,\amp,1);
~ravestab3 = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1,1,1,1,1,1]*0.885,inf).stutter(3)*4,\amp,1);
)

(
~ravestab = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1]*0.885,inf).stutter(3),\amp,1);
~ravestab2 = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1]*0.885,inf).stutter(3)*2,\amp,1);
~ravestab3 = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1]*0.885,inf).stutter(3)*4,\amp,1);
)

//delay
(
~delaySend = {Mix.ar([~ravestab3])};
~delay = {CombC.ar(NumChannels.ar([~delaySend]),p.clock.tempo*4,0.1,3)*Line.kr(0,0.4,10)};
~delay.play;
)

~ravestab2 = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(Pwhite(2,14),16)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1]*0.885,inf).stutter(3)*2,\amp,1);

(
~ravestab3 = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(Pwhite(1,10),16)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1]*0.885,inf).stutter(3)*4,\amp,1);
~k.play;
)

(
Task({
	var tempo = 160;
	16.do{
		tempo.postln;
		p.clock.tempo = tempo/60;
		tempo = tempo+1;
		3.wait;
}};
).start;
)

~delay.fadeTime = 10;

~delay = {CombC.ar(NumChannels.ar([~delaySend]),p.clock.tempo*4,0.1,10)*0.4};

~delay = {CombC.ar(NumChannels.ar([~delaySend]),p.clock.tempo*4,SinOsc.kr(0.1).range(0.1,0.05),10)*0.4};

~delay = {CombC.ar(NumChannels.ar([~delaySend]),p.clock.tempo*4,SinOsc.kr(0.1).range(0.1,0.02),20)*0.5};

~delay = {LeakDC.ar(CombC.ar(NumChannels.ar([~delaySend]),p.clock.tempo*4,SinOsc.kr(0.1).range(0.1,0.01),60)*0.8)};

~delay = {LeakDC.ar(CombC.ar(NumChannels.ar([~delaySend]),p.clock.tempo*4,SinOsc.kr(0.1).range(0.1,0.01),60)*0.8)};

~delay = {LeakDC.ar(CombC.ar(NumChannels.ar([~delaySend]),p.clock.tempo*4,SinOsc.kr(LFNoise0.kr(0.4).range(0.08,0.22)).range(0.1,0.01),600)*Line.kr(1,0,20))};

(
~k.stop(5);
~ravestab.stop(10);
~ravestab2.stop(20);
~ravestab3.stop(30);
)

(
~ravestab.clear;
~ravestab2.clear;
~ravestab3.clear;
~delaySend.clear;
)

(
~ravestab2 = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(Pseq([3,3,3,2],inf),8)/2,\rate,Pseq([50,52,55,57].midicps/120,inf).stutter(Pseq([6,5],inf).asStream),\amp,1);
~ravestab2x = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(Pseq([3,3,3,2],inf),8)/2,\rate,Pseq(([50,52,55,57]+7).midicps/120,inf).stutter(Pseq([6,5],inf).asStream),\amp,1);
~ravestab2xx = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(Pseq([3,3,3,2],inf),8)/2,\rate,Pseq(([50,52,55,57]+12).midicps/120,inf).stutter(Pseq([6,5],inf).asStream),\amp,1);
)


(
~delay.stop(30);
~ravestab2.play;
)

(
~kbk = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1);
~kbk2 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1);
)

(
~hipass = {RHPF.ar(Mix.ar([~kbk.ar,~kbk2.ar]),Line.kr(3000,600,20),Line.kr(0.05,0.4,25),0.6)};
~hipass.play;
)

~ravestab2x.play;

~ravestab2xx.play;

(
p.fadeTime = 0;
~kbk.fadeTime = 0;
~kbk.fadeTime = 0;
)

(
~hipass.clear;
~kbk.clear;
~kbk2.clear;
~kbk = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,32,\amp,1,\pan,1,\rate,0.5);
~kbk2 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,32,\amp,1,\pan,-1,\rate,0.5);
~hipass = {RHPF.ar(Mix.ar([~kbk.ar,~kbk2.ar]),600,0.4,0.6)};
~hipass.play;
)

~ravestab2xx.stop;

~ravestab2x.stop;

(
~ravestab2.stop(30);
~verb = {GVerb.ar(Mix.ar(~ravestab2.ar),50,10,Line.kr(0.5,0.1,20),Line.kr(0.5,0.1,15),15,Line.kr(1,0,20),Line.kr(0.7,0,20),mul:Line.kr(0,0.1,20))};
~verb2 = {GVerb.ar(Mix.ar(~verb.ar),200,30,Line.kr(0.5,0.1,20),Line.kr(0.5,0.1,15),15,Line.kr(1,0,20),Line.kr(0.7,0,20),mul:Line.kr(0,1,20))};
~verb.play;
~verb2.play;
~hipass.stop(20);
)

~verb.stop(10);

~verb2.stop(60);

(
~ravestab2 = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(Pseq([3,3,3,2],inf),8)/4,\rate,Pseq([50,52,55,57].midicps/120,inf).stutter(Pseq([6,5],inf).asStream),\amp,1);
~ravestab2x = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(Pseq([3,3,3,2],inf),8)/4,\rate,Pseq(([50,52,55,57]+7).midicps/120,inf).stutter(Pseq([6,5],inf).asStream),\amp,1);
~ravestab2xx = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(Pseq([3,3,3,2],inf),8)/4,\rate,Pseq(([50,52,55,57]+12).midicps/120,inf).stutter(Pseq([6,5],inf).asStream),\amp,1);
)

(
~kbk = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,0.7,\pan,1);
~kbk2 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,0.7,\pan,-1);
~kbkc = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,0.7,\pan,0);
~ravestab2 = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(Pseq([3,3,3,2],inf),8)/4,\rate,Pseq([50,52,55,57].midicps/120,inf).stutter(Pseq([6,5],inf).asStream),\amp,1);
~ravestab2x = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(Pseq([3,3,3,2],inf),8)/4,\rate,Pseq(([50,52,55,57]+7).midicps/120,inf).stutter(Pseq([6,5],inf).asStream),\amp,1);
~ravestab2xx = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(Pseq([3,3,3,2],inf),8)/4,\rate,Pseq(([50,52,55,57]+12).midicps/120,inf).stutter(Pseq([6,5],inf).asStream),\amp,1);
~kbk3 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,32,\amp,0.5,\pan,-1,\rate,0.5);
~kbk4 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,32,\amp,0.5,\pan,1,\rate,0.5);
~kbk5 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,8,\rate,2,\amp,0.5,\pan,Prand([-1,1],inf));
~kbk8 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,8,\rate,2,\amp,0.5,\pan,Prand([-1,1],inf));
~kbk9 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,4,\rate,4,\amp,0.5,\pan,Prand([-1,1],inf));
~kbk10 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,4,\rate,4,\amp,0.5,\pan,Prand([-1,1],inf));
~kbk11 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,64,\rate,0.25,\amp,0.25,\pan,Prand([-1,1],inf));
~kbk12 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,64,\rate,0.25,\amp,0.25,\pan,Prand([-1,1],inf));
~k = Pbind(\instrument,\bplay,\buf,d["sk"][0],\dur,1,\amp,4,\rate,2);
~kbk13 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,2,\rate,8,\amp,0.5,\pan,Prand([-1,1],inf));
~kbk14 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,2,\rate,8,\amp,0.5,\pan,Prand([-1,1],inf));
~lsf = {LowShelf.ar(Mix.ar([~kbk.ar,~kbk2.ar,~kbkc.ar]),200,1,7,0.8)};
~ravestab2.play;
)

~ravestab2.play;

~ravestab2x.play;

~hipass.play;

~ravestab2.play;~ravestab2x.play;~hipass.play;d["ah"][0].play;~lsf.play;~kbk.play;~kbk2.play;~hipass.stop;~kbkc.play

~hipass = {HPF.ar(Mix.ar([~kbk.ar,~kbk2.ar]),1200,0.6)}

~hipass.play

~ravestab2xx.play

~strings.play;

~lsf = {arg db = 8, f = 500; LowShelf.ar(Mix.ar([~kbk.ar,~kbk2.ar,~kbkc.ar]),f,1,db,1)}

//things start getting silly here

~kbk3.play;

~kbk4.play;

~kbk5.play;

~kbk8.play;

~kbk9.play;


~kbk10.play;

~kbk11.play;

~kbk12.play;

~kbk13.play;

~kbk14.play;

~lsf.fadeTime = 10

(
~lsfLine = {Line.kr(10,60,80)};
~lsfLine2 = {Line.kr(500,1000,80)};
~lsf.set(\db,~lsfLine);
~lsf.set(\f,~lsfLine2);
)

//this transition could do with being shorter
(
~ravestab2.stop(20);
~ravestab2x.stop(30);
~ravestab2xx.stop(25);
~kbk3.stop(5);
~kbk4.stop(10);
~kbk5.stop(15);
~kbk8.stop(20);
~hipass.stop(10);
~kbk9.stop(25);
~kbk10.stop(30);
~kbk11.stop(31);
~kbk12.stop(32);
~kbk13.stop(33);
~kbk14.stop(34);
~kbk.stop(10);
~kbk2.stop(10);
~kbkc = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1,\pan,0);
~kbkc2 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,8,\amp,1,\pan,Prand([-1,1],inf));
~kbkc3 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,4,\amp,1,\pan,Prand([-1,1],inf));
~kbkc4 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,2,\amp,1,\pan,Prand([-1,1],inf));
~kbkc5 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,1,\amp,1,\pan,Prand([-1,1],inf));
)

(
~lsfLine = {Line.kr(60,0,10)};
~lsfLine2 = {Line.kr(1000,10,10)};
~lsf.set(\db,~lsfLine);
~lsf.set(\f,~lsfLine2);
)

~lsf.stop(10);

(
~verb.clear;
~verb2.clear;
~delay.clear;
~kbk.clear;
~kbk2.clear;
~kbk3.clear;
~kbk4.clear;
~kbk5.clear;
~kbk8.clear;
)

~kbkc.play;

~kbkc2.play;

~kbkc3.play;

~kbkc4.play;

~kbkc5.play;

~kbkc6 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,0.5,\amp,1,\pan,Prand([-1,1],inf));

~kbkc6.play;

~kbkc7 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,0.25,\amp,1.5,\pan,Prand([-1,1],inf));

~kbkc7.play;

~kbkc7 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,0.25,\amp,4,\pan,Prand([-1,1],inf));

(
Task({
	var tempo = 175;
	16.do{
		tempo.postln;
		p.clock.tempo = tempo/60;
		tempo = tempo+1;
		1.wait;
}};
).start;
)


(
Task({
	var tempo = 375;
	400.do{
		tempo.postln;
		p.clock.tempo = tempo/60;
		tempo = tempo+1;
		0.01.wait;
}};
).start;
)

p.stop

s.stopRecording


/*

I liked this ending but it was too complex so i junked it.

*/

(
//this needs to be in the original key
~one = {PlayBuf.ar(2,d["stab"][2],52.midicps/240,1,0,1)*Line.kr(1,0,5)};
~one.play;
~verb = {GVerb.ar(Mix.ar(~one.ar),50,30,0.1,0.1,15,0.5,0,mul:0.1)};
~verb2 = {GVerb.ar(Mix.ar(~verb.ar),200,30,0.1,0.1,15,0,0,mul:1)};
~verb.play;
~verb2.play;
)

(
~kbkc.stop(1);
~kbkc2.stop(1);
~kbkc3.stop(1);
~kbkc4.stop(1);
~kbkc5.stop(1);
~kbkc6.stop(1);
~kbkc7.stop(1);
)

~pitch = {Pitch.kr(~ravestab2.ar).poll}

~ravestab2.stop