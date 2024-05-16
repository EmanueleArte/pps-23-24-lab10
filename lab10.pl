% ---EX 1---
% search (Elem, List)
search(X, cons(X, _)).
search(X, cons(_, Xs)) :- search(X, Xs).

% search2 (Elem, List)
% looks for two consecutive occurrences of Elem
search2(X, cons(X, cons(X, _))).
search2(X, cons(_, Xs)) :- search2(X, Xs).

% search_two (Elem, List)
% looks for two occurrences of Elem with any element in between!
search_two(X, cons(X, cons(_, cons(X, _)))).
search_two(X, cons(_, Xs)) :- search_two(X, Xs).
% It is fully relational.

% search_anytwo (Elem , List )
% looks for any Elem that occurs two times, anywhere
search_anytwo(X, cons(X, Xs)) :- search(X, Xs).
search_anytwo(X, cons(_, Xs)) :- search_anytwo(X, Xs).


% ---EX 2---
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


% ---EX 3---
% same(List1, List2)
% are the two lists exactly the same?
same(nil, nil).
same(cons(X, Xs), cons(Y, Ys)) :- X == Y, same(Xs, Ys).

% all_bigger(List1, List2)
% all elements in List1 are bigger than those in List2, 1 by 1
all_bigger(nil, nil).
all_bigger(cons(X, Xs), cons(Y, Ys)) :- greater(X, Y), all_bigger(Xs, Ys).

% sublist(List1, List2)
% List1 should contain elements all also in List2
sublist(nil, _).
sublist(cons(X, Xs), List2) :- search(X, List2), sublist(Xs, List2).

search(X, cons(X, _)).
search(X, cons(_, Xs)) :- search(X, Xs).


% ---EX 4---
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


% ---EX 5---
% last(List, L) --> L = last element of the list != from nil
% example: last(cons(s(s(zero)), cons(zero, cons(s(zero), nil))), s(zero)).
last(cons(X, nil), X).
last(cons(_, Xs), X) :- last(Xs, X).

% mapPlus1(List, ResList) --> ResList = add 1 to every element of the list
% example: mapPlus1(cons(zero, cons(s(zero), nil)), cons(s(zero), cons(s(s(zero)), nil))).
mapPlus1(cons(X, nil), cons(s(X), Ys)).
mapPlus1(cons(X, Xs), cons(s(X), Ys)) :- mapPlus1(Xs, Ys).

% filterG0(List, ResList) --> list of elements of the first list > 0
% examples: filterG0(cons(zero, cons(s(zero), cons(zero, nil))), cons(s(zero), nil)).
%           filterG0(cons(zero, cons(s(zero), cons(s(s(zero)), nil))), cons(s(zero), cons(s(s(zero)), nil))).
filterG0(nil, nil).
filterG0(cons(X, Xs), Ys) :- not(greater(X, zero)), filterG0(Xs, Ys).
filterG0(cons(X, Xs), cons(X, Ys)) :- greater(X, zero), filterG0(Xs, Ys).

% countG0(List, Size) --> S = number of elements > 0 in the list
% example: countG0(cons(zero, cons(s(zero), cons(s(s(zero)), nil))), s(s(zero))).
%          countG0(cons(s(zero), cons(zero, cons(s(zero), cons(s(s(zero)), nil)))), s(s(s(zero)))).
countG0(nil, zero).
countG0(List, Size) :- filterG0(List, ResList), size(ResList, Size).

% reversed(List, Rev) -> Rev = list in reverse order
% example: reversed(cons(zero, cons(s(zero), cons(s(s(zero)), nil))), cons(s(s(zero)), cons(s(zero), cons(zero, nil)))).
reversed(List, Rev) :- reversed(List, nil, Rev).

reversed(nil, Acc, Acc).
reversed(cons(X, Xs), Acc, Rev) :- reversed(Xs, cons(X, Acc), Rev).
