%%% size(List, Size)
% Size will contain the number of elements in List, written using notation zero, s(zero), s(s(zero)).
size(nil, zero).
size(cons(_, Xs), s(N)) :- size(Xs, N).

% sum_list(List, Sum)
sum(X, zero, X).
sum(X, s(Y), s(Z)) :- sum(X, Y, Z).

sum_list(nil, zero).
sum_list(cons(X, Xs), Z) :- sum_list(Xs, N), sum(X, N, Z).

% count(List, Element, NOccurrences)
% it uses count(List, Element, NOccurrencesSoFar, NOccurrences)
count(List, E, N) :- count(List, E, zero, N).
count(nil, E, N, N).
count(cons(E, L), E, N, M) :- count(L, E, s(N), M).
count(cons(E, L), E2, N, M) :- E \= E2, count(L, E2, N, M).

% max(List, Max)
% Max is the biggest element in List
% Suppose the list has at least one element
max(cons(E, L), Max) :- max(cons(E, L), E, Max).
max(cons(E, nil), TempMax, TempMax).
max(cons(E, L), TempMax, Max) :- max(L, TempMax, Max).
max(cons(E, L), E, E) :- E \= TempMax, greater(E, TempMax), max(L, E, E).

greater(s(_), zero).
greater(s(N), s(M)) :- greater(N, M).
