# typed: false
# frozen_string_literal: true

class Companies::SignupController < CompaniesController
  allow_unauthenticated_access only: [ :new, :create ]

  include UserRegistrable

  def new
    new_user
  end

  def create
    create_user
  end
end
