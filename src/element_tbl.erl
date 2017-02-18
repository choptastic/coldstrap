-module (element_tbl).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
	reflect/0,
	transform_element/1
]).

reflect() -> record_info(fields, tbl).

transform_element(Rec = #tbl{}) ->
    Tbl = wf_utils:fast_copy_fields(Rec, #table{}),
    Wrapperid = Rec#tbl.wrapperid,
    #panel{id=Wrapperid, body=Tbl}.
