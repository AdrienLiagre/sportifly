module Account
  class UsersController < ApplicationController


    def show
      @user = current_user
    end

    def edit
      @user = current_user
    end

    def update
      @user = current_user
      # authorize @user
      @user.update(user_params)
      redirect_to account_dashboard_path
    end



    private

    def user_params
      params.require(:user).permit(:name, :picture, :age, :crew, :phone_number)
    end
  end
end
