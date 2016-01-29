-module (element_glyphicon).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
	reflect/0,
	render_element/1
]).

reflect() -> record_info(fields, glyphicon).

render_element(Record = #glyphicon{}) ->
	Class = [
		glyphicon,
		coldstrap_util:type_class(<<"glyphicon">>, Record#glyphicon.icon), 
		Record#glyphicon.class
	],
	wf_tags:emit_tag(span, [], [
		{id, Record#glyphicon.html_id},
		{class, Class},
		{style, Record#glyphicon.style},
		{title, wf:html_encode(Record#glyphicon.title)},
		{data_fields, Record#glyphicon.data_fields}
	]).
