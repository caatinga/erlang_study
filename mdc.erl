-module(mdc).

-export([mdc_bad/2, mdc/2]).

mdc_bad(A, 0) ->
    A;
mdc_bad(A, B) ->
    mdc_bad(B, A rem B).

mdc(A, B) ->
    mdc(A, B, A).

mdc(_, 0, Result) ->
    Result;
mdc(A, B, _) ->
    mdc(B, A rem B, B).
