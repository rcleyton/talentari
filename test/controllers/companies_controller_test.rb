# typed: false
# frozen_string_literal: true

require "test_helper"

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should use company layout" do
    get companies_signup_path
    assert_template layout: "layouts/companies"
  end
end
