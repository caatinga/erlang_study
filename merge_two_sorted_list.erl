-module(merge_two_sorted_list).

-export([merge_two_lists/2]).

-record(list_node, {val = 0 :: integer(), next = null :: null | #list_node{}}).

-spec merge_two_lists(List1 :: #list_node{} | null, List2 :: #list_node{} | null) ->
                         #list_node{} | null.
merge_two_lists(List1, List2) ->
    solve(List1, List2, null).

solve(L1, null, Acc) ->
    append(L1, Acc);
solve(null, L2, Acc) ->
    append(L2, Acc);
solve(L1 = #list_node{val = V1, next = N1},
      L2 = #list_node{val = V2, next = N2},
      Merge) ->
    case V1 =< V2 of
        true ->
            solve(N1, L2, append_node(#list_node{val = V1, next = null}, Merge));
        false ->
            solve(L1, N2, append_node(#list_node{val = V2, next = null}, Merge))
    end.

append_node(Node, null) ->
    Node;
append_node(Node, #list_node{val = V, next = Next}) ->
    #list_node{val = V, next = append_node(Node, Next)}.

append(null, Acc) ->
    Acc;
append(#list_node{val = Val, next = Next}, Acc) ->
    NewAcc = append_node(#list_node{val = Val, next = null}, Acc),
    append(Next, NewAcc).
