function dPdt = HSode113_b2( t, P, t_0, t_f)
A=[-1 -1;-1 1];
dPdt=((t_f-t_0)/2)*A*P;
end
