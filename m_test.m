numNotes = 12;
numInsts = 6;
uniqueInsts = 2;

fs = unidrnd(numNotes, 1, numInsts);


aquench = 2;
ahigh = 2;
amid = 1;
alow = 0.1;
bfactor = 1.2;
bquench = 3*bfactor;
bhigh = 2*bfactor;
bmid = 1*bfactor;
blow = 0.1*bfactor;
bzero = 0*bfactor;

a = [aquench*ones(1, 8), linspace(aquench, ahigh, 8), ahigh*ones(1, 8), linspace(ahigh, amid, 8), amid*ones(1, 8), linspace(amid, alow, 8), alow*ones(1, 16), linspace(alow, amid, 8), amid*ones(1, 16), linspace(amid, alow, 8), linspace(alow, amid, 8), amid*ones(1, 8), amid*ones(1, 16), linspace(amid, ahigh, 8), linspace(ahigh, amid, 8), amid*ones(1, 24), linspace(amid, alow, 8), alow*ones(1, 3*16), linspace(alow, amid, 8), amid*ones(1, 8*4), linspace(amid, alow, 8), alow*ones(1, 8), linspace(alow, amid, 8), amid*ones(1, 24), linspace(amid, alow, 8), linspace(amid, ahigh, 8), ahigh*ones(1, 8)];

b = [blow*ones(1, 4*8), linspace(blow, bhigh, 8), bhigh*ones(1, 8), linspace(bhigh, bmid, 8), linspace(bmid, bhigh, 8), bhigh*ones(1, 8), linspace(bhigh, blow, 8), blow*ones(1, 6*8), linspace(blow, bmid, 8), bmid*ones(1, 8), linspace(bmid, bhigh, 8), bhigh*ones(1, 8), bhigh*ones(1, 2*16), linspace(bhigh, bquench, 8), linspace(bquench, bhigh, 8), linspace(bhigh, bmid, 8), bmid*ones(1, 8+16*4), linspace(bmid, bhigh, 8), linspace(bhigh, bquench, 8), bquench*ones(1, 8), bquench*ones(1, 8), linspace(bquench, blow, 8), blow*ones(1, 8)];


f0List = [];
melody = [1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9];
durationList = [];
rhythm = [4, 4, 2, 6, 6, 4, 2, 4, 4, 4, 2, 6, 6, 4, 2, 4];
for i=1:length(a)/length(melody)
	f0List = [f0List melody];
	durationList = [durationList rhythm];
end
a = [a ahigh*ones(1, 13)];
b = [b blow*ones(1, 13)];
f0List = [f0List, 2, 11, 9, 11, 1, 11, 9, 11, 4, 11, 9, 11, 2];
durationList = [durationList, 4, 4, 2, 6, 6, 4, 2, 4, 4, 4, 2, 6, 8];
burnin = 10*ones(1, length(f0List));
b = b/numInsts;
m_song(a, b, fs, numInsts, uniqueInsts, numNotes, f0List, durationList, burnin);
plot(1:length(a), a, 1:length(b), b);
