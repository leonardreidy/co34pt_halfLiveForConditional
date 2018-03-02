// s/o belisha beacon for always bringing the riffs

("../Setup/Setup.scd").loadRelative

p.clock.tempo = 2;

(
~r2 = {Line.kr(5,50,20)};
~sinfb = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7,8],inf)*Pkr(~r2)*2,\dur,Pwhite(0.01,0.25),\amp,0.2,\fb,0.1,\rel,0.3,\pan,Pwhite(-1.0,1.0));
~sinfb2 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7,8,9],inf)*Pkr(~r2)*2,\dur,Pwhite(0.1,0.2),\amp,0.2,\fb,0.1,\rel,0.3,\pan,Pwhite(-1.0,1.0));
~sinfb3 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7,8,9,10],inf)*Pkr(~r2)*2,\dur,Pwhite(0.07,0.5),\amp,0.2,\fb,0.1,\rel,0.3,\pan,Pwhite(-1.0,1.0));
~sinfb4 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7,8,9,10].reverse,inf)*Pkr(~r2)*2,\dur,Pwhite(0.05,0.15),\amp,0.2,\fb,0.1,\rel,0.3,\pan,Pwhite(-1.0,1.0));
~sinfb5 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7,8].reverse,inf)*Pkr(~r2)*2,\dur,Pwhite(0.1,0.14),\amp,0.2,\fb,0.1,\rel,0.3,\pan,Pwhite(-1.0,1.0));
~sinfb.play;~sinfb2.play;~sinfb3.play;~sinfb4.play;~sinfb5.play
)

p.fadeTime = 10;

~sinfb = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7],inf)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.3);

~sinfb2 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7].reverse,inf)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.3);

~sinfb3.stop(40);

~sinfb4.stop(30);

~sinfb5.stop(20);

~dfmdrone = {DFM1.ar(SinOsc.ar([~r2,~r2*1.01],0,0.1),LFNoise1.kr(0.4).range(~r2,~r2*10).round(~r2),SinOsc.kr(0.05).range(0.99,1.1),1,0,0.003,0.5)};

~dfmdrone = {DFM1.ar(SinOsc.ar([~r2,~r2*1.01],0,0.1),LFNoise1.kr(0.4).range(~r2,~r2*10).round(~r2),SinOsc.kr(0.05).range(0.99,1.1),1,0,0.003,0.5)};

~dfmdrone = {DFM1.ar(SinOsc.ar([~r2,~r2*LFNoise1.kr(0.1).range(0.99,1.01)],0,0.1),{LFNoise1.kr(0.4).range(~r2,~r2*10).round(~r2)}!2,SinOsc.kr(0.05).range(0.99,1.1),1,0,0.003,0.5)};

~dfmdrone.play

p.fadeTime = 3


//run these both a few times
~sinfb = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7],inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.3,\pan,Pwhite(-0.4,0.4));
~sinfb2 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7].reverse,inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.3,\pan,Pwhite(-0.4,0.4));

~sin1 = {arg min = 0.2, max = 1; SinOsc.kr(LFNoise1.kr(0.1).range(0.07,0.12)).range(min,max)};
~sinfb.set(\fb,~sin1);


~sin2 = {arg min = 0.2, max = 1; SinOsc.kr(LFNoise1.kr(0.1).range(0.07,0.12)).range(min,max)};
~sinfb2.set(\fb,~sin2);

//run these both a few times
(
~sinfb = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7],inf,rrand(0,7))*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.3,\pan,Pwhite(-0.4,0.4));
~sinfb2 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7].reverse,inf,rrand(0,7).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.3,\pan,Pwhite(-0.4,0.4));
)

~sinfb3 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7,8,9,10],inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.3,\pan,Pwhite(-0.4,0.4));

~sin3 = {arg min = 0.2, max = 1; SinOsc.kr(LFNoise1.kr(0.112).range(0.07,0.12)).range(min,max)};
~sinfb3.set(\fb,~sin3);
~sinfb3.play;

~k = Pbind(\instrument,\vplay,\buf,d["k"][0],\dur,1,\amp,1,\rel,0.1,\sus,0.1,\atk,0,\rate,0.8);

~k.play

~sinfb4 = Pbind(\instrument,\sinfb,\freq,Pseq((0..10).scramble,inf)*Pkr(~r2)*2,\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.3,\pan,Pwhite(-1.0,1));

