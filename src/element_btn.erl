-module (element_btn).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
	reflect/0,
	render_element/1
]).

reflect() -> record_info(fields, btn).

render_element(Btn = #btn{type=Type}) ->
	Button = wf_utils:copy_fields(Btn, #button{}),
	BtnTypeClass = coldstrap_util:type_class(btn, Type),
	CurrClass = Btn#button.class,
	Button#button{class=[CurrClass,btn,BtnTypeClass]}.
	
