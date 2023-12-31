-module (element_card).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
	reflect/0,
	transform_element/1
]).

reflect() -> record_info(fields,card).

transform_element(Rec = #card{}) ->
	Panel = wf_utils:fast_copy_fields(Rec, #panel{}),
    %% image
    %% header
    %% title
    %% subtitle
    %% body
    %% text
    %% links = []
    #card{
        class=Class,
        image=Image,
        html_encode=HtmlEncode,
        title_text=TitleText,
        title_body=TitleBody,
        subtitle_text=SubtitleText,
        subtitle_body=SubtitleBody,
        text=Text,
        body=Body,
        header_text=HeaderText,
        header_body=HeaderBody,
        header_tag=HeaderTag,
        links=Links
    } = Rec,
    Panel#panel{class=[card, Class], text="", body=[
        maybe_image_tag(Image), 
        maybe_card_tag(HeaderTag, 'card-header', HtmlEncode, HeaderText, HeaderBody),
        #panel{class='card-body', body=[
            maybe_card_tag('h5', 'card-title', HtmlEncode, TitleText, TitleBody),
            maybe_card_tag('h6', ['card-subtitle', 'mb-2', 'text-muted'], HtmlEncode, SubtitleText, SubtitleBody),
            maybe_card_tag(p, ['card-text'], HtmlEncode, Text, Body),
            draw_links(Links)
        ]}
    ]}.
       
draw_links(undefined) ->
    [];
draw_links(Ls) when is_list(Ls) ->
    [draw_link(L) || L <- Ls];
draw_links(L = #link{}) ->
    draw_link(L);
draw_links(L) ->
    %% We don't know what to do with this, so let's just let it be
    L.

draw_link(L = #link{class=Class}) ->
    NewClass = [Class, 'card-link'],
    L#link{class=NewClass}.

maybe_card_tag(Tag0, Class, Encode, Text0, Body)
        when not(?WF_BLANK(Text0));
             not(?WF_BLANK(Body)) ->
    Tag = wf:coalesce([Tag0, 'div']),
    Text = wf:html_encode(Text0, Encode),
    wf_tags:emit_tag(Tag, [Text, Body], [
        {class, Class}
    ]);
maybe_card_tag(_, _, _, _, _) ->
    [].

maybe_image_tag(Image) when not(?WF_BLANK(Image)) ->
    wf_tags:emit_tag(img, [], [
        {class, 'card-img-top'},
        {src, Image}
    ]);
maybe_image_tag(_) ->
    [].
                              
