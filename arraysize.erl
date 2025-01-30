-module(arraysize).

-export([size/1]).

size(L) ->
    size(L, 0).

size([], T) ->
    T;
size([_ | Tail], T) ->
    size(Tail, T + 1).
