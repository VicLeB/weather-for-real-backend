class CommentsController < ApplicationController
    skip_before_action :authorized, only: [:show]

    def create
        comment = Comment.create!(comment_params)
        render json: comment, status: :created
    end

    def show
        comment = Comment.find_by(id: params[:id])
        render json: comment, include: ['user']
    end

    def destroy
        comment = Comment.find_by(id: params[:id])
        comment.destroy
        head :no_content
    end

    private

    def comment_params
        params.permit(:content, :user_id, :post_id)
    end
end
