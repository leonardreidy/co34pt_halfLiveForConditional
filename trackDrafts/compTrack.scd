("/home/smc/src/github/howto_co34pt_liveCode/Setup/Setup.scd").load

/*

1,000,000,000 (26-6-17)

*/


p.clock.tempo = 125/60

d[\theresamay] = Buffer.read(s,"~/theresamayDUP.wav".absolutePath)

d[\theresamay].play

(
~henon = Pbind(\instrument,\henon,\freq,Pwhite(1,10)*4410,\dur,Pwrand([0.25,Pseq([0.125],2),0.5],[0.7,0.1,0.2],inf),\a,Pexprand(1.3,1.3),\b,Pexprand(0.3,0.3),\atk,0,\sus,0,\rel,Pexprand(0.01,0.4),\amp,0.5,\pan,Pwhite(-0.6,0.6));
~henon2 = Pbind(\instrument,\henon,\freq,Pwhite(1,10)*4410/2,\dur,Pwrand([0.25,Pseq([0.125],2),0.5],[0.7,0.1,0.2],inf),\a,Pexprand(1.3,1.5),\b,Pexprand(0.3,0.9),\atk,0,\sus,0,\rel,Pexprand(0.01,0.4),\amp,0.5,\pan,Pwhite(-0.6,0.6));
~henon3 = Pbind(\instrument,\henon,\freq,Pwhite(1,10)*100,\dur,Pwrand([0.25,Pseq([0.125],2),0.5],[0.7,0.1,0.2],inf),\a,Pexprand(1.3,1.3),\b,Pexprand(0.3,0.5),\atk,0,\sus,0,\rel,Pexprand(0.01,0.4),\amp,0.5,\pan,Pwhite(-0.6,0.6));
)

(

q = Prewrite(1,
	(
		1: [1,1.01,1,1.05],
		1.01: [1,1.05,1.01,1.01],
		1.05: [1.2, 1, 1.05, 1, 1,1],
		1.2: [1.02,1.03,1.04,1.05]
), 10)
)

s.makeWindow

(
~sin = {SinOscFB.ar({62.5+LFNoise1.kr(0.1)}!2,SinOsc.kr(0.05).range(0.1,1.4),0.2)};
~sin.play;
)

(
~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pbjorklund2(Pwhite(1,5),8)/4,\amp,0.8,\rate,q);
~k2 = Pbind(\instrument,\bplay,\buf,d["t"][1],\dur,Pbjorklund2(Pwhite(1,5),8)/4,\amp,0.8,\rate,q);
~k3 = Pbind(\instrument,\bplay,\buf,d["t"][2],\dur,Pbjorklund2(Pwhite(1,5),8)/4,\amp,0.8,\rate,q)
)

(
~k.play;
~k2.play;
~k3.play;
)

(
~h = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,0.125,\amp,Pwhite(0.1,1),\rate,8,\pan,Pwhite(-1,1));
~h.play;
~hrate = {LFNoise1.kr(0.1).range(8,1)};
p.fadeTime = 2;
~h.set(\rate,~hrate);
)

~filtIn = {Mix.ar([~henon.ar,~henon2.ar,~henon3.ar])}
~filter = {DFM1.ar(~filtIn.ar,500,1.01,1)}
~filter.play

~filter = {DFM1.ar(~filtIn.ar,[1000,500],1.01,1)}

~filter = {Splay.ar(DFM1.ar(~filtIn.ar,[1000,2000,500,4000],1.01,1))}

~filter = {Splay.ar(DFM1.ar(~filtIn.ar,[1000,2000,500,4000,340],1.01,1))}

~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pseq([[0]!20,4,[0]!20,4,[0]!20,4,[0]!20,0.75,0.75,0.75,0.75].flat,inf),\amp,1,\rate,Pwhite(0.1,3));
~c.play
~verb = {FreeVerb.ar(~c,1,0.7,0.4,0.4)}
~verb.play

