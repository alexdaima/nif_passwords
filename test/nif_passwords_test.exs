defmodule NifPasswordsTest do
  use ExUnit.Case
  doctest NifPasswords

  test "Can create and validate a (correct) password hash" do
    password = "some_password"
    hash = NifPasswords.generate_argon2(password)
    is_valid = NifPasswords.validate_argon2(hash, password)
    assert is_valid == true
  end

  test "Can create and validate a (incorrect) password hash" do
    password = "some_password"
    hash = NifPasswords.generate_argon2(password)
    is_valid = NifPasswords.validate_argon2(hash, "some_other_password")
    assert is_valid == false
  end
end
