-module (element_lbl).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
	reflect/0,
	transform_element/1
]).

reflect() -> record_info(fields, lbl).

transform_element(Rec = #lbl{size=Size, type=Type}) ->
	Span = wf_utils:copy_fields(Rec, #span{}),
    TypeClass = coldstrap_util:type_class(label, Type),
    SizeClass = coldstrap_util:type_class(label, Size),
    CurClass = Span#span.class,
    Span#span{
        class=[label, CurClass, TypeClass, SizeClass]
    }.
