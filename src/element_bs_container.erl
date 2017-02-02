-module (element_bs_container).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
	reflect/0,
	transform_element/1
]).

reflect() -> record_info(fields,bs_container).

transform_element(Rec = #bs_container{fluid=Fluid}) ->
    Class = ?WF_IF(Fluid, 'container-fluid', 'container'),
	Panel = wf_utils:fast_copy_fields(Rec, #panel{}),
    Panel#panel{class=[Rec#bs_container.class, Class]}.
