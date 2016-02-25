-type bs_size()	:: xs | sm | md | lg.
-type bs_type() :: default | primary | success | info | warning | danger | link.

-record(btn, {?ELEMENT_BASE(element_btn),
	text=""                 :: text(),
	body=""                 :: body(),
	image=undefined         :: undefined | url(),
	html_encode=true        :: html_encode(),
	next                    :: id(),
	click                   :: actions(),
	enter_clicks=[]         :: [id()],
	postback                :: term(),
	disabled=false          :: boolean(),
	handle_invalid=false    :: boolean(),
	on_invalid              :: undefined | actions(),
	delegate                :: module(),
	type=default			:: bs_type(),
	size=undefined			:: undefined | bs_size(),
	glyphicon=undefined		:: atom() | text()
}).

-record(txtbx, {?ELEMENT_BASE(element_txtbx),
    text=""                 :: text(),
    maxlength=""            :: integer() | string(),
    size=""                 :: integer() | string(),
    placeholder=""          :: text(),
    html_encode=true        :: html_encode(),
    disabled=false          :: boolean(),
    readonly=false          :: boolean(),
    next                    :: id(),
    postback                :: term(),
    handle_invalid=false    :: boolean(),
    on_invalid              :: undefined | actions(),
    delegate                :: module(),
    html_name               :: html_name(),
    type=text               :: string() | atom()
}).

-record(txtarea, {?ELEMENT_BASE(element_txtarea),
    text=""                 :: text(),
    placeholder=""          :: text(),
    disabled=false          :: boolean(),
    readonly=false          :: boolean(),
    trap_tabs=false         :: boolean(),
    next                    :: id(),
    columns                 :: undefined | integer(),
    rows                    :: undefined | integer(),
    html_encode=true        :: html_encode(),
    html_name               :: html_name()
}).

-record(glyphicon, {?ELEMENT_BASE(element_glyphicon),
	icon=""					:: atom() | text()
}).

-record(dd, {?ELEMENT_BASE(element_dd),
        options=[]              :: undefined | options(),
        size=auto               :: auto | integer(),
        html_encode=true        :: html_encode(),
        postback                :: term(),
        handle_invalid=false    :: boolean(),
        on_invalid              :: undefined | actions(),
        delegate                :: module(),
        value                   :: text(),
        next                    :: id(),
        multiple=false          :: boolean(),
        disabled=false          :: boolean(),
        html_name               :: html_name()
    }).

-record(lbl, {?ELEMENT_BASE(element_lbl),
        size=auto               :: bs_size(),
        type=default            :: bs_type(),
        text=""                 :: text(),
        body=""                 :: body()
    }).
