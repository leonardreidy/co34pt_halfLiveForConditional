("../Setup/Setup.scd").loadRelative

s.makeWindow

(
p.clock.tempo = 2.3;
l = Pbjorklund2(Pwhite(1,10),16)/4;
~r = {0};
d[\scale] = Scale.chromatic(\et53);
~ring1 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,0,\octave,3,\dur,l,\d,0.6,\a,1,\pan,0,\amp,0.5);
~ring1.play;
)

~ring1 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,0,\octave,Pwrand([3,2],[10,1].normalizeSum,inf),\dur,l,\d,0.6,\a,Pexprand(1,100),\pan,0,\amp,0.5);

(
~ring2 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,0,\octave,Pwrand([2,3],[10,1].normalizeSum,inf),\dur,l,\d,0.31,\a,Pexprand(1,100),\pan,0,\amp,0.5);
~ring2.play;
)

(
~oh = Pbind(\instrument,\bplay,\buf,d["oh"][0],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,Pseq([0,Pseq([1],inf)],inf),\rate,2);
~oh.play;
)


~ring2 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,0,\octave,Pwrand([2,3],[10,1].normalizeSum,inf),\dur,l,\d,0.31,\a,Pexprand(1,400),\pan,0,\amp,0.5);

(
~ring2lsf = {LowShelf.ar(~ring2.ar,150,1,4)};
~ring2lsf.play;
)

~oh.stop(0.3);

(
~ring3 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,4),\octave,Pwrand([5,6],[10,1].normalizeSum,inf),\dur,1,\d,0.6,\a,1,\pan,0,\amp,0.5);
~ring3.play
)

(
~ring4 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,4),\octave,Pwrand([6,5],[10,1].normalizeSum,inf),\dur,1,\d,0.6,\a,1,\pan,0,\amp,0.5);
~ring4.play
)

(
~oh.play;
~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,Pwrand([0.25,Pseq([0.125],2)],[7,1].normalizeSum,inf),\amp,Pexprand(0.05,1),\rate,2);
~h.play;
)

(
~ring3 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,4),\octave,Pwrand([5,6],[10,1].normalizeSum,inf),\dur,1,\d,[0.6,0.21],\a,[1,Pexprand(1,100).asStream],\pan,0,\amp,0.3);
~ring4 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,4),\octave,Pwrand([6,5],[10,1].normalizeSum,inf),\dur,1,\d,[0.6,0.21],\a,[1,Pexprand(1,100).asStream],\pan,0,\amp,0.3);
)

(
~ring3 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,4),\octave,Pwrand([5,6],[10,1].normalizeSum,inf),\dur,l,\d,[0.6,0.21],\a,[1,Pexprand(1,100).asStream],\pan,0,\amp,0.3);
~ring4 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,4),\octave,Pwrand([6,5],[10,1].normalizeSum,inf),\dur,l,\d,[0.6,0.21],\a,[1,Pexprand(1,100).asStream],\pan,0,\amp,0.3);
)

(
~ring3 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,4),\octave,Pwrand([5,6],[10,1].normalizeSum,inf),\dur,l,\d,[0.6,0.21],\a,[1,Pexprand(1,100).asStream],\pan,0.8,\amp,0.5);
~ring4 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,4),\octave,Pwrand([6,5],[10,1].normalizeSum,inf),\dur,l,\d,[0.6,0.21],\a,[1,Pexprand(1,100).asStream],\pan,-0.8,\amp,0.5);
)

(
~k = Pbind(\instrument,\bplay,\buf,d["k"][2],\dur,Pbjorklund2(Pwrand([3,5],[0.7,0.3],inf),8)/4,\amp,1.4,\rate,Pseq([1.2,1.3,1.2,1.5],inf));
~k.play;
)

(
~oh.stop;
~h.stop;
)

(
~t = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,l,\amp,1.5,\rate,Pwrand([1.25,1.5,1.75],[0.7,0.2,0.1],inf),\pan,-0.7);
~t2 = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,l,\amp,1.5,\rate,Pwrand([1.75,1.5,1.25],[0.7,0.2,0.1],inf),\pan,0.7);
~t2.play;
~t.play;
)

~k.stop;

(
~k2 = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,5);
~k2.play;~k.play;
)

~oh.play;~h.play;