~sinfb4.fadeTime = 20;

~sin4 = {arg min = 0.2, max = 1; SinOsc.kr(LFNoise1.kr(0.123).range(0.07,0.12)).range(min,max)};
~sinfb4.set(\fb,~sin4);
~sinfb4.play;

~sinfb4 = Pbind(\instrument,\sinfb,\freq,Pseq((0..10).scramble,inf)*Pkr(~r2)*2,\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.3,\pan,Pwhite(-1.0,1));


~h = Pbind(\instrument,\bplay,\buf,d["ch"][2],\dur,Pwrand([0.25,Pseq([0.125],2)],[0.8,0.2],inf),\amp,Pexprand(0.3,0.8),\rate,1.4);

~h.play



(
Tdef(\task,{
	loop{
		~sinfb4 = Pbind(\instrument,\sinfb,\freq,Pseq((0..rrand(8,10)).scramble,inf)*Pkr(~r2)*[2,2,2,4].choose,\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.3,\pan,Pwhite(-1.0,1));
		rrand(1,20).wait;
}});
)
Tdef(\task).play;


(
Tdef(\task2,{
	loop{
		~sinfb = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7],inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.3,\pan,Pwhite(-0.4,0.4));
		rrand(5,20).wait;
}});
)
Tdef(\task2).play;


(
Tdef(\task3,{
	loop{
~sinfb2 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7].reverse,inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.3,\pan,Pwhite(-0.4,0.4));
		rrand(5,20).wait;
}});
)
Tdef(\task3).play;


(
Tdef(\task4,{
	loop{
		~sinfb3 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7,8,9,10],inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.3,\pan,Pwhite(-0.4,0.4));
		rrand(5,20).wait;
}});
)
Tdef(\task4).play;


~r2 = {SinOsc.kr(0.01).range(50,53)}

~k2 = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pbjorklund2(3,8)/4,\amp,1.4,\rate,1.5);

~k2.play

~verb = {FreeVerb.ar(Mix.ar([~h.ar]),0.5,0.8,0.5)}
~verb.play

(
~t = Pbind(\instrument,\bplay,\buf,d["mt"][0],\dur,Pbjorklund2(5,8,inf,Pwhite(0,3).asStream)/4,\amp,0.8,\rate,Pwhite(1.2,1.4).stutter(Pwhite(10,30).asStream),\pan,-0.8);
~t2 = Pbind(\instrument,\bplay,\buf,d["mt"][0],\dur,Pbjorklund2(5,8,inf,Pwhite(0,3).asStream)/4,\amp,0.8,\rate,Pwhite(1.2,1.4).stutter(Pwhite(10,30).asStream),\pan,0.8);
~t.play;~t2.play;
)

p.clock.tempo = 2.02;

p.clock.tempo = 2.06;

p.clock.tempo = 2.08;

p.clock.tempo = 2.1;

(
Tdef(\task,{
	loop{
		~sinfb4 = Pbind(\instrument,\sinfb,\freq,Pseq((0..rrand(8,10)).scramble,inf)*Pkr(~r2)*[2,2,2,4].choose,\dur,0.25,\amp,0.5,\fb,0.5,\rel,0.15,\pan,Pwhite(-1.0,1));
		rrand(1,20).wait;
}});
)
Tdef(\task).play;


(
Tdef(\task2,{
	loop{
		~sinfb = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7],inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.5,\fb,0.5,\rel,0.15,\pan,Pwhite(-0.4,0.4));
		rrand(5,20).wait;
}});
)
Tdef(\task2).play;


(
Tdef(\task3,{
	loop{
~sinfb2 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7].reverse,inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.15,\pan,Pwhite(-0.4,0.4));
		rrand(5,20).wait;
}});
)
Tdef(\task3).play;

(
Tdef(\task4,{
	loop{
		~sinfb3 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7,8,9,10],inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.1,\pan,Pwhite(-0.4,0.4));
		rrand(5,20).wait;
}});
)
Tdef(\task4).play;

(
~h.stop(10);
~verb.stop(40);
)

(
~t.stop(3);
~t2.stop(5);
)

~ring1 = Pbind(\instrument,\ring1,\f,Pwrand([1,2],[0.7,0.3],inf)*Pkr(~r2),\dur,Pwhite(0.5,1.5).round(0.5),\d,0.6,\a,Pexprand(10,100),\pan,0,\amp,0.8);

