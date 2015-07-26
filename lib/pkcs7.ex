defmodule PKCS7 do
  defdelegate pad(bin), to: :pkcs7
  defdelegate unpad(bin), to: :pkcs7
end