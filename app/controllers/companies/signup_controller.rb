# typed: false
# frozen_string_literal: true

class Companies::SignupController < CompaniesController
  include UserRegistrable

  def new
    new_user
  end

  def create
    create_user
  end
end
