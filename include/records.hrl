-type bs_size()	:: auto | xs | sm | md | lg | large | small | mini. %% large, small, and mini are for backwards compatibility with bootstrap 2
-type bs_type() :: default | primary | secondary | success | info | warning | danger | link | dark | light.

?WF_EXTEND(button, btn, element_btn, [
    {type, default, "bs_type()"},
    {size, undefined, "undefined | bs_size()"},
    {glyphicon, undefined, "atom() | text()"}
]).

?WF_EXTEND(textbox, txtbx, element_txtbx, [
    {type, text, "string() | atom()"}
]).

?WF_EXTEND(textarea, txtarea, element_txtarea, []).
?WF_EXTEND(password, pass, element_pass, []).
?WF_EXTEND(dropdown, dd, element_dd, []).
?WF_EXTEND(radio, rdio, element_rdio, []).

?WF_EXTEND(span, lbl, element_lbl, [
    {size, auto, "bs_size()"},
    {type, default, "bs_type()"}
]).

?WF_EXTEND(span, badge, element_badge, [
    {size, auto, "bs_size()"},
    {type, default, "bs_type()"}
]).

?WF_EXTEND(panel, bs_container, element_bs_container, [
    {fluid, false, "boolean()"}
]).

?WF_EXTEND(panel, bs_row, element_bs_row, []).
?WF_EXTEND(panel, bs_col, element_bs_col, [
    {cols, []},
    {offset, []}
]).

?WF_EXTEND(panel, card, element_card, [
    {image, undefined, "undefined | url()"},
    {title_text, "", "text()"},
    {title_body, "", "undefined | body()"},
    {subtitle_body, "", "body()"},
    {subtitle_text, "", "text()"},
    {header_body, "", "body()"},
    {header_text, "", "text()"},
    {header_tag, 'div', "atom()"},
    {links, [], "[#link{}] | body()"}
]).

?WF_EXTEND(table, tbl, element_tbl, [
    {wrapperid, undefined}
]).

-record(input_group, {?ELEMENT_BASE(element_input_group),
    body=[]                 :: body(),
    size                    :: undefined | bs_size()
}).

?WF_EXTEND(span, input_group_addon, element_input_group_addon, []).

-record(glyphicon, {?ELEMENT_BASE(element_glyphicon),
    icon=""                 :: atom() | text()
}).
