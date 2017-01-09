-module (element_bs_container).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
	reflect/0,
	transform_element/1
]).

reflect() -> record_info(fields,bs_container).

transform_element(Rec = #bs_container{}) ->
	Panel = wf_utils:copy_fields(Rec, #panel{}),
    Panel#panel{class=[Rec#bs_container.class, 'container']}.
