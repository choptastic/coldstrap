-module (element_txtarea).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
	reflect/0,
	transform_element/1
]).

reflect() -> record_info(fields, txtarea).

transform_element(Txt = #txtarea{}) ->
	Textarea = wf_utils:copy_fields(Txt, #textarea{}),
    Textarea#textarea{class=[Txt#txtarea.class, 'form-control']}.
