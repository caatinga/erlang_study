-module(invert).

-export([invert/1]).

invert(List) ->
    invert(List, []).

invert([], Acc) ->
    Acc;
invert([H1 | T], Acc) ->
    invert(T, [H1 | Acc]).
