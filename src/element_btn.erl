-module (element_btn).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
	reflect/0,
	transform_element/1
]).

reflect() -> record_info(fields, btn).

transform_element(Btn = #btn{glyphicon=Icon, type=Type, size=Size}) ->
	BtnTypeClass = coldstrap_util:type_class(btn, Type),
	SizeClass = coldstrap_util:type_class(btn, Size),
	CurrClass = Btn#btn.class,
	Body = add_glyph_body(Icon, Btn#btn.body),
	Button = wf_utils:copy_fields(Btn, #button{}),
	Button#button{
	 	body=Body,
		class=[btn, CurrClass,SizeClass,BtnTypeClass]
	}.

add_glyph_body(undefined, Body) ->
	Body;
add_glyph_body(Icon, Body) -> 
	[glyph_body(Icon), Body].

glyph_body(Icon) -> #glyphicon{icon=Icon}.
	
