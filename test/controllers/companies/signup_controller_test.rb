# typed: false
# frozen_string_literal: true

require "test_helper"

class Companies::SignupControllerTest < ActionDispatch::IntegrationTest
  test "must be a login form" do
    get companies_signup_url
    assert_response :success

    assert_select "form[action=?]", companies_signup_path do
      assert_select "input[type=email][name=?]", "user[email_address]"
      assert_select "input[type=password][name=?]", "user[password]"
      assert_select "input[type=password][name=?]", "user[password_confirmation]"
      assert_select "input[type=submit]"
    end
  end

  test "successful signup" do
    visit companies_signup_url

    fill_in "user[email_address]", with: "teste@teste.com"
    fill_in "user[password]",	with: "A12345678@"
    fill_in "user[password_confirmation]",	with: "A12345678@"

    click_button "Cadastrar"

    assert_equal current_path, root_path
    # assert_text "Cadastro realizado com sucesso!"
  end

  test "email cannot be blank" do
    visit companies_signup_url

    fill_in "user[email_address]", with: ""
    fill_in "user[password]",	with: "A12345678@"
    fill_in "user[password_confirmation]",	with: "A12345678@"

    click_button "Cadastrar"

    assert_equal current_path, companies_signup_path
    assert_text "E-mail não pode ficar em branco"
  end

  test "password cannot be blank" do
    visit companies_signup_url

    fill_in "user[email_address]", with: "teste@teste.com"
    fill_in "user[password]",	with: ""
    fill_in "user[password_confirmation]",	with: ""

    click_button "Cadastrar"

    assert_equal current_path, companies_signup_path
    assert_text "Senha não pode ficar em branco"
    assert_text "Confirmar senha não pode ficar em branco"
  end

  test "password confirmation and password must be equal" do
    visit companies_signup_url

    fill_in "user[email_address]", with: "teste@teste.com"
    fill_in "user[password]",	with: "A12345678@"
    fill_in "user[password_confirmation]",	with: ""

    click_button "Cadastrar"

    assert_equal current_path, companies_signup_path
    assert_text "Confirmar senha não é igual a Senha"
  end

  test "password must be alphanumeric" do
    visit companies_signup_url

    fill_in "user[email_address]", with: "teste@teste.com"
    fill_in "user[password]",	with: "12345678"
    fill_in "user[password_confirmation]",	with: "12345678"

    click_button "Cadastrar"

    assert_equal current_path, companies_signup_path
    assert_text "Senha deve conter letras, números e caracteres especiais"
  end
end
