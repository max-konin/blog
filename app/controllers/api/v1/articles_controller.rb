module Api
  module V1
    class ArticlesController < ApplicationController
      respond_to :json
      before_action :set_article, only: [:show, :destroy, :update]

      def index
        @articles = Article.all
        respond_with @articles
      end

      def show
        respond_with @article
      end

      def create
        @article = Article.new article_params
        if @article.save
          respond_with @article, status: :created, location: false
        else
          respond_with @article, status: 422, location: false
        end
      end

      def update
        if @article.update article_params
          render json: @article
        else
          respond_with @article, status: 422, location: false
        end
      end

      def destroy
        @article.destroy
        head :ok
      end

      private
      def set_article
        @article = Article.find params[:id]
      end

      def article_params
        params.require(:article).permit :title, :text
      end
    end
  end
end
