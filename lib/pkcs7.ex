defmodule PKCS7 do
  defmodule BadPaddingError do
    defexception [:message]
  end

  defdelegate pad(bin), to: :pkcs7

  def unpad(bin) do
    :pkcs7.unpad(bin)
  rescue
    _err in ErlangError ->
      raise BadPaddingError, message: bin
  end
end