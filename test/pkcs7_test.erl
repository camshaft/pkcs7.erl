-module (pkcs7_test).

-compile(export_all).

-include_lib("proper/include/proper.hrl").
-include_lib("eunit/include/eunit.hrl").

prop_padding()->
  ?FORALL(Bin, binary(),
    begin
      Padded = pkcs7:pad(Bin),
      byte_size(Padded) rem 16 =:= 0
    end).

prop_unpadding()->
  ?FORALL(Bin, binary(),
    begin
      Padded = pkcs7:pad(Bin),
      Bin =:= pkcs7:unpad(Padded)
    end).

proper_test_() ->
    [{atom_to_list(F),
      fun () -> ?assert(proper:quickcheck(?MODULE:F(), [long_result])) end}
     || {F, 0} <- ?MODULE:module_info(exports), F > 'prop_', F < 'prop`'].
