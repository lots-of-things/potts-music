function H = m_potential(a)
	H = [];
    for i = 1:12
		H = [H a*m_lookup(1, i)];
    end
end