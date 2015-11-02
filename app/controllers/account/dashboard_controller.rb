module Account
  class DashboardController < ApplicationController
    def show
      @user             = current_user
      @bookings_planned = @user.bookings.planned
      @bookings_passed  = @user.bookings.passed
    end
  end
end
