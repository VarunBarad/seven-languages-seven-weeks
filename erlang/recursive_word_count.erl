-module(recursive_word_count).
-export([words/1]).

words(Anything) -> word_count(Anything, 0).

word_count([32, Tail], NumWords) -> word_count(Tail, NumWords);
word_count([Letter | Tail], NumWords) -> 1 + word_count_hidden(Tail, NumWords);
word_count([], NumWords) -> NumWords.

word_count_hidden([32 | Tail], NumWords) -> word_count(Tail, NumWords);
word_count_hidden([Letter | Tail], NumWords) -> word_count_hidden(Tail, NumWords);
word_count_hidden([], NumWords) -> NumWords.
