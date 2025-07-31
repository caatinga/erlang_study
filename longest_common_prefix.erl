-module(longest_common_prefix).

-export([longest_common_prefix/1]).

-spec longest_common_prefix(Strs :: [unicode:unicode_binary()]) ->
                               unicode:unicode_binary().
longest_common_prefix([H | R]) ->
    solve(R, binary_to_list(H)).

solve(_, "") ->
    io:format("ignorado~n"),
    <<"">>;
solve([], Acc) ->
    io:format("Acc: ~w~n", [Acc]),
    list_to_binary(Acc);
solve([H | R], Acc) ->
    {A, B} = foo(binary_to_list(H), Acc),
    N = lists:takewhile(fun({L1, L2}) -> L1 == L2 end, lists:zip(A, B)),
    solve(R, lists:sublist(Acc, length(N))).

foo(A, B) ->
    if length(A) > length(B) ->
           {B, lists:sublist(A, length(B))};
       true ->
           {A, lists:sublist(B, length(A))}
    end.
