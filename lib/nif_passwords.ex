defmodule NifPasswords do
  @moduledoc """
  Documentation for `NifPasswords`.
  """

  use Rustler,
    otp_app: :nif_passwords,
    crate: "nif_passwords",
    skip_compilation?: false

  defp err do
    throw(NifNotLoadedError)
  end

  @doc "Argon2: Generate a hash for some password"
  @spec generate_argon2(String.t()) :: String.t()
  def generate_argon2(_password), do: err()

  @doc "Argon2: Validate a password hash"
  @spec validate_argon2(String.t(), String.t()) :: Boolean
  def validate_argon2(_hash, _password), do: err()
end
