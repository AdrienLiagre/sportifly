module Account
  class DashboardController < ApplicationController
    def show
      @user             = current_user
      @bookings_planned = @user.bookings.planned
      @bookings_passed  = @user.bookings.passed

      if current_user.admin == true
		time = Time.now.strftime("%d/%m/%Y %H:%M")
		d = Date.parse(time)
		d = (d<<1).to_s
      	@activities_month = Activity.where(id: current_user.group_id).where("created_at>?", d).count
      	@bookings_month = Booking.where(id: current_user.group_id).where("created_at>?", d).count      	
      	@comments_month = Newsfeed.where(id: current_user.group_id).where("created_at>?", d).count
      	@signin_month = User.where(id: current_user.group_id).where("current_sign_in_at>?", d).count
      end
    end
  end
end