~filter = {Splay.ar(DFM1.ar(~filtIn.ar,[1000,2000,500,4000,340,Demand.kr(Impulse.kr(p.clock.tempo*4),0,Dwhite(300,1000))],1.01,1))}

~filter = {Splay.ar(DFM1.ar(~filtIn.ar,[1000,2000,500,4000,{Demand.kr(Impulse.kr(p.clock.tempo*4),0,Dwhite(300,1000))}!2].flat,1.01,1))}

~filter = {Splay.ar(DFM1.ar(~filtIn.ar,[1000,2000,500,{Demand.kr(Impulse.kr(p.clock.tempo*4),0,Dwhite(300,1000))}!3].flat,SinOsc.kr(0.01).range(1.01,1.02),1))}

~filter = {Splay.ar(DFM1.ar(~filtIn.ar,[1000,500,{Demand.kr(Impulse.kr(p.clock.tempo*4),0,Dwhite(300,1000))}!4].flat,SinOsc.kr(0.01).range(1.01,1.02),1))}

~filter = {Splay.ar(DFM1.ar(~filtIn.ar,[1000,{Demand.kr(Impulse.kr(p.clock.tempo*4),0,Dwhite(300,2000))}!5].flat,SinOsc.kr(0.01).range(1.01,1.05),1))}

~filter = {Splay.ar(DFM1.ar(~filtIn.ar,[{Demand.kr(Impulse.kr(p.clock.tempo*4),0,Dwhite(300,2000))}!6].flat,SinOsc.kr(0.01).range(1.01,1.05),1))}

(
~henon = Pbind(\instrument,\henon,\freq,Pwhite(1,20)*4410,\dur,Pwrand([0.25,Pseq([0.125],2),0.5],[0.7,0.1,0.2],inf),\a,Pexprand(1.3,1.3),\b,Pexprand(0.3,0.3),\atk,0,\sus,0,\rel,Pexprand(0.01,0.9),\amp,0.5,\pan,Pwhite(-0.6,0.6));
~henon2 = Pbind(\instrument,\henon,\freq,Pwhite(1,20)*4410/2,\dur,Pwrand([0.25,Pseq([0.125],2),0.5],[0.7,0.1,0.2],inf),\a,Pexprand(1.3,1.5),\b,Pexprand(0.3,0.9),\atk,0,\sus,0,\rel,Pexprand(0.01,0.9),\amp,0.5,\pan,Pwhite(-0.6,0.6));
~henon3 = Pbind(\instrument,\henon,\freq,Pwhite(1,20)*100,\dur,Pwrand([0.25,Pseq([0.125],2),0.5],[0.7,0.1,0.2],inf),\a,Pexprand(1.3,1.3),\b,Pexprand(0.3,0.5),\atk,0,\sus,0,\rel,Pexprand(0.01,0.9),\amp,0.5,\pan,Pwhite(-0.6,0.6));
)

~filter = {Splay.ar(DFM1.ar(~filtIn.ar,[{Demand.kr(Impulse.kr(p.clock.tempo*4),0,Dwhite(300,2000))}!8].flat,SinOsc.kr(0.01).range(1.01,1.2),1))}

~filter = {Splay.ar(DFM1.ar(~filtIn.ar,[{Demand.kr(Impulse.kr(p.clock.tempo*[4,6,8].choose),0,Dwhite(300,2000))}!8].flat,SinOsc.kr(0.01).range(1.01,1.2),1))}

~filter = {Splay.ar(DFM1.ar(~filtIn.ar,[{Demand.kr(Impulse.kr(p.clock.tempo*[4,6,8].choose),0,Dwhite(300,2000))}!10].flat,SinOsc.kr(0.01).range(1.01,1.8),1))}

~krm = Pbind(\instrument,\bplay,\buf,d["k"][2],\dur,1,\amp,4);
~krm.play

