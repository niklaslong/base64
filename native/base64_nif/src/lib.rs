use base64;
use rustler::Atom;

mod atoms {
    rustler::atoms! {
      crypt,
      imap_map7,
      standard,
      standard_no_pad,
      url_safe,
      url_safe_no_pad,
    }
}

#[rustler::nif]
pub fn decode(b64: String, opt: Atom) -> String {
    let config: base64::Config = match_config(opt);
    let bytes = base64::decode_config(b64, config).expect("decode failed: invalid b64");

    String::from_utf8(bytes).unwrap()
}

#[rustler::nif]
pub fn encode(s: String, opt: Atom) -> String {
    let config: base64::Config = match_config(opt);
    base64::encode_config(s.as_bytes(), config)
}

fn match_config(option: Atom) -> base64::Config {
    if option == atoms::crypt() {
        base64::CRYPT
    } else if option == atoms::imap_map7() {
        base64::IMAP_MUTF7
    } else if option == atoms::url_safe() {
        base64::URL_SAFE
    } else if option == atoms::url_safe_no_pad() {
        base64::URL_SAFE_NO_PAD
    } else if option == atoms::standard_no_pad() {
        base64::STANDARD_NO_PAD
    } else {
        base64::STANDARD
    }
}

rustler::init!("Elixir.Base64", [decode, encode]);