~ring1.play

~r2 = {Line.kr(50,55,10)}

~r2 = {Line.kr(55,64,10)}

(
Tdef(\task).clear;
Tdef(\task2).clear;
Tdef(\task3).clear;
Tdef(\task4).clear;
)

(
~sinfb4 = Pbind(\instrument,\sinfb,\freq,Pseq((0..rrand(8,10)).scramble,inf)*Pkr(~r2)*[2,2,2,4].choose,\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.1,\pan,Pwhite(-1.0,1));
~sinfb = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7],inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.1,\pan,Pwhite(-0.4,0.4));
~sinfb2 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7].reverse,inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.1,\pan,Pwhite(-0.4,0.4));
~sinfb3 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7,8,9,10],inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.1,\pan,Pwhite(-0.4,0.4));
)

(
~k2.stop;
~dfmdrone.stop(10);
)

(
~sinfb3.stop(10);
~sinfb4.stop(20);
)

(
~oh = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,Pseq([0,Pseq([1],inf)],inf),\rate,4);
~oh.play;
)

p.fadeTime = 0;

~r2 = {Line.kr(62,54,20)}

(
~k.stop;
~oh.stop;
)

(
~sinfb = Pbind(\instrument,\sinfb,\degree,Pseq([1,2,3,4,5,6,7]-1,inf,Pwhite(0,4).asStream),\scale,Scale.minor,\root,-5,\dur,Pwrand([0.25,0.5],[0.8,0.2],inf),\amp,0.5,\fb,0.5,\rel,0.1,\pan,Pwhite(-0.4,0.4));
~sinfb2 = Pbind(\instrument,\sinfb,\degree,Pseq(([1,2,3,4,5,6,7]-1).reverse,inf),\scale,Scale.minor,\root,-5,\dur,Pwrand([0.25,0.5],[0.8,0.2],inf),\amp,0.5,\fb,0.5,\rel,0.1,\pan,Pwhite(-0.4,0.4));
~ring1 = Pbind(\instrument,\ring1,\degree,Pwrand([0,4],[0.7,0.3],inf),\scale,Scale.minor,\octave,3,\root,-5,\dur,Pwhite(0.5,1.5).round(0.5),\d,0.6,\a,Pexprand(10,100),\pan,0,\amp,0.8,\f,Pkey(\freq));
)

(
~k.play;
~k2.play;
~oh.play;
)

(
~sinfb.fadeTime = 4;
~sinfb2.fadeTime = 4;
)

(
~sinfb = Pbind(\instrument,\sinfb,\degree,Pseq([1,2,3,4,5,6,7]-1,inf,Pwhite(0,4).asStream),\scale,Scale.minor,\root,-5,\dur,Pwrand([0.25,0.5],[0.8,0.2],inf),\amp,0.5,\fb,0.5,\rel,0.1,\pan,Pwhite(-0.4,0.4),\octave,[4,5]);
~sinfb2 = Pbind(\instrument,\sinfb,\degree,Pseq(([1,2,3,4,5,6,7]-1).reverse,inf),\scale,Scale.minor,\root,-5,\dur,Pwrand([0.25,0.5],[0.8,0.2],inf),\amp,0.5,\fb,0.5,\rel,0.1,\pan,Pwhite(-0.4,0.4),\octave,[4,5]);
)

~sn = Pbind(\instrument,\bplay,\buf,d["s"][3],\dur,2,\amp,1);

~sn.play

(
~sinfb = Pbind(\instrument,\sinfb,\degree,Pseq([1,2,3,4,5,6,7]-1,inf,Pwhite(0,4).asStream),\scale,Scale.minor,\root,-5,\dur,Pwrand([0.25,0.5],[0.8,0.2],inf),\amp,0.5,\fb,0.5,\rel,0.1,\pan,Pwhite(-0.4,0.4),\octave,[4,5,6]);
~sinfb2 = Pbind(\instrument,\sinfb,\degree,Pseq(([1,2,3,4,5,6,7]-1).reverse,inf),\scale,Scale.minor,\root,-5,\dur,Pwrand([0.25,0.5],[0.8,0.2],inf),\amp,0.5,\fb,0.5,\rel,0.1,\pan,Pwhite(-0.4,0.4),\octave,[4,5,6]);
)

