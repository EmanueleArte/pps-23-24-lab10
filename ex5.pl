% last(List, L) --> L = last element of the list != from nil
% example: last(cons(s(s(zero)), cons(zero, cons(s(zero), nil))), s(zero)).
last(cons(X, nil), X).
last(cons(_, Xs), X) :- last(Xs, X).

% mapPlus1(List, ResList) --> add 1 to every element of the list
% example: mapPlus1(cons(zero, cons(s(zero), nil)), cons(s(zero), cons(s(s(zero)), nil))).
mapPlus1(cons(X, nil), cons(s(X), Ys)).
mapPlus1(cons(X, Xs), cons(s(X), Ys)) :- mapPlus1(Xs, Ys).

% filterG0(List, ResList) --> list of elements of the first list > 0
% examples: filterG0(cons(zero, cons(s(zero), cons(zero, nil))), cons(s(zero), nil)).
%           filterG0(cons(zero, cons(s(zero), cons(s(s(zero)), nil))), cons(s(zero), cons(s(s(zero)), nil))).
filterG0(nil, nil).
filterG0(cons(X, Xs), Ys) :- not(greater(X, zero)), filterG0(Xs, Ys).
filterG0(cons(X, Xs), cons(X, Ys)) :- greater(X, zero), filterG0(Xs, Ys).

greater(s(_), zero).
greater(s(N), s(M)) :- greater(N, M).