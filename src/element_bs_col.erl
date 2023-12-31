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
    OffsetClass = make_offset_class(Rec#bs_col.offset),
    Panel#panel{class=[
        Rec#bs_col.class,
        OffsetClass,
        ColClasses
    ]}.

make_col_classes(Cols) when is_list(Cols), not(?IS_STRING(Cols)) ->
    [make_col_class(C) || C <- Cols];
make_col_classes(Col) ->
    [make_col_class(Col)].

make_col_class(ColDef) when is_integer(ColDef) ->
    make_col_class({col, md, ColDef});
make_col_class(ColDef) when is_atom(ColDef); is_binary(ColDef); ?IS_STRING(ColDef) ->
    ColDef;
make_col_class(ColDef) when is_tuple(ColDef) ->
    List = [wf:to_list(X) || X <- tuple_to_list(ColDef)],
    wf:to_binary([wf:join(List,"-")]).


make_offset_class([]) ->
    [];
make_offset_class(Offset) when is_integer(Offset) ->
    make_col_class({offset, md, Offset});
make_offset_class(Offset) ->
    make_col_class(Offset).
