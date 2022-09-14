class PostsController < ApplicationController
    skip_before_action :authorized, only: [:index, :filtered_by_location]

    def index
        posts = Post.all.order(created_at: :desc)
        render json: posts
    end

    def create
        post = Post.create!(post_params)
        render json: post, status: :created
    end

    def update
        post = Post.find_by(id: params[:id])
        post.update!(post_params)
        render json: post, status: :accepted
    end

    def filtered_by_location
        posts = []
        Post.find_each do |post|
            if (post[:location].upcase.include?(params[:locationData].upcase))
                posts.push(post)
            end
        end
        render json: posts
    end


    def destroy
        post = Post.find_by(id: params[:id])
        post.destroy
        head :no_content
    end

    private
    def post_params
        params.permit(:title, :caption, :image, :location, :user_id, :date)
    end

end
