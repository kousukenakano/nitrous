class HomeController < ApplicationController
  def index
  end
before_action :authenticate_member!
member_signed_in?
current_member
member_session
end
