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

-record(glyphicon, {?ELEMENT_BASE(element_glyphicon),
	icon=""					:: atom() | text()
}).
