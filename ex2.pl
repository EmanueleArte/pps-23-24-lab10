%%% size(List, Size)
% Size will contain the number of elements in List, written using notation zero, s(zero), s(s(zero)).
size(nil, zero).
size(cons(_, Xs), s(N)) :- size(Xs, N).
% Yes, it allows a pure relational behaviour.

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
max(cons(E, L), Max) :- max(L, E, Max).
max(nil, TempMax, TempMax).
max(cons(E, L), TempMax, Max) :- not(greater(E, TempMax)), max(L, TempMax, Max).
max(cons(E, L), TempMax, Max) :- greater(E, TempMax), max(L, E, Max).

greater(s(_), zero).
greater(s(N), s(M)) :- greater(N, M).

% min - max (List, Min, Max)
% Min is the smallest element in List
% Max is the biggest element in List
% Suppose the list has at least one element
minmax(cons(E, L), Min, Max) :- minmax(L, E, E, Min, Max).
minmax(nil, TempMin, TempMax, TempMin, TempMax).
minmax(cons(E, L), TempMin, TempMax, Min, Max) :- greater(E, TempMin), not(greater(E, TempMax)), minmax(L, TempMin, TempMax, Min, Max).
minmax(cons(E, L), TempMin, TempMax, Min, Max) :- greater(E, TempMax), minmax(L, TempMin, E, Min, Max).
minmax(cons(E, L), TempMin, TempMax, Min, Max) :- not(greater(E, TempMin)), minmax(L, E, TempMax, Min, Max).

% max(cons(s(zero), cons(s(s(zero)), cons(zero, nil))), Max)
% minmax(cons(s(zero), cons(s(s(zero)), cons(zero, nil))), Min, Max)