//this might need work
~fx = Pbind(\instrument,\vplay,\buf,d["sfx"][10],\dur,Pwrand([1.5,Pbjorklund2(10,16,1)/2],[0.9,0.1],inf)/2,\amp,1,\rate,Pwhite(1,1.1).stutter(4),\rel,0.08,\sus,0,\atk,0);

~fx.play

p.fadeTime = 5

(
~sinfb = Pbind(\instrument,\sinfb,\degree,Pseq([1,2,3,4,5,6,7]-1,inf,Pwhite(0,4).asStream),\scale,Scale.minor,\root,-5,\dur,Pwrand([0.25,0.5],[0.8,0.2],inf),\amp,0.5,\fb,0.5,\rel,0.1,\pan,Pwhite(-0.4,0.4),\octave,[3,4,5,6]);
~sinfb2 = Pbind(\instrument,\sinfb,\degree,Pseq(([1,2,3,4,5,6,7]-1).reverse,inf),\scale,Scale.minor,\root,-5,\dur,Pwrand([0.25,0.5],[0.8,0.2],inf),\amp,0.5,\fb,0.5,\rel,0.1,\pan,Pwhite(-0.4,0.4),\octave,[3,4,5,6]);
)

(
~sinfb = Pbind(\instrument,\sinfb,\degree,Pseq([1,2,3,4,5,6,7]-1,inf,Pwhite(0,4).asStream),\scale,Scale.minor,\root,-5,\dur,Pwrand([0.25,0.5],[0.8,0.2],inf),\amp,0.5,\fb,0.5,\rel,0.1,\pan,Pwhite(-0.4,0.4),\octave,[2,3,4,5,6]);
~sinfb2 = Pbind(\instrument,\sinfb,\degree,Pseq(([1,2,3,4,5,6,7]-1).reverse,inf),\scale,Scale.minor,\root,-5,\dur,Pwrand([0.25,0.5],[0.8,0.2],inf),\amp,0.5,\fb,0.5,\rel,0.1,\pan,Pwhite(-0.4,0.4),\octave,[2,3,4,5,6]);
)

~fx.stop(10);

(
~sinfb = Pbind(\instrument,\sinfb,\degree,Pseq([1,2,3,4,5,6,7]-1,inf,Pwhite(0,4).asStream),\scale,Scale.minor,\root,-5,\dur,Pwrand([0.25,0.5],[0.8,0.2],inf),\amp,0.5,\fb,0.5,\rel,0.1,\pan,Pwhite(-0.4,0.4),\octave,[2,3,4,5,6,7]);
~sinfb2 = Pbind(\instrument,\sinfb,\degree,Pseq(([1,2,3,4,5,6,7]-1).reverse,inf),\scale,Scale.minor,\root,-5,\dur,Pwrand([0.25,0.5],[0.8,0.2],inf),\amp,0.5,\fb,0.5,\rel,0.1,\pan,Pwhite(-0.4,0.4),\octave,[2,3,4,5,6,7]);
)


(
~sin1 = {arg min = 0.2, max = 1.5; SinOsc.kr(LFNoise1.kr(0.1).range(0.07,0.12)).range(min,max)};
~sin2 = {arg min = 0.2, max = 1.5; SinOsc.kr(LFNoise1.kr(0.1).range(0.07,0.12)).range(min,max)};
)

~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,0.75,\amp,1);

~c.play;

~c2 = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pbjorklund2(3,8)/4,\amp,1,\rate,1.1);

~c2.play;

(
~sinfb.stop(10);
~sinfb2.stop(20);
~dfmdrone.clear;
~fx.stop(3);
)

(
~c.stop(4);
~c2.stop(4);
~k2.stop(4);
~oh.stop(3);
)

~sn.stop;

~r2 = {66};

p.fadeTime = 0

~ring1 = Pbind(\instrument,\ring1,\f,Pwrand([1,2],[0.7,0.3],inf)*Pkr(~r2),\dur,Pwhite(0.5,1.5).round(0.5),\d,0.6,\a,Pexprand(10,100),\pan,0,\amp,0.8);

//wait

~ring1 = Pbind(\instrument,\ring1,\f,Pwrand([1,2],[0.7,0.3],inf)*Pkr(~r2),\dur,Pwhite(0.5,3).round(0.5)/2,\d,Pexprand(0.3,0.5),\a,Pexprand(10,100),\pan,0,\amp,0.8);

p.clock.tempo = 2.12;

p.clock.tempo = 2.15;

