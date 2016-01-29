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
	type=default			:: default | primary | success | info | warning | danger
}).

-record(glyphicon, {?ELEMENT_BASE(element_glyphicon),
	icon=""					:: atom() | text()
}).