(
~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pbjorklund2(Pwhite(1,5),8)/4,\amp,1.5,\rate,q);
~k2 = Pbind(\instrument,\bplay,\buf,d["t"][1],\dur,Pbjorklund2(Pwhite(1,5),8)/4,\amp,1.5,\rate,q);
~k3 = Pbind(\instrument,\bplay,\buf,d["t"][2],\dur,Pbjorklund2(Pwhite(1,5),8)/4,\amp,1.5,\rate,q)
)

~filter = {Splay.ar(DFM1.ar(~filtIn.ar,[{Demand.kr(Impulse.kr(p.clock.tempo*[4,6,8].choose),0,Dwhite(300,2000))}!19].flat,SinOsc.kr(0.01).range(1.01,Line.kr(1.8,30,30)),1))}


//a line
~filter = {Splay.ar(DFM1.ar(~filtIn.ar,[{Demand.kr(Impulse.kr(p.clock.tempo*[4,6,8].choose),0,Dwhite(300,Line.kr(2000,350.0,20).poll(1)))}!19].flat,SinOsc.kr(0.01).range(20,50),1))}

~c2 = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,0.75,\amp,1,\rate,1.2,\pan,Pwhite(-1,1));
~c2.play

//a line
~filter = {Splay.ar(DFM1.ar(~filtIn.ar,[{Demand.kr(Impulse.kr(p.clock.tempo*[4,6,8].choose),0,Dwhite(300,Line.kr(350,250.0,20).poll(1)))}!19].flat,SinOsc.kr(0.01).range(20,50),1))}

~filter = {Splay.ar(DFM1.ar(~filtIn.ar,[{Demand.kr(Impulse.kr(p.clock.tempo*[4,6,8].choose),0,Dwhite(300,250))}!32].flat,SinOsc.kr(0.01).range(20,50),1))}

(
~krm2 = Pbind(\instrument,\bplay,\buf,d["sk"][0],\dur,1,\amp,4,\rate,1.2);
~krm3 = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,5,\rate,1);
~krm2.play;
~krm3.play;
)

(
~theresamay = Pbind(\instrument,\bplay,\buf,d[\theresamay],\dur,Pseq([1],1),\amp,1,\rel,500,\amp,3);
~theresamay.play;
)

~filter = {Splay.ar(DFM1.ar(~filtIn.ar,[{Demand.kr(Impulse.kr(p.clock.tempo*[4,6,8].choose),0,Dwhite(300,Line.kr(250,10,30)))}!32].flat,SinOsc.kr(0.01).range(20,50),1))}

~filter = {Splay.ar(DFM1.ar(~filtIn.ar,[{Demand.kr(Impulse.kr(p.clock.tempo*[4,6,8].choose),0,Dwhite(200,10))}!32].flat,SinOsc.kr(0.01).range(20,50),1))}

~filter = {Splay.ar(DFM1.ar(~filtIn.ar,[{Demand.kr(Impulse.kr(p.clock.tempo*[4,6,8].choose),0,Dwhite(20,10))}!32].flat,SinOsc.kr(0.01).range(20,50),1))}

(
~k.stop(1);
~k2.stop(1);
~k3.stop(1);
~krm.stop(1);
~oh.stop(1);
~krm2.stop(1);
~krm3.stop(1);
~c2.stop(1);
~h.stop(1);
~c.stop(1);
)

~filter = {Splay.ar(DFM1.ar(~filtIn.ar,[{Demand.kr(Impulse.kr(p.clock.tempo*[4,6,8].choose),0,Dwhite(2,50))}!32].flat,SinOsc.kr(0.01).range(20,500),1))}

~filter = {Splay.ar(DFM1.ar(~filtIn.ar,[{Demand.kr(Impulse.kr(p.clock.tempo*[4,6,8].choose),0,Dwhite(2,200))}!60].flat,SinOsc.kr(0.01).range(20,500),1))}

~verb.stop(2)

~filter.stop(2)

~sin.stop(10)

