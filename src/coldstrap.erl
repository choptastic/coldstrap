-module(coldstrap).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
    modal/1,
    modal/2,
    modal/3,
    modal/4,
    confirm/1,
    confirm/2,
    confirm/3,
    confirm/4,
    close_modal/0,
    format_close_button/1
]).

confirm(Body) ->
    confirm(Body, "OK").

confirm(Body, CloseText) ->
    confirm(Body, [], CloseText).

confirm(Body, Buttons, CloseText) ->
    confirm("", Body, Buttons, CloseText).

confirm(Title, Body, Buttons, CloseText) ->
    Footer = [
        format_buttons(Buttons), 
        format_close_button(CloseText)
    ],
    modal(Title, Body, Footer, []).

format_buttons(Buttons) ->
    [format_button(B) || B <- Buttons].

format_button({Label, Postback}) ->
    #btn{type=primary, text=Label, postback=Postback};
format_button({Label, Delegate, Postback}) ->
    #btn{type=primary, text=Label, delegate=Delegate, postback=Postback};
format_button(Btn) ->
    Btn.

format_close_button(undefined) -> "";
format_close_button(<<>>) -> "";
format_close_button("") -> "";
format_close_button(Label) ->
    #btn{type=default, text=Label, data_fields=[{dismiss, modal}]}.

close_modal() ->
    wf:wire("$('#coldstrap_modal').modal('hide')").

modal(Body) ->
    modal("", Body).

modal(Title, Body) ->
    modal(Title, Body, "").

modal(Title, Body, Footer) ->
    modal(Title, Body, Footer, []).

modal(Title, Body, Footer, Options) ->
    Modalid = "coldstrap_modal",
    %Modalid = wf:to_binary(wf:temp_id()),
    ModalBody = modal_body(Modalid, Title, Body, Footer, Options),
    wf:insert_bottom("body", ModalBody),
    JsonOpt = wf:json_encode(Options),
    Sel = ["'#",Modalid,"'"],
    wf:wire(["$(",Sel,").modal(",JsonOpt,").on('hidden.bs.modal', function(e) { $(",Sel,").remove() })"]).

modal_body(Modalid, Title0, Body0, Footer0, Options) ->
    HasXButton = proplists:get_value(has_x_button, Options, false),
    XButton = format_x_button(HasXButton),
    Title = modal_header(Title0),
    Footer = modal_footer(Footer0),
    [<<
        "<div class='modal fade' id=">>,Modalid,<<" role=dialog>
            <div class='modal-dialog' role='document'>
                <div class=modal-content>">>,
                    XButton,
                    Title,
                    <<"<div class=modal-body>">>,
                        Body0,
                    <<"</div>">>,
                    Footer,<<"
                </div>
            </div>
        </div>">>
    ].

format_x_button(false) ->
    "";
format_x_button(true) ->
    #button{class=close, body="&times;", data_fields=[{dismiss, modal}]}.


modal_header("") -> "";
modal_header(undefined) -> "";
modal_header(<<>>) -> "";
modal_header(Title) ->
    [<<"<div class=modal-header>
        <h4 class=modal-title>">>,Title,<<"</h4>
    </div>">>].


modal_footer("") -> "";
modal_footer(<<>>) -> "";
modal_footer(undefined) -> "";
modal_footer(Footer) ->
    [<<"<div class=modal-footer>">>,
        Footer,
    <<"</div>">>].
