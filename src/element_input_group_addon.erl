-module(element_input_group_addon).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
    reflect/0,
    transform_element/1
]).

reflect() -> record_info(fields, input_group_addon).

transform_element(Rec = #input_group_addon{}) ->
    Span = wf_utils:fast_copy_fields(Rec, #span{}),
    CurClass = Span#span.class,
    Span#span{
        class=['input-group-addon', CurClass]
    }.
