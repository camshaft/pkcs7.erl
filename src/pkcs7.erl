-module (pkcs7).

-export ([pad/1]).
-export ([unpad/1]).

pad(Bin) ->
  Diff = byte_size(Bin) rem 16,
  pad(Bin, 16-Diff).

pad(Bin, 1) ->
  <<Bin/binary,1>>;
pad(Bin, 2) ->
  <<Bin/binary,2,2>>;
pad(Bin, 3) ->
  <<Bin/binary,3,3,3>>;
pad(Bin, 4) ->
  <<Bin/binary,4,4,4,4>>;
pad(Bin, 5) ->
  <<Bin/binary,5,5,5,5,5>>;
pad(Bin, 6) ->
  <<Bin/binary,6,6,6,6,6,6>>;
pad(Bin, 7) ->
  <<Bin/binary,7,7,7,7,7,7,7>>;
pad(Bin, 8) ->
  <<Bin/binary,8,8,8,8,8,8,8,8>>;
pad(Bin, 9) ->
  <<Bin/binary,9,9,9,9,9,9,9,9,9>>;
pad(Bin, 10) ->
  <<Bin/binary,10,10,10,10,10,10,10,10,10,10>>;
pad(Bin, 11) ->
  <<Bin/binary,11,11,11,11,11,11,11,11,11,11,11>>;
pad(Bin, 12) ->
  <<Bin/binary,12,12,12,12,12,12,12,12,12,12,12,12>>;
pad(Bin, 13) ->
  <<Bin/binary,13,13,13,13,13,13,13,13,13,13,13,13,13>>;
pad(Bin, 14) ->
  <<Bin/binary,14,14,14,14,14,14,14,14,14,14,14,14,14,14>>;
pad(Bin, 15) ->
  <<Bin/binary,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15>>;
pad(Bin, 16) ->
  <<Bin/binary,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16>>.

unpad(<<>>) ->
  <<>>;
unpad(Bin) ->
  Last = binary:last(Bin),
  Size = byte_size(Bin) - Last,
  RemSize = Size rem 16,

  case Bin of
    <<Data:Size/binary,1>> when RemSize == 15 -> Data;
    <<Data:Size/binary,2,2>> when RemSize == 14 -> Data;
    <<Data:Size/binary,3,3,3>> when RemSize == 13 -> Data;
    <<Data:Size/binary,4,4,4,4>> when RemSize == 12 -> Data;
    <<Data:Size/binary,5,5,5,5,5>> when RemSize == 11 -> Data;
    <<Data:Size/binary,6,6,6,6,6,6>> when RemSize == 10 -> Data;
    <<Data:Size/binary,7,7,7,7,7,7,7>> when RemSize == 9 -> Data;
    <<Data:Size/binary,8,8,8,8,8,8,8,8>> when RemSize == 8 -> Data;
    <<Data:Size/binary,9,9,9,9,9,9,9,9,9>> when RemSize == 7 -> Data;
    <<Data:Size/binary,10,10,10,10,10,10,10,10,10,10>> when RemSize == 6 -> Data;
    <<Data:Size/binary,11,11,11,11,11,11,11,11,11,11,11>> when RemSize == 5 -> Data;
    <<Data:Size/binary,12,12,12,12,12,12,12,12,12,12,12,12>> when RemSize == 4 -> Data;
    <<Data:Size/binary,13,13,13,13,13,13,13,13,13,13,13,13,13>> when RemSize == 3 -> Data;
    <<Data:Size/binary,14,14,14,14,14,14,14,14,14,14,14,14,14,14>> when RemSize == 2 -> Data;
    <<Data:Size/binary,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15>> when RemSize == 1 -> Data;
    <<Data:Size/binary,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16>> when RemSize == 0 -> Data;
    _ -> erlang:error(bad_padding)
  end.