p.clock.tempo = 2.18;

p.clock.tempo = 2.2;

p.clock.tempo = 2.23;

p.clock.tempo = 2.25;

(
~sinfb = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7],inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.1,\pan,Pwhite(-0.4,0.4));
~sinfb2 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7].reverse,inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.1,\pan,Pwhite(-0.4,0.4));
)

(
~sinfb.play;
~sinfb2.play;
)

(
~r2 = {Line.kr(66,75,10)};
~ring1 = Pbind(\instrument,\ring1,\f,(Pwrand([1,2],[0.7,0.3],inf)*Pkr(~r2))/2,\dur,Pwhite(0.5,1.5).round(0.5),\d,0.6,\a,Pexprand(10,100),\pan,0,\amp,0.8);
)

p.clock.tempo = 2.27;

p.clock.tempo = 2.3;

(
~sinfb4 = Pbind(\instrument,\sinfb,\freq,(Pseq([1,2,3,4,5,6,7].reverse,inf,Pwhite(0,4).asStream)*Pkr(~r2))/2,\dur,0.25,\amp,0.4,\fb,0.5,\rel,0.1,\pan,Pwhite(-0.4,0.4));
~sinfb3 = Pbind(\instrument,\sinfb,\freq,(Pseq([1,2,3,4,5,6,7].reverse,inf,Pwhite(0,4).asStream)*Pkr(~r2))/2,\dur,0.25,\amp,0.4,\fb,0.5,\rel,0.1,\pan,Pwhite(-0.4,0.4));
)

(
~sinfb3.play;
~sinfb4.play;
~h.play;
~sn.play;
)

~dfmdrone = {DFM1.ar(SinOsc.ar([~r2,~r2*LFNoise1.kr(0.1).range(0.99,1.01)],0,0.1),{LFNoise1.kr(SinOsc.kr(LFNoise1.kr(0.1).range(0.01,0.04)).range(0.5,1.2)).range(~r2,~r2*10).round(~r2)}!2,SinOsc.kr(0.05).range(0.99,1.1),1,0,0.003,0.5)};

~dfmdrone = {DFM1.ar(SinOsc.ar([~r2,~r2*LFNoise1.kr(0.1).range(0.99,1.01)],0,0.1),{LFNoise1.kr(SinOsc.kr(LFNoise1.kr(0.1).range(0.01,0.04)).range(0.8,1.2)).range(~r2,~r2*10).round(~r2)}!2,SinOsc.kr(0.05).range(0.99,1.1),1,0,0.003,0.5)};

(
~r2 = {Line.kr(75,100,30)};
~dfmdrone.play;
)

~c.play;

(
~sin1 = {arg min = 0.2, max = 2.0; SinOsc.kr(LFNoise1.kr(0.1).range(0.07,0.12)).range(min,max)};
~sin2 = {arg min = 0.2, max = 2.0; SinOsc.kr(LFNoise1.kr(0.1).range(0.07,0.12)).range(min,max)};
~sin3 = {arg min = 0.2, max = 2.0; SinOsc.kr(LFNoise1.kr(0.1).range(0.07,0.12)).range(min,max)};
~sin4 = {arg min = 0.2, max = 2.0; SinOsc.kr(LFNoise1.kr(0.1).range(0.07,0.12)).range(min,max)};
)

~sinfb3.set(\fb,~sin3);
~sinfb4.set(\fb,~sin4);

~r2 = {XLine.kr(100,200,40)}

~c2.play;

p.clock.tempo = 2.32;

p.clock.tempo = 2.35;

p.clock.tempo = 2.39;

p.clock.tempo = 2.4;


(
~c.set(\pan,-1);
~c2.set(\pan,1);
)

//wait until things are super high
~ring1 = Pbind(\instrument,\ring1,\f,(Pwrand([1,2],[0.7,0.3],inf)*Pkr(~r2))/4,\dur,Pexprand(0.5,3).round(0.5)/2,\d,Pexprand(0.21,0.3),\a,Pexprand(10,100),\pan,0,\amp,0.8);

~r2 = {XLine.kr(200,400,40)}

p.clock.tempo = 2.41

p.clock.tempo = 2.42

~k2.play

p.clock.tempo = 2.43

p.clock.tempo = 2.44

p.clock.tempo = 2.45

~r2 = {XLine.kr(400,1000,20)}

p.clock.tempo = 2.46

