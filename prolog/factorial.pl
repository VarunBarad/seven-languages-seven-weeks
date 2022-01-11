factorial(0, 1).
factorial(X, Answer) :-
	X > 0,
	Y is X - 1,
	factorial(Y, MidAnswer),
	Answer is X * MidAnswer.
