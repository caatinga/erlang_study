%% M=1000 CM=900 XC=90 IV=4

-module(roman_to_integer).

-export([roman_to_integer/1]).

-define(rti,
        #{"I" => 1,
          "V" => 5,
          "X" => 10,
          "L" => 50,
          "C" => 100,
          "D" => 500,
          "M" => 1000}).

roman_to_integer(S) ->
    solve(S, 0).

solve([], Acc) ->
    Acc;
solve([A], Acc) ->
    solve([], Acc + maps:get([A], ?rti));
solve([A, B | R], Acc) ->
    case foo(A, B) of
        true ->
            solve(R, Acc + (maps:get([B], ?rti) - maps:get([A], ?rti)));
        false ->
            solve([B] ++ R, Acc + maps:get([A], ?rti))
    end.

foo(A, B) ->
    case [A] of
        "I" ->
            lists:member(B, "VX");
        "X" ->
            lists:member(B, "LC");
        "C" ->
            lists:member(B, "DM");
        _ ->
            false
    end.