p.clock.tempo = 2.47

p.clock.tempo = 2.48

p.clock.tempo = 2.49

p.clock.tempo = 2.5

p.clock.tempo = 2.51

p.clock.tempo = 2.52

p.clock.tempo = 2.53

p.clock.tempo = 2.54

p.clock.tempo = 2.55

~r2 = {XLine.kr(1000,3000,20)}

~dfmdrone.play

(
~k.stop;
~c.stop;
~c2.stop;
~sn.stop;
)

~r2 = {XLine.kr(3000,6000,20)}

~r2 = {XLine.kr(6000,12000,20)}

~r2 = {XLine.kr(12000,40000,20)}

//final percussion - this does have an effect
(
~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,0.75,\amp,1,\rate,Pwhite(1,1.3).stutter(20));
~c2 = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pbjorklund2(3,8)/4,\amp,1,\rate,Pwhite(1.1,1.4).stutter(20));
~k = Pbind(\instrument,\bplay,\buf,d["sk"][0],\dur,1,\amp,3);
~k2 = Pbind(\instrument,\bplay,\buf,d["k"][2],\dur,Pbjorklund2(3,8)/4,\amp,1,\rate,Pseq([1.2,1.4,1.2,1.5],inf));
~k3 = Pbind(\instrument,\bplay,\buf,d["k"][2],\dur,Pbjorklund2(Pwhite(3,7),8)/4,\amp,1,\rate,Pseq([1.2,1.4,1.5,1.3,1.6]*1.5,inf));
~oh = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,1);
~sn = Pbind(\instrument,\bplay,\buf,d["s"][1],\dur,2,\amp,2);
~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,Pwrand([0.25,Pseq([0.125],2),Pseq([0.125/2],4)],[0.7,0.29,0.01],inf),\amp,Pexprand(1,1.2),\rate,3);
)

~r2 = {XLine.kr(40000,50000,20)}

(
~oh.play;
~sn.play;
)


//once this has reached ear-splitting nonsense
~r2 = {LFNoise1.kr(0.1).range(40000,90000)}

(
~c.play;
~c2.play;
)

(
~k3.play;
)

p.clock.tempo = 2.55

p.clock.tempo = 2.56

p.clock.tempo = 2.6

~oh = Pbind(\instrument,\bplay,\buf,d["shout"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,Pseq([0,Pseq([1],inf)],inf),\rate,1.4);

~k.play;

(
~k.stop;
~oh.stop;
)

~r2 = {LFNoise1.kr(10).range(40000,1000000)};

(
~k.play;
~oh.play;
)

~r2 = {LFNoise1.kr(100).range(40000,1000000)};

(
~sinfb4 = Pbind(\instrument,\sinfb,\freq,(Pseq([1,2,3,4,5,6,7].reverse,inf,Pwhite(0,4).asStream)*Pkr(~r2))/2,\dur,0.125,\amp,0.3,\fb,0.5,\rel,0.4,\pan,Pwhite(-0.4,0.4));
~sinfb3 = Pbind(\instrument,\sinfb,\freq,(Pseq([1,2,3,4,5,6,7].reverse,inf,Pwhite(0,4).asStream)*Pkr(~r2))/2,\dur,0.125,\amp,0.3,\fb,0.5,\rel,0.3,\pan,Pwhite(-0.4,0.4));
)

(
~sinfb = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7],inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.125,\amp,0.3,\fb,0.5,\rel,0.3,\pan,Pwhite(-0.4,0.4));
~sinfb2 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7].reverse,inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.125,\amp,0.3,\fb,0.5,\rel,0.3,\pan,Pwhite(-0.4,0.4));
)

~r2 = {LFNoise1.kr(0.01).range(40000,50000)};

(
~oh.stop;
~sn.stop;
)

(
~oh = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,4);
~sn = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,2,\amp,1,\rate,0.5);
)

//wait

(
~oh.play;
~sn.play;
~dfmdrone.stop(20);
)

(
~k.stop;
~k2.stop;
~k3.stop;
)

(
~k = Pbind(\instrument,\bplay,\buf,d["sk"][0],\dur,1,\amp,7);
~k2 = Pbind(\instrument,\bplay,\buf,d["k"][2],\dur,Pbjorklund2(3,8)/4,\amp,4,\rate,Pseq([1.4,1.5],inf)*1.4);
)

