class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.create(user_params)

        if user.valid?
            render json: {user: UserSerializer.new(user)}, status: :created
        else
            render json: {error: user.errors}, status: :unprocessable_entity
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        render json: {user: @user}, include: ['posts']

        if @user.valid?
            render json:{user: 'Welcome back'}
        else
            render json: {error: ['Invalid Username or Password']}, status: :unauthorized
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :home_location_code)
    end
end
