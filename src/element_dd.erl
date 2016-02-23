-module (element_dd).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
	reflect/0,
	transform_element/1
]).

reflect() -> record_info(fields, dd).

transform_element(Rec = #dd{}) ->
	Dropdown = wf_utils:copy_fields(Rec, #dropdown{}),
    Dropdown#dropdown{class=[Rec#dd.class, 'form-control']}.
