defmodule Base64.NifBridge do
  use Rustler, otp_app: :base64, crate: "base64_nif"

  def add(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
end
