-module (element_bs_col).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
	reflect/0,
	transform_element/1
]).

reflect() -> record_info(fields,bs_col).

transform_element(Rec = #bs_col{}) ->
	Panel = wf_utils:fast_copy_fields(Rec, #panel{}),
    ColClasses = make_col_classes(Rec#bs_col.cols),
    Panel#panel{class=[
        Rec#bs_col.class,
        ColClasses
    ]}.

make_col_classes(Cols) when is_list(Cols), not(?IS_STRING(Cols)) ->
    [make_col_class(C) || C <- Cols];
make_col_classes(Col) ->
    [make_col_class(Col)].

make_col_class(ColDef) when is_integer(ColDef) ->
    make_col_class({md, ColDef});
make_col_class(ColDef) when is_atom(ColDef); is_binary(ColDef); ?IS_STRING(ColDef) ->
    ColDef;
make_col_class(ColDef) when is_tuple(ColDef) ->
    List = tuple_to_list(ColDef),
    wf:to_binary(["col-" | wf:join(List,"-")]).

