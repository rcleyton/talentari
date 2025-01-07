# typed: false
# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :email,    presence: true, uniqueness: true, email: { message: "deve ter um formato válido" }
  validates :password, presence: true, length: { minimum: 8 }, password: true
  validates :password_confirmation, presence: true
  validates :role, presence: true, inclusion: { in: -> { User.roles.keys } }

  enum :role, { admin: 0, company: 1, applicant: 2 }

  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :applicant
  end
end
