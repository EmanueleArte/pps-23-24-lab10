% seq(N, E, List) --> List is [E, E,..., E] with size N
% example: seq(s(s(s(zero))), a, cons(a, cons(a, cons(a, nil)))).
seq(zero, _, nil).
seq(s(N), E, cons(E, T)) :- seq(N, E, T).
% It is fully relational.

% seqR(N, List)
seqR(zero, nil).
seqR(s(N), cons(N, T)) :- seqR(N, T).

% seqR2(N, List) --> is [0, 1, ..., N-1]
seqR2(N, List) :- seqR2(N, zero, List).
seqR2(zero, _, nil).
seqR2(s(N), M, cons(M, T)) :- seqR2(N, s(M), T).
