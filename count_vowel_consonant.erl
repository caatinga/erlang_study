-module(count_vowel_consonant).

-export([count/1]).

count(S) ->
    count(S, 0, 0).

count([], V, C) ->
    {V, C};
count([H | T], V, C) ->
    case lists:member(H, "aeiouAEIOU") of
        true ->
            count(T, V + 1, C);
        false ->
            if H >= $a andalso H =< $z orelse H >= $A andalso H =< $Z ->
                   count(T, V, C + 1);
               true ->
                   count(T, V, C)
            end
    end.
