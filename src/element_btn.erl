-module (element_btn).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
	reflect/0,
	transform_element/1
]).

reflect() -> record_info(fields, btn).

transform_element(Btn = #btn{glyphicon=Icon, type=Type, size=Size}) ->
	Button = wf_utils:copy_fields(Btn, #button{}),
	BtnTypeClass = coldstrap_util:type_class(btn, Type),
	SizeClass = coldstrap_util:type_class(btn, Size),
	CurrClass = Btn#button.class,
	GBody = glyph_body(Icon),
	Body = [GBody, Button#button.body],
	Button#button{
	 	body=Body,
		class=[btn, CurrClass,SizeClass,BtnTypeClass]
	}.
	
glyph_body(undefined) -> "";
glyph_body(Icon) -> #glyphicon{icon=Icon}.
	