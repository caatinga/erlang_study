-module(valid_parentheses).

-export([is_valid/1]).

-define(pmap,
        #{$) => $(,
          $] => $[,
          $} => ${}).

-spec is_valid(S :: unicode:unicode_binary()) -> boolean().
is_valid(S) ->
    solve(S, []).

solve([], []) ->
    true;
solve([], _) ->
    false;
solve([_], []) ->
    false;
solve([$( | R], Stack) ->
    solve(R, [$( | Stack]);
solve([$[ | R], Stack) ->
    solve(R, [$[ | Stack]);
solve([${ | R], Stack) ->
    solve(R, [${ | Stack]);
solve([H | R], [HS | Stack]) ->
    InMap = maps:get(H, ?pmap),
    case InMap == HS of
        true ->
            solve(R, Stack);
        false ->
            false
    end.
