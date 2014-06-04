function m_song(a, b, fs, numInsts, uniqueInsts, numNotes, f0List, durationList, burnin)
	f = 110;
    for i = 1:numNotes-1
		f = [f f(end)*2^(1/12)];
    end
	fs = unidrnd(numNotes, 1, numInsts);
	flists = [];
	statList = [];
    for i = 1:length(f0List)
        i
		[flist, fs] = m_note(f0List(i), durationList(i), numNotes, fs, a(i), b(i), burnin(i));
		statList = [statList; flist];
		flists = [flists; flist];
    end
	lines = '';
    for i = 1:length(flists(1, :))
		currentNote = flists(1, i);
		currentTime = 0;
		t = 0;
        for j = 2:length(flists(:, i))
            if(flists(j, i)~=currentNote)
				lines = [lines, 'i 1', num2str(mod(i, uniqueInsts)), ' ', num2str(currentTime), ' ', num2str(t-currentTime), ' 5000 ', num2str(f(currentNote)), ' 2 \n'];
				currentTime = t;
				currentNote = flists(j, i);
            end
			t = t + 1;
        end
        if (currentTime~=t-1)
			lines = [lines, 'i 1', num2str(mod(i, uniqueInsts)), ' ', num2str(currentTime), ' ', num2str(t-1-currentTime), ' 5000 ', num2str(f(currentNote)), ' 2 \n'];
        end
    end
	startlines = fileread('template_start.txt');
	midlines = fileread('template_middle.txt');
    endlines = fileread('template_end.txt');
	
	
	filenameCSD = 'lowera.csd'; 
	filenameWAV = '-W -o lowera.wav'; 
	filenamePOT = 'loweraPOT.eps';
	filenameSTA = 'loweraSTA.eps';
	fprintf(fopen(filenameCSD,'w'), [startlines filenameWAV midlines lines endlines]);
	
	% system(['csound -d ' filenameCSD]);
end