-module (element_txtbx).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
	reflect/0,
	transform_element/1
]).

reflect() -> record_info(fields, txtbx).

transform_element(Txt = #txtbx{}) ->
	Textbox = wf_utils:fast_copy_fields(Txt, #textbox{}),
    Textbox#textbox{class=[Txt#txtbx.class, 'form-control']}.
