-module(fibonacci).

-export([fibn/1, fib/1]).

fibn(0) ->
    0;
fibn(1) ->
    1;
fibn(N) ->
    fibn(N - 1) + fibn(N - 2).

fib(N) ->
    fib(N, 0, 1).

fib(0, Acc1, _Acc2) ->
    Acc1;
fib(1, _Acc1, Acc2) ->
    Acc2;
fib(N, Acc1, Acc2) ->
    fib(N - 1, Acc2, Acc1 + Acc2).