(
~sinfb = Pbind(\instrument,\sinfb,\scale,Scale.minor,\root,Pkr(~r),\octave,5,\degree,[0,Pseq([4,5,3,4].stutter(100),inf).asStream],\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.6);
~sinfbOsc ={SinOsc.kr(0.05).range(0.1,1.9)};
~sinfb.set(\fb,~sinfbOsc);
~verb = {LeakDC.ar(FreeVerb.ar(~sinfb.ar,1,0.99,0.1,0.8))};
~verb.play;
//delay
~delaySend = {Mix.ar([~verb.ar])};
~delay = {arg del = 10, min = 0.1, max = 0.1; LeakDC.ar(CombC.ar(NumChannels.ar([~delaySend]),p.clock.tempo*4,SinOsc.kr(0.01).range(min,max),del))*0.9};
~delay.play;
)

~sinfb.set(\octave,[6,5])

~sinfb.set(\octave,[6,5,4])

~k.stop;~k2.stop;~h.stop;~oh.stop;

~sinfb.set(\octave,[4,5,6])

~sinfb.set(\octave,[5,6])

~sinfb.set(\octave,[6,7])

(
~sinfbLin = {Line.kr(0.3,2,10)};
~sinfb.set(\fb,~sinfbLin)
)

~ring1.stop;

(
~ring2.stop;
~ring2lsf.stop;
)

~ring3.stop;

~ring4.stop;

~t.stop;~t2.stop;

~delay.set(\del,100)

//when things aren't super high
~sinfb.clear

~verb.fadeTime = 4

~delaySend = {Silent.ar}
~verb = {LeakDC.ar(FreeVerb.ar(Mix.ar([~sinfb.ar,(~delay.ar*0.7)]),1,0.99,0.1,0.8))};

~delay.set(\min,0.1);~delay.set(\max,0.2);



(
~delay.stop(10);
~verb.stop(20);
l = Pbjorklund2(Pseq([3,8,10,2,3,6,8,9,6,11,3,13,4,5],inf),16)/4;
~ring3 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,4),\octave,Pwrand([5,6],[10,1].normalizeSum,inf),\dur,l,\d,[0.6,0.21],\a,[1,Pexprand(1,100).asStream],\pan,0.8,\amp,0.5);
~ring4 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,4),\octave,Pwrand([6,5],[10,1].normalizeSum,inf),\dur,l,\d,[0.6,0.21],\a,[1,Pexprand(1,100).asStream],\pan,-0.8,\amp,0.5);
~ring2 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,0,\octave,Pwrand([2,3],[10,1].normalizeSum,inf),\dur,l,\d,0.31,\a,Pexprand(1,100),\pan,0,\amp,0.5);
~ring1 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,0,\octave,Pwrand([3,2],[10,1].normalizeSum,inf),\dur,l,\d,0.6,\a,Pexprand(1,100),\pan,0,\amp,0.5);
~t = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,l,\amp,1,\rate,Pwrand([1.25,1.5,1.75],[0.7,0.2,0.1],inf),\pan,-0.7);
~t2 = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,l,\amp,1,\rate,Pwrand([1.75,1.5,1.25],[0.7,0.2,0.1],inf),\pan,0.7);
~t.play;~t2.play;~ring1.play;~ring2.play;~ring3.play;~ring4.play;
)


(
l = Pbjorklund2(Pseq([3,8,10,2,3,6,8,9,6,11,3,13,4,5],inf),16)/4;
~ring3 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,4),\octave,Pwrand([5,6],[10,1].normalizeSum,inf),\dur,l,\d,[0.6,0.21],\a,[1,Pexprand(1,100).asStream],\pan,0.8,\amp,0.5);
~ring4 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,4),\octave,Pwrand([6,5],[10,1].normalizeSum,inf),\dur,l,\d,[0.6,0.21],\a,[1,Pexprand(1,100).asStream],\pan,-0.8,\amp,0.5);
~ring2 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-8,8),\octave,Pwrand([2,3],[10,1].normalizeSum,inf),\dur,l,\d,0.31,\a,Pexprand(1,400),\pan,0,\amp,0.5);
~ring1 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-8,8),\octave,Pwrand([3,2],[10,1].normalizeSum,inf),\dur,l,\d,0.31,\a,Pexprand(1,400),\pan,0,\amp,0.5);
~t = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,l,\amp,1,\rate,Pwrand([1.25,1.5,1.75],[0.7,0.2,0.1],inf),\pan,-0.7);
~t2 = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,l,\amp,1,\rate,Pwrand([1.75,1.5,1.25],[0.7,0.2,0.1],inf),\pan,0.7);
~sn = Pbind(\instrument,\bplay,\buf,d["s"][1],\dur,l,\amp,1,\rate,Pwrand([1.2,1.5],[0.8,0.2],inf));
~sn.play;
)

