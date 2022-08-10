defmodule Base64 do
  @moduledoc """
  Provides functions to encode and decode base64.

  All functions can specify an optional second argument to determine the character set to be used while encoding and to be expected while decoding.
  The possible alphabets are:
  - `:standard`: the default as specced in [RFC3548](https://www.rfc-editor.org/rfc/rfc3548#section-3).
  - `:url_safe`: URL-safe character set with padding (uses `-` and `_`).
  - `:crypt`: as per crypt(3) requirements, (uses `.` and `/` as the first two values).
  - `:bcrypt`: the bcrypt alphabet.
  - `:bin_hex`: the alphabet used in BinHex 4.0 files.
  - `:imap_map7`: as per IMAP modified UTF-7 requirements (uses `+` and `,`).
  """

  use Rustler, otp_app: :base64, crate: "base64_nif"

  @doc """
  Decodes a valid base64 string.

  ## Example

      iex> Base64.decode("aGVsbG8gd29ybGQ=")
      "hello world"

      iex> Base64.decode("aGVsbG8gd29ybGQ", :standard, false)
      "hello world"

  """
  @spec decode(binary, atom, atom) :: binary
  def decode(_b64, _alphabet \\ :standard, _should_pad \\ true), do: error()

  @doc """
  Encodes a string to base64.

  ## Example

      iex> Base64.encode("hello world")
      "aGVsbG8gd29ybGQ="

      iex> Base64.encode("hello world", :standard, false)
      "aGVsbG8gd29ybGQ"
  """
  @spec encode(binary, atom, atom) :: binary
  def encode(_s, _alphabet \\ :standard, _is_padded \\ true), do: error()

  defp error(), do: :erlang.nif_error(:nif_not_loaded)
end
