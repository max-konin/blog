module Api
  module V1
    class CommentsController < ApplicationController
      respond_to :json
      before_action :set_comment, only: [:show, :destroy, :update]

      def index
        @comments = Comment.all
        respond_with @comments
      end

      def show
        respond_with @comment
      end

      def create
        @comment = Comment.new comment_params
        if @comment.save
          respond_with @comment, status: :created, location: false
        else
          respond_with @comment, status: 422, location: false
        end
      end

      def update
        if @comment.update comment_params
          render json: @comment
        else
          respond_with @comment, status: 422, location: false
        end
      end

      def destroy
        @comment.destroy
        head :ok
      end

      private
      def set_comment
        @comment = Comment.find params[:id]
      end

      def comment_params
        params.require(:comment).permit :text, :article_id
      end
    end
  end
end
