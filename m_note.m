function [flist, fs] = m_note(f0, duration, numNotes, fs, a, b, burnin)
    flist = [];
    for iter = 1:(duration+burnin)
        fpart = [];
        for i = 1:length(fs)
            fold = fs(i);
            Hold = m_energy(f0, fold, fs, a, b);
            fnew = unidrnd(numNotes);
            Hnew =  m_energy(f0, fnew, fs, a, b);
            alph = exp((Hold-Hnew));
            if (alph>=1)
                fs(i) = fnew;
            else
                if (unifrnd(0, 1) < alph)
                    fs(i) = fnew;
                end
            end
            fpart = [fpart fs(i)];
        end
        if(iter>burnin)
            flist = [flist; fpart];
        end
    end
end