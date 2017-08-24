module Account
  class DashboardController < ApplicationController
    def show
      @user             = current_user
      @bookings_planned = @user.bookings.planned
      @bookings_passed  = @user.bookings.passed

      if current_user.admin == true
		time = Time.now.strftime("%d/%m/%Y %H:%M")
    d1 = Date.parse(time)
		d = (d1<<1).to_s
    d2 = (d1<<2).to_s
      	@activities_month = Activity.where(group_id: current_user.group_id).where("created_at>?", d).count
        @activities_previous = Activity.where(group_id: current_user.group_id).where("created_at>?", d2).where("created_at<?", d).count        

      	@bookings_month = Booking.where(id: current_user.group_id).where("created_at>?", d).count 
        @bookings_previous = Booking.where(id: current_user.group_id).where("created_at>?", d2).where("created_at<?", d).count

      	@comments_month = Newsfeed.where(id: current_user.group_id).where("created_at>?", d).count
        @comments_previous = Newsfeed.where(id: current_user.group_id).where("created_at>?", d2).where("created_at<?", d).count

      	@signin_month = User.where(group_id: current_user.group_id).where("current_sign_in_at>?", d).count
        @signin_previous = User.where(group_id: current_user.group_id).where("current_sign_in_at>?", d2).where("current_sign_in_at<?", d).count
      end
    end
  end
end
