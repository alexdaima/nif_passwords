# nif_passwords

An Elixir/Rust NIF for password cryptography

Available algorithms:

- [Argon2](https://en.wikipedia.org/wiki/Argon2)

## Installation

⚠️ You must have the Rust toolchain installed in order to compile.

```elixir
defp deps do
  [{:nif_passwords, git: "https://github.com/asciialex/nif_passwords.git", tag: "0.1.0"}]
end
```

## Usage

Generate a password and then validate it

```elixir
# Create a password
password = "some_password"

# Generate a password hash
password_hash = NifPasswords.generate_argon2(password)
"$argon2i$v=19$m=4096,t=3,p=1$cFJybTBHQVpLOHY3bjBWcGRHdVZva1VZUm1VZkVS$9uOQUbRvJ+bFKZH1VQ/i7uYXgycAnLu+P2AtUyZuqrY"

# Validate the password hash
NifPasswords.validate_argon2(password_hash, password)
true

NifPasswords.validate_argon2(password_hash, "some_other_password")
false
```