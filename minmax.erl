-module(minmax).

-export([minmax/1]).

minmax([H | T]) ->
    minmax(T, H, H).

minmax([], Min, Max) ->
    {Min, Max};
minmax([H | T], Min, Max) ->
    Min1 =
        if H < Min ->
               H;
           true ->
               Min
        end,
    Max1 =
        if H > Max ->
               H;
           true ->
               Max
        end,

    minmax(T, Min1, Max1).
