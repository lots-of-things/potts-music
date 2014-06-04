function val = m_lookup(fa, fb)
	diff = mod(abs(fa-fb), 12);
    switch (diff)
		case 0
			val = 4;%1/2+1/4+1/16;
		case 1
			val = 1;%1/17;
		case 2
			val = 2;%1/9+1/18;
		case 3
			val = 1;%1/19;
		case 4
			val = 2;%1/5+1/10+1/20;
		case 5
			val = 2;%1/21;
		case 6
			val = 1;%1/11+1/22+1/23;
		case 7
			val = 3;%1/3+1/6+1/12+1/24;
		case 8
			val = 1;%1/13+1/25+1/26;
		case 9
			val = 1;%1/27;
		case 10
			val = 2;%1/7+1/14+1/28+1/29;
		case 11
			val = 1;%1/15+1/30+1/31;
    end
	val = -val;
end