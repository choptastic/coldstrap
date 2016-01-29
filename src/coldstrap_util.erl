-module(coldstrap_util).
-export([type_class/2]).

type_class(Prefix, Type0) ->
	<<(wf:to_binary(Prefix))/binary,"-",(wf:to_binary(Type0))/binary>>.
