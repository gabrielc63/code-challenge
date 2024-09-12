class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  private

  def authorize_admin
    authorize :admin, :access?
  end
end
