class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :show]

    def create
        user = User.create(user_params)

        if user.valid?
            render json: {user: UserSerializer.new(user)}, status: :created
        else
            render json: {error: "Failed to create user"}, status: :not_acceptable
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        render json: {user: @user}, include: ['posts']
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :home_location_code)
    end
end
