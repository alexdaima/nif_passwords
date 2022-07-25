use rustler::{NifResult};
use rand::{thread_rng, Rng};
use rand::distributions::Alphanumeric;
use argon2::{self, Config};

rustler::init!(
    "Elixir.NifPasswords",
    [
        generate_argon2,
        validate_argon2
    ],
    load = load
);

fn load(_env: rustler::Env, _: rustler::Term) -> bool {
    true
}

#[rustler::nif(name = "generate_argon2")]
fn generate_argon2(password: String) -> NifResult<String> {
    let argon2_config = Config::default();
    let salt: String = thread_rng()
        .sample_iter(&Alphanumeric)
        .take(30)
        .collect();
    let hash = argon2::hash_encoded(
        password.as_bytes(),
        salt.as_bytes(),
        &argon2_config
    ).unwrap();
    return Ok(hash)
}

#[rustler::nif(name = "validate_argon2")]
fn validate_argon2(hash: String, password: String) -> NifResult<bool> {
    let is_valid = argon2::verify_encoded(&hash, password.as_bytes()).unwrap();
    return Ok(is_valid);
}