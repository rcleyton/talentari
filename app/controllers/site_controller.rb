# typed: false
# frozen_string_literal: true

class SiteController < ApplicationController
  allow_unauthenticated_access only: [ :index ]

  layout "site"
end
