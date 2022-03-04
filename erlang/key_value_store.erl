-module(key_value_store).
-export([retrieve/2]).

retrieve(List, Keyword) -> [ Answer | _ ] = [ Value || { Key, Value } <- List, Key == Keyword ],
	Answer.
