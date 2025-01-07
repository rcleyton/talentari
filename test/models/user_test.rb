# typed: false
# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @company = users(:one)
  end

  test "email cannot be blank" do
    @company.email = ""
    assert_not @company.valid?
    assert_includes @company.errors[:email], "não pode ficar em branco"
  end

  test "email must be valid" do
    @company.email = "foo@bar"
    assert_not @company.valid?
    assert_includes @company.errors[:email], "deve ter um formato válido"
  end

  test "email must be unique" do
    new_user = User.create(email: "company1@talentari.com.br", password: "Password@1", password_confirmation: "Password@1", role: 1)
    assert_not new_user.valid?
    assert_includes new_user.errors[:email], "já está em uso"
  end

  test "password must contain letters, numbers, and special characters" do
    @company.password = "Password1"
    @company.password_confirmation = "Password1"
    assert_not @company.valid?
    assert_includes @company.errors[:password], "deve conter letras, números e caracteres especiais"
  end

  test "password cannot contain spaces" do
    @company.password = "Password 1"
    @company.password_confirmation = "Password 1"
    assert_not @company.valid?
    assert_includes @company.errors[:password], "não pode conter espaços"
  end

  test "password confirmation must match password" do
    @company.password = "Diferent!"
    @company.password_confirmation = "Different1!"
    assert_not @company.valid?
    assert_includes @company.errors[:password_confirmation], "não é igual a Senha"
  end

  test "role must be present" do
    @company.role = " "
    assert_not @company.valid?
    assert_includes @company.errors[:role], "não pode ficar em branco"
  end

  test "role must be present and valid" do
    assert_raises ArgumentError do
      @company.role = 100
    end
  end

  test "company should have role company" do
    assert_equal "company", @company.role
  end
end
