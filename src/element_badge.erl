-module (element_badge).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
	reflect/0,
	transform_element/1
]).

reflect() -> record_info(fields, badge).

transform_element(Rec = #lbl{size=Size, type=Type}) ->
	Span = wf_utils:fast_copy_fields(Rec, #span{}),
    TypeClass = coldstrap_util:type_class(badge, Type),
    SizeClass = coldstrap_util:type_class(badge, Size),
    CurClass = Span#span.class,
    Span#span{
        class=[badge, CurClass, TypeClass, SizeClass]
    }.
