% Lista 1 - Caio Gomes de Mello

% q1 - concatenar

concatenar([], L2, L2).
concatenar([X|R],L2,[X|L3]) :- concatenar(R,L2,L3).

% q2 - concatenar inverso

concatenarInv(L1,[],L1).
concatenarInv(L1, [X|R],[X|L3]) :- concatenarInv(L1,R,L3).

% q3 - concatenar uma lista de listas

concatenarL([], []).
concatenarL([L|R], X) :- concatenarL(R, RX), concatenar(L,RX,X). 