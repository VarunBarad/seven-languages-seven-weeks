fibonacci(0, []).
fibonacci(1, [0]).
fibonacci(2, [1, 0]).
fibonacci(N, [R, X, Y | Z]) :-
	N > 2,
	N1 is N - 1,
	fibonacci(N1, [X, Y | Z]),
	R is X + Y.
