class PersonController < ApplicationController
  def new
    @kind = Person.new
  end

private
  def current_user_info
    @user.person
  end
end
