class PostsController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def index
        posts = Post.all
        render json: posts
    end

    def create
        post = Post.create!(post_params)
        render json: post, status: :created
    end

    # def destroy
    #     post = Post.find_by(id: params[:id])
    #     post.destroy
    #     head :no_content
    # end

    private
    def post_params
        params.permit(:title, :caption, :image, :location, :user_id, :date)
    end

end
