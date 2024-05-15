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
