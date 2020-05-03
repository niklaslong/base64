defmodule Base64.NifBridge do
  use Rustler, otp_app: :base64, crate: "base64_nif"

end