(
~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,0.75,\amp,3,\rate,Pwhite(1,1.3).stutter(20));
~c2 = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pbjorklund2(3,8)/4,\amp,3,\rate,Pwhite(1.1,1.4).stutter(20));
~k.play;
~k2.play;
)

~r2 = {XLine.kr(50000,100,80).poll(1)};

~ring1.stop;


p.fadeTime=10

(
~sinfb = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7],inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.3,\pan,Pwhite(-0.4,0.4));
~sinfb2 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7].reverse,inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.3,\pan,Pwhite(-0.4,0.4));
~sinfb4 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7].scramble,inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.3,\pan,Pwhite(-0.4,0.4));
~sinfb3 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7].reverse,inf,Pwhite(0,4).asStream)*Pkr(~r2)*2,\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.3,\pan,Pwhite(-0.4,0.4));
)

(
~c.stop;
~c2.stop;
~k2.stop;
~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,5);
)

p.clock.tempo = 2.4

p.clock.tempo = 2.3

p.clock.tempo = 2.2

~dfmdrone.play

~dfmdrone = {DFM1.ar(SinOsc.ar([~r2,~r2*LFNoise1.kr(0.1).range(0.99,1.01)],0,0.1),{LFNoise1.kr(SinOsc.kr(LFNoise1.kr(0.1).range(0.01,0.04)).range(0.8,5.2)).range(~r2,~r2*10).round(~r2)}!2,SinOsc.kr(0.05).range(0.99,1.1),1,0,0.003,0.5)};


//once freq is just above 100
(
~sn.stop;
~k.stop;
)

~h.stop

~oh.stop


~dfmdrone = {DFM1.ar(SinOsc.ar([~r2,~r2*LFNoise1.kr(0.1).range(0.99,1.01)],0,0.1),{LFNoise1.kr(SinOsc.kr(LFNoise1.kr(0.1).range(0.01,0.04)).range(0.8,5.2)).range(~r2,~r2*10).round(~r2)}!2,SinOsc.kr(0.05).range(0.99,1.6),1,0,0.003,0.5)};

~dfmdrone = {DFM1.ar(SinOsc.ar([~r2,~r2*LFNoise1.kr(0.1).range(0.99,1.01)],0,0.1),{LFNoise1.kr(SinOsc.kr(LFNoise1.kr(0.1).range(0.01,0.04)).range(0.8,5.2)).range(~r2,~r2*15).round(~r2)}!2,SinOsc.kr(0.05).range(0.99,1.6),1,0,0.003,0.5)};

~dfmdrone = {DFM1.ar(SinOsc.ar([~r2,~r2*LFNoise1.kr(0.1).range(0.99,1.01)],0,0.1),{LFNoise1.kr(SinOsc.kr(LFNoise1.kr(0.1).range(0.01,0.04)).range(0.8,5.2)).range(~r2,~r2*15).round(~r2).round(2)}!2,SinOsc.kr(0.05).range(0.99,1.6),1,0,0.003,0.5)};

~dfmdrone = {DFM1.ar(SinOsc.ar([~r2,~r2*LFNoise1.kr(0.1).range(0.99,1.01)],0,0.1),{LFNoise1.kr(SinOsc.kr(LFNoise1.kr(0.1).range(0.01,0.04)).range(0.8,10.2)).range(~r2,~r2*15).round(~r2).round(2)}!2,SinOsc.kr(0.05).range(0.99,1.6),1,0,0.003,0.5)};

~dfmdrone = {DFM1.ar(SinOsc.ar([~r2,~r2*LFNoise1.kr(0.1).range(0.99,1.01)],0,0.1),{LFNoise1.kr(SinOsc.kr(LFNoise1.kr(0.1).range(0.01,0.04)).range(0.8,100.2)).range(~r2,~r2*15).round(~r2).round(2)}!2,SinOsc.kr(0.05).range(0.99,1.6),1,0,0.003,0.5)};

(
~sinfb.stop(20);
~sinfb2.stop(30);
~sinfb3.stop(40);
~sinfb4.stop(50);
)

~dfmdrone = {DFM1.ar(SinOsc.ar([~r2,~r2*LFNoise1.kr(0.1).range(0.99,1.01)],0,0.1),{LFNoise1.kr(SinOsc.kr(LFNoise1.kr(0.1).range(0.01,0.04)).range(0.8,100.2)).range(~r2,~r2*15).round(~r2).round(4)}!2,SinOsc.kr(0.05).range(0.99,1.6),1,0,0.003,0.5)};


