defmodule Base64 do
  @moduledoc """
  Provides functions to encode and decode base64.

  All functions can specify an optional second argument to determine the character set to be used while encoding and to be expected while decoding.
  The possible options are:
  - `:standard`: this is the default if no second argument is specified, standard character set with padding.
  - `:standard_no_pad`: standard character set without padding.
  - `:url_safe`: URL-safe character set with padding. 
  - `:url_safe_no_pad`: URL-safe character set without padding.
  - `:crypt`: as per crypt(3) requirements.
  - `:imap_map7`: as per IMAP modified UTF-7 requirements.
  """

  use Rustler, otp_app: :base64, crate: "base64_nif"

  @doc """
  Decodes a valid base64 string. 

  ## Example

      iex> Base64.decode("aGVsbG8gd29ybGQ=")
      "hello world"
      
      iex> Base64.decode("aGVsbG8gd29ybGQ", :standard_no_pad)
      "hello world"

  """
  @spec decode(binary, atom) :: binary
  def decode(_b64, _opt \\ :standard), do: error()

  @doc """
  Encodes a string to base64.

  ## Example

      iex> Base64.encode("hello world")
      "aGVsbG8gd29ybGQ="

      iex> Base64.encode("hello world", :standard_no_pad)
      "aGVsbG8gd29ybGQ"
  """
  @spec encode(binary, atom) :: binary
  def encode(_s, _opt \\ :standard), do: error()

  defp error(), do: :erlang.nif_error(:nif_not_loaded)
end
