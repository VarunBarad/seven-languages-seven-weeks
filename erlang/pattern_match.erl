-module(pattern_match).
-export([print_message/1]).

print_message(success) -> io:fwrite("success");
print_message({error, Message}) -> io:fwrite("error: ~p~n", [Message]).
