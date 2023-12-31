% Lista 1 - Caio Gomes de Mello

% extra 

membro(X, [X|_]) .
membro(X, [_|R]) :- membro(X,R) .

intersecao([], L, []) .
intersecao([X|R1], L, [X|R2]) :- membro(X,L), intersecao(R1, L, R2), !.
intersecao([_,R1], L, R2) :- intersecao(R1,L,R2).

% q1 - concatenar

concatenar([], L2, L2).
concatenar([X|R],L2,[X|L3]) :- concatenar(R,L2,L3).

% q2 - concatenar inverso

concatenarInv(L1,[],L1).
concatenarInv(L1, [X|R],[X|L3]) :- concatenarInv(L1,R,L3).

% q3 - concatenar uma lista de listas

concatenarL([], []).
concatenarL([L|R], X) :- concatenarL(R, RX), concatenar(L,RX,X). 

% q4 - mesclar 

mesclando([], L2, L2).
mesclando(L1, [], L1).
mesclando([X|R1], [Y|R2], [X,Y|L3]) :- mesclando(R1,R2,L3).

% q5 - adicionar no final

adicionarFinal(A, [], [A]).
adicionarFinal(A, [X|R1], [X|R2]) :- adicionarFinal(A,R1,R2).

%  q6 - inverter uma lista

inverter([],[]).
inverter([X|R1], L2) :- inverter(R1,L), adicionarFinal(X,L,L2). 

% q7 - inverter uma lista, tal que as sublistas tb sejam invertidas

inverterLG([],[]).
inverterLG([X|R1], [X2|L2]) :-  is_list(X),
                                inverterLG(X, X2), inverterLG(R1,L2).
inverterLG([X|R1], L2) :- inverterLG(R1,L), adicionarFinal(X,L,L2).

% q8 - parear

parear(E, [], []).
parear(E, [X|R], [[E,X]|L]) :-  parear(E,R,L).

% q9 - pares 

pares([], []).
pares([X|R1], L) :- parear(X, R1, LR), pares(R1, L2), concatenar(LR, L2, L). 

% q11 - permutar

% q12 - conjunto

conjunto([A]).
conjunto([X|R]) :- \+ membro(X,R), conjunto(R).

% q13 - prefixo

prefixo([],_).
prefixo([X|R1],[Y|R2]) :- X == Y, prefixo(R1,R2).

%  q14 - subsequencia

subsequencia([],_).
subsequencia([X|R1],[Y|R2]) :- X \== Y, subsequencia([X|R1],R2).
subsequencia([X|R1], [Y|R2]) :- X == Y, prefixo(R1,R2),!.

% q15 - mescle 

mescle([],X,X).
mescle(X,[],X).
mescle([X|R1],[Y|R2], [Y|R3]) :- X >= Y, mescle([X|R1],R2,R3), !.
mescle([X|R1],[Y|R2], [X|R3]) :- mescle(R1,[Y|R2],R3).

% q16 - mergeSort

mergeSort([], []).
mergeSort([X], [X]).
mergeSort(L, LO) :- separa(L,E,D), mergeSort(E, EO), mergeSort(D, DO), mescle(EO,DO,LO).

separa([], [], []).
separa([X], [X], []).
separa([X,Y|R], [X|R1], [Y|R2]) :- separa(R, R1, R2).

% q17 - mergeSort V1, V2 e V3

% V1

mescleV1(L1, L2, L) :- mescle(L1,L2,L).

% V2

mescleV2([], L2, CC, L2).
mescleV2(L1, [], CC, L1).
mescleV2([X|R1], [Y|R2], CC, [X|R]) :- call(CC,X,Y), mescleV2(R1, [Y|R2], CC, R), !.
mescleV2([X|R1], [Y|R2], CC, [Y|R]) :- mescleV2([X|R1], R2, CC, R).

% V3


mescle3([],L2,_,_,L2) :- !.
mescle3(L1,[],_,_,L1) :- !.
mescle3([E1|R1], [E2|R2], FC, CC, [E1|W]) :-
                                         call(CC,E1,EC1),
                                         call(CC,E2,EC2),
                                         call(FC,EC1,EC2),
                                         mescle3(R1, [E2|R2], FC, CC, W),!.
mescle3([E1|R1], [E2|R2], FC , CC, [E2|W]) :- mescle3([E1|R1], R2, FC, CC, W).

% aplanar

aplanar([], []).
aplanar([X|R], L) :- is_list(X), aplanar(X, RX), aplanar(R, RL), concatenar(RX, RL, L), !.
aplanar([X|R], [X|RL]) :- aplanar(R, RL).
