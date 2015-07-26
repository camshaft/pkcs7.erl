defmodule PKCS7.Test do
  use ExUnit.Case, async: false
  use ExCheck

  property :padding do
    for_all bin in binary() do
      padded = PKCS7.pad(bin)
      rem(byte_size(padded), 16) == 0
    end
  end

  property :unpadding do
    for_all bin in binary() do
      padded = PKCS7.pad(bin)
      bin == PKCS7.unpad(padded)
    end
  end
end