(
~k = Pbind(\instrument,\bplay,\buf,d["sk"][0],\dur,1,\amp,1.5);
~k.play;
)

(
~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pwrand([2,Pseq([0.25,0.25,0.25,1.25],1),Pseq([0.75,0.75,2.5],1)],[0.5,0.3,0.2],inf),\amp,1);
~c.play;
)

(
l = Pbjorklund2(Pseq([3,8,10,2,3,6,8,9,6,11,3,13,4,5],inf),16)/4;
~ring3 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,4),\octave,Pwrand([5,6],[10,1].normalizeSum,inf),\dur,l,\d,[0.6,0.21],\a,[1,Pexprand(1,100).asStream],\pan,0.8,\amp,0.5);
~ring4 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,4),\octave,Pwrand([6,5],[10,1].normalizeSum,inf),\dur,l,\d,[0.6,0.21],\a,[1,Pexprand(1,100).asStream],\pan,-0.8,\amp,0.5);
~ring2 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-8,8),\octave,Pwrand([2,3],[10,1].normalizeSum,inf),\dur,l,\d,0.31,\a,Pexprand(1,400),\pan,0,\amp,0.5);
~ring1 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-8,8),\octave,Pwrand([3,2],[10,1].normalizeSum,inf),\dur,l,\d,0.31,\a,Pexprand(1,400),\pan,0,\amp,0.9);
~t = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,l,\amp,1,\rate,Pwrand([1.25,1.5,1.75],[0.7,0.2,0.1],inf),\pan,-0.7);
~t2 = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,l,\amp,1,\rate,Pwrand([1.75,1.5,1.25],[0.7,0.2,0.1],inf),\pan,0.7);
~sn = Pbind(\instrument,\bplay,\buf,d["s"][1],\dur,l,\amp,1,\rate,Pwrand([1.2,1.5],[0.8,0.2],inf));
~sn.play;
)

~ring3 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-20,4),\octave,Pwrand([5,6],[10,1].normalizeSum,inf),\dur,l,\d,[0.6,0.21],\a,[1,Pexprand(1,100).asStream],\pan,0.8,\amp,0.5);

~ring4 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,20),\octave,Pwrand([6,5],[10,1].normalizeSum,inf),\dur,l,\d,[0.6,0.21],\a,[1,Pexprand(1,100).asStream],\pan,-0.8,\amp,0.5);

~ring2 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-16,16),\octave,Pwrand([2,3],[10,1].normalizeSum,inf),\dur,l,\d,0.31,\a,Pexprand(1,400),\pan,0,\amp,0.5);

~ring1 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-8,20),\octave,Pwrand([3,2],[10,1].normalizeSum,inf),\dur,l,\d,0.31,\a,Pexprand(1,400),\pan,0,\amp,0.9);

~oh.play;

~oh = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,1);

(
~ring3 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-20,4),\octave,Pwrand([5,6],[10,1].normalizeSum,inf),\dur,l,\d,[0.6,0.21],\a,[1,Pexprand(1,100).asStream],\pan,0.8,\amp,0.5);
~ring4 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,20),\octave,Pwrand([6,5],[10,1].normalizeSum,inf),\dur,l,\d,[0.6,0.21],\a,[1,Pexprand(1,100).asStream],\pan,-0.8,\amp,0.5);
~ring2 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-16,16),\octave,Pwrand([2,3],[10,1].normalizeSum,inf),\dur,l,\d,0.31,\a,Pexprand(1,400),\pan,0,\amp,0.5);
~ring1 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-8,20),\octave,Pwrand([3,2],[10,1].normalizeSum,inf),\dur,l,\d,0.31,\a,Pexprand(1,400),\pan,0,\amp,0.9);
~t = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,l,\amp,1,\rate,Pwrand([1.25,1.5,1.75,2,3],[0.6,0.2,0.1,0.05,0.05],inf),\pan,-0.7);
~t2 = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,l,\amp,1,\rate,Pwrand([1.75,1.5,1.25,3,2],[0.6,0.2,0.1,0.05,0.05],inf),\pan,0.7);
~sn = Pbind(\instrument,\bplay,\buf,d["s"][1],\dur,l,\amp,1,\rate,Pwrand([1.2,1.5],[0.8,0.2],inf));
~k = Pbind(\instrument,\bplay,\buf,d["sk"][0],\dur,l,\amp,1);
~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,l,\amp,1);
~dfm = {DFM1.ar(SinOsc.ar([36.midicps,36.midicps*1.01],0,0.1),200,SinOsc.kr(0.05).range(0.9,1.1),1,0,0.0003,0.5)};
~oh = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,l,\amp,1);
)

