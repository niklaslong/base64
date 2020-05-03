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
fn decode(s: String) -> String {
    let bytes = base64::decode(s).unwrap();
    String::from_utf8(bytes).unwrap()
}

#[rustler::nif]
fn decode_config(b64: String, opt: Atom) -> String {
    let config: base64::Config = match_config(opt);
    let bytes = base64::decode_config(b64, config).unwrap();

    String::from_utf8(bytes).unwrap()
}

#[rustler::nif]
fn encode(s: String) -> String {
    let b64 = base64::encode(s.as_bytes());
    b64
}

#[rustler::nif]
fn encode_config(s: String, opt: Atom) -> String {
    let config: base64::Config = match_config(opt);
    let b64 = base64::encode_config(s.as_bytes(), config);

    b64
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

rustler::init!(
    "Elixir.Base64.NifBridge",
    [decode, decode_config, encode, encode_config]
);
