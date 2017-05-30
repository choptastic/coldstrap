-module (element_input_group).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
	reflect/0,
	render_element/1
]).

reflect() -> record_info(fields, input_group).



render_element(Record = #input_group{size=Size}) ->
	Class = [
		'input-group',
		coldstrap_util:type_class(<<"input-group">>, Size), 
		Record#input_group.class
	],
	wf_tags:emit_tag('div', Record#input_group.body, [
		{id, Record#input_group.html_id},
		{class, Class},
		{style, Record#input_group.style},
		{title, wf:html_encode(Record#input_group.title)},
		{data_fields, Record#input_group.data_fields}
	]).