~dfm = {DFM1.ar(SinOsc.ar([36.midicps,36.midicps*1.01],0,0.1),200,SinOsc.kr(0.05).range(0.9,1.1),1,0,0.0003,0.5)};

~dfm = {DFM1.ar(SinOsc.ar([36.midicps,36.midicps*1.01],0,0.1),36.midicps,SinOsc.kr(0.05).range(0.9,1.5),1,0,0.0003,0.5)};

~dfm.play

~c.stop;~c2.stop;~sn.stop;~oh.stop;

~ring1 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,Scale.minor,\root,Pkr(~r),\degree,(Pexprand(1,8).round(1))-1,\octave,Prand([2,3],inf),\dur,0.25,\d,0.28,\a,Pexprand(2,300),\pan,0,\amp,0.8);

(
~dfm2 = {DFM1.ar(SinOsc.ar([(36+12).midicps,(36+12).midicps*1.01],0,0.1),(36+12).midicps,SinOsc.kr(0.05).range(0.9,1.5),1,0,0.0003,0.5)};
~dfm3 = {DFM1.ar(SinOsc.ar([(36+12+12).midicps,(36+12+12).midicps*1.01],0,0.1),(36+12+12).midicps,SinOsc.kr(0.05).range(0.9,1.5),1,0,0.0003,0.5)};
~dfm4 = {DFM1.ar(SinOsc.ar([(36+12+12).midicps,(36+12+12).midicps*1.01],0,0.1),(36+12+12).midicps,SinOsc.kr(0.05).range(0.9,1.5),1,0,0.0003,0.5)};
)

(
~mult = {Line.kr(1,1,1)};
~dfm = {DFM1.ar(SinOsc.ar([36.midicps,36.midicps*1.01]*~mult.kr,0,0.1),(36.midicps)*~mult.kr,SinOsc.kr(0.05).range(0.9,1.5),1,0,0.0003,0.5)};
~dfm2 = {DFM1.ar(SinOsc.ar([((36+12).midicps)*~mult.kr,(((36+12).midicps)*~mult.kr)*1.01],0,0.1),((36+12).midicps)*~mult.kr,SinOsc.kr(0.05).range(0.9,1.5),1,0,0.0003,0.5)};
~dfm3 = {DFM1.ar(SinOsc.ar([((36+12+12).midicps)*~mult.kr,(((36+12+12).midicps)*~mult.kr)*1.01],0,0.1),((36+12+12).midicps)*~mult.kr,SinOsc.kr(0.05).range(0.9,1.5),1,0,0.0003,0.5)};
~dfm4 = {DFM1.ar(SinOsc.ar([((36+12+12).midicps)*~mult.kr,((((36+12+12+12).midicps)*~mult.kr)*1.01)],0,0.1),((36+12+12+12).midicps)*~mult.kr,SinOsc.kr(0.05).range(0.9,1.5),1,0,0.0003,0.5)};
)

~dfm2.play;

~dfm3.play;

~dfm4.play;

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,5);
~k.play


p.clock.tempo = 2.3

p.clock.tempo = 2.28

p.clock.tempo = 2.25

p.clock.tempo = 2.23

p.clock.tempo = 2.2

p.clock.tempo = 2.18

p.clock.tempo = 2.15

p.clock.tempo = 2.1

p.clock.tempo = 2.05

p.clock.tempo = 2

p.clock.tempo = 1.9

p.clock.tempo = 1.8

p.clock.tempo = 1.7

p.clock.tempo = 1.5

p.clock.tempo = 1.4

p.clock.tempo = 1.2

p.clock.tempo = 1.1

p.clock.tempo = 1.0

p.clock.tempo = 0.9

p.clock.tempo = 0.8

p.clock.tempo = 0.7

p.clock.tempo = 0.6

p.clock.tempo = 0.5

p.clock.tempo = 0.4

p.clock.tempo = 0.3

p.clock.tempo = 0.2

p.clock.tempo = 0.1

p.clock.tempo = 0.0000001

~k.stop;~ring1.stop;~ring2.stop;~ring3.stop;~ring4.stop;~t2.stop;~t.stop;~sn.stop;~oh.stop;

p.clock.tempo = 2;

~mult = {XLine.kr(0.01,1,20).linlin(0.01,1,1,0)};

Server.hardFreeAll;


