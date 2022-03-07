-module(translate).
-export([loop/0]).

loop() ->
	receive
		"casa" ->
			io:format("house~n"),
			loop();
		"blanca" ->
			io:format("white~n"),
			loop();
		"fallecer" ->
			io:format("die~n"),
			exit({"The translator went caput."});
		_ ->
			io:format("I don't understand~n"),
			loop()
end.
