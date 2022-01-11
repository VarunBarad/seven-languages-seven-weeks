minimum([Ele], Ele).
minimum([Ele | Tail], Answer) :-
	minimum(Tail, CurrMin),
	Ele < CurrMin,
	Answer is Ele.
minimum([Ele | Tail], Answer) :-
	minimum(Tail, CurrMin),
	CurrMin < Ele,
	Answer is CurrMin.
