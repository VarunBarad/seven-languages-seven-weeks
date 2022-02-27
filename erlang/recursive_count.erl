-module(recursive_count).
-export([count/1]).

count(10) -> io:fwrite("10");
count(N) ->
	io:fwrite("~w~n", [N]),
	count(N + 1).
