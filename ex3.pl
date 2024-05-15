% same(List1, List2)
% are the two lists exactly the same?
same(nil, nil).
same(cons(X, Xs), cons(Y, Ys)) :- X == Y, same(Xs, Ys).

% all_bigger(List1, List2)
% all elements in List1 are bigger than those in List2, 1 by 1
all_bigger(nil, nil).
all_bigger(cons(X, Xs), cons(Y, Ys)) :- greater(X, Y), all_bigger(Xs, Ys).

greater(s(_), zero).
greater(s(N), s(M)) :- greater(N, M).

% sublist(List1, List2)
% List1 should contain elements all also in List2
sublist(nil, _).
sublist(cons(X, Xs), List2) :- search(X, List2), sublist(Xs, List2).

search(X, cons(X, _)).
search(X, cons(_, Xs)) :- search(X, Xs).