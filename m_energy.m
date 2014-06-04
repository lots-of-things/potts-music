function H = m_energy(f0, fi, f_nn, a, b)
	sumNN = 0;
    for fj = f_nn
		sumNN = sumNN + m_lookup(fj, fi);
    end
	H = a * m_lookup(f0, fi) + b * sumNN;
end