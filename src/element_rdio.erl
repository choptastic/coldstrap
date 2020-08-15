-module (element_rdio).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
	reflect/0,
	transform_element/1
]).

reflect() -> record_info(fields, rdio).

transform_element(R = #rdio{}) ->
	Radio = wf_utils:fast_copy_fields(R, #radio{}),

    [<<"<div class='form-check'>">>,
        Radio#radio{
            class=[R#rdio.class, 'form-check-input'],
            label_class=[R#rdio.label_class, 'form-check-label']
        },
    <<"</div>">>].
