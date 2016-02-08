-type bs_size()	:: xs | sm | md | lg.

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
	type=default			:: default | primary | success | info | warning | danger | link,
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

-record(glyphicon, {?ELEMENT_BASE(element_glyphicon),
	icon=""					:: atom() | text()
}).
