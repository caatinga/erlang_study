-module(minoperations).

-export([min_operations/2]).

-spec min_operations(Nums :: [integer()], K :: integer()) -> integer().
min_operations(Nums, K) ->
    solve(lists:sort(Nums), K, 0).

solve(Nums, K, S) ->
    case lists:all(fun(C) -> C >= K end, Nums) of
        true ->
            S;
        false ->
            {A, B, R} = two_smallest(Nums),
            L = insert_on(R, A, B),
            io:format("S = ~w~n~nNums = ~w~nR= ~w~nL~w~n", [S, Nums, R, L]),
            solve(L, K, S + 1)
    end.

two_smallest(N) ->
    {[A, B], R} = lists:split(2, N),
    {A, B, R}.

insert_on(Nums, A, B) ->
    N = min(A, B) * 2 + max(A, B),
    insert_sorted(N, Nums).

insert_sorted(E, []) ->
    [E];
insert_sorted(E, [H | R]) when E =< H ->
    [E, H | R];
insert_sorted(E, [H | R]) ->
    [H | insert_sorted(E, R)].
