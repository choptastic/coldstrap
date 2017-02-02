-module (element_pass).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
	reflect/0,
	transform_element/1
]).

reflect() -> record_info(fields, pass).

transform_element(Rec = #pass{}) ->
	Password = wf_utils:fast_copy_fields(Rec, #password{}),
    Password#password{class=[Rec#pass.class, 'form-control']}.
