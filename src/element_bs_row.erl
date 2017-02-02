-module (element_bs_row).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
	reflect/0,
	transform_element/1
]).

reflect() -> record_info(fields,bs_row).

transform_element(Rec = #bs_row{}) ->
	Panel = wf_utils:fast_copy_fields(Rec, #panel{}),
    Panel#panel{class=[Rec#bs_row.class, 'row']}.
