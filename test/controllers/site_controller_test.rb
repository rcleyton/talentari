# typed: false
# frozen_string_literal: true

require "test_helper"

class SiteControllerTest < ActionDispatch::IntegrationTest
  test "should user site layout" do
    get root_path
    assert_template layout: "layouts/site"
  end
end