~dfmdrone = {DFM1.ar(SinOsc.ar([~r2,~r2*LFNoise1.kr(0.1).range(0.99,1.01)],0,0.1),{LFNoise1.kr(SinOsc.kr(LFNoise1.kr(0.1).range(0.01,0.04)).range(0.8,100.2)).range(~r2,~r2*15).round(~r2).round(4)}!2,SinOsc.kr(0.05).range(0.99,2.6),1,0,0.003,0.5)};

~dfmdrone = {DFM1.ar(SinOsc.ar([~r2,~r2*LFNoise1.kr(0.1).range(0.99,1.01)],0,0.1),{LFNoise1.kr(SinOsc.kr(LFNoise1.kr(0.1).range(0.01,10)).range(0.8,100.2)).range(~r2,~r2*15).round(~r2).round(4)}!2,SinOsc.kr(0.05).range(0.99,2.6),1,0,0.003,0.5)};

~dfmdrone = {DFM1.ar(SinOsc.ar([~r2,~r2*LFNoise1.kr(0.1).range(0.99,1.01)],0,0.1),{LFNoise1.kr(SinOsc.kr(LFNoise1.kr(20).range(0.01,0.04)).range(0.8,100.2)).range(~r2,~r2*15).round(~r2).round(4)}!2,SinOsc.kr(0.05).range(1.99,5.6),1,0,0.03,0.5)};

~dfmdrone = {DFM1.ar(SinOsc.ar([~r2,~r2*LFNoise1.kr(0.1).range(0.99,1.01)],0,0.1),{LFNoise1.kr(SinOsc.kr(LFNoise1.kr(0.1).range(0.01,0.04)).range(0.8,100.2)).range(~r2,~r2*15).round(~r2).round(4)}!2,SinOsc.kr(0.05).range(1.99,2.6),1,0,0.003,0.5)};

~dfmdrone = {DFM1.ar(SinOsc.ar([~r2,~r2*LFNoise1.kr(0.1).range(0.99,1.01)],0,0.1),{LFNoise1.kr(SinOsc.kr(LFNoise1.kr(0.1).range(0.01,0.04)).range(0.8,400.2)).range(~r2,~r2*45).round(~r2).round(4)}!2,SinOsc.kr(100).range(1.99,2.6),1,0,0.003,0.5)};

~dfmdrone = {DFM1.ar(SinOsc.ar([~r2,~r2*LFNoise1.kr(0.1).range(0.99,1.01)],0,0.5),{LFNoise1.kr(SinOsc.kr(LFNoise1.kr(0.1).range(0.01,0.04)).range(0.8,400.2)).range(~r2,~r2*45).round(~r2).round(4)}!2,SinOsc.kr(100).range(1.99,2.6),1,0,0.003,0.5)};

~dfmdrone = {DFM1.ar(SinOsc.ar([~r2,~r2*LFNoise1.kr(0.1).range(0.99,1.01)],0,0.5),{LFNoise1.kr(SinOsc.kr(LFNoise1.kr(0.1).range(0.01,0.04)).range(0.8,400.2)).range(~r2,~r2*45).round(~r2).round(4)}!2,SinOsc.kr(100).range(1.99,12.6),1,0,0.003,0.5)};

~dfmdrone = {DFM1.ar(SinOsc.ar([~r2,~r2*LFNoise1.kr(0.1).range(0.99,1.01)],0,0.5),{LFNoise1.kr(SinOsc.kr(LFNoise1.kr(0.1).range(0.01,0.04)).range(0.8,400.2)).range(~r2,~r2*45).round(~r2).round(4)}!2,SinOsc.kr(100).range(1.99,12.6),1,0,0.3,0.5)};


~dfmdrone.fadeTime = 20

~dfmdrone = {DFM1.ar(SinOsc.ar([~r2,~r2*LFNoise1.kr(0.1).range(0.99,1.01)],0,0.5),{LFNoise1.kr(SinOsc.kr(LFNoise1.kr(0.1).range(0.01,0.04)).range(0.8,4000.2)).range(~r2,~r2*450).round(~r2).round(4)}!2,SinOsc.kr(100).range(1.99,12.6),1,0,0.003,0.5)};

(
~r2 = {Line.kr(100,90000,15)};
~dfmdrone.stop(10);
)