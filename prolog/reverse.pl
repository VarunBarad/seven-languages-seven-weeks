concatenate([], List, List).
concatenate([Head | Tail1], List, [Head | Tail2]) :- concatenate(Tail1, List, Tail2).

reverse_varun([], []).
reverse_varun([Head | Tail], ReverseList) :-
	reverse_varun(Tail, ReverseTail),
	concatenate(ReverseTail, [Head], ReverseList).
