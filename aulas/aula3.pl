% aula3

% calcular média 
media(A,B,C) :- C is (A+B)/2.


% fatorial 1
fat(0,1).
fat(N,X) :- N > 0,
            M is N-1,
            fat(M,Y),
            X is N*Y.


% fatorial 2
fat2(0,1).
fat2(N,X) :- fat3(N,1,X).

fat3(0,A,A).
fat3(N,A,X) :- N>0,
            M is N-1,
            NA is A*N,
            fat3(M,NA,X),!.


% fatorial 3
fat4(0,1).
fat4(N, N*Z) :- N>0,
                U is N-1,
                fat4(U,Z).


% torre de hanoi
torre_hanoi(1,X,Y,Z) :- write("transfira um disco do "),
                         write(X),
                         write(" para o "),
                         writeln(Y).

torre_hanoi(N,X,Y,Z) :- N>1,
                        M is N-1,
                        torre_hanoi(M,X,Z,Y),
                        torre_hanoi(1,X,Y,_),
                        torre_hanoi(M,Z,Y,X).


% naturais
% nat(X,1) :- X == 0.
% nat(X,N) :- X > 0,
            
