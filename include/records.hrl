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

-record(glyphicon, {?ELEMENT_BASE(element_glyphicon),
    icon=""                 :: atom() | text()
}).


-record(lbl, {?ELEMENT_BASE(element_lbl),
    size=auto               :: bs_size(),
    type=default            :: bs_type(),
    text=""                 :: text(),
    body=""                 :: body()
    }).

-record(bs_container, {?ELEMENT_BASE(element_bs_container),
        body=[]                 :: body(),
        text=""                 :: text(),
        html_encode=true        :: html_encode()
    }).

-record(bs_row, {?ELEMENT_BASE(element_bs_row),
        body=[]                 :: body(),
        text=""                 :: text(),
        html_encode=true        :: html_encode()
    }).

-record(bs_col, {?ELEMENT_BASE(element_bs_col),
        body=[]                 :: body(),
        text=""                 :: text(),
        html_encode=true        :: html_encode(),
        cols=[]                 :: [atom() | binary() | tuple()]
    }).
