-module(factorial).

-export([factorial/1, f/1]).

factorial(0) ->
    1;
factorial(1) ->
    1;
factorial(N) ->
    N * factorial(N - 1).

f(N) ->
    f(N, 1).

f(0, Acc) ->
    Acc;
f(N, Acc) ->
    f(N - 1, N * Acc).
