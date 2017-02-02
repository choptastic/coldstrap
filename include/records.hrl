-type bs_size()	:: xs | sm | md | lg.
-type bs_type() :: default | primary | success | info | warning | danger | link.

?WF_EXTEND(button, btn, element_btn, [
    {type, default}, %% bs_type()
    size,           %% undefined | bs_size()
    glyphicon       %% atom() | text()
]).

?WF_EXTEND(textbox, txtbx, element_txtbx, [
    {type, text} %% string() | atom()
]).

?WF_EXTEND(textarea, txtarea, element_txtarea, []).
?WF_EXTEND(password, pass, element_pass, []).
?WF_EXTEND(dropdown, dd, element_dd, []).

?WF_EXTEND(span, lbl, element_lbl, [
    {size, auto, "bs_size()"},
    {type, default, "bs_type()"}
]).

?WF_EXTEND(panel, bs_container, element_bs_container, []).
?WF_EXTEND(panel, bs_row, element_bs_row, []).
?WF_EXTEND(panel, bs_col, element_bs_col, [
    {cols, []}
]).


-record(glyphicon, {?ELEMENT_BASE(element_glyphicon),
    icon=""                 :: atom() | text()
}).
