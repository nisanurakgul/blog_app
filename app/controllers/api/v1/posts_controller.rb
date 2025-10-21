module Api
  module V1
    class PostsController < ApplicationController
      protect_from_forgery with: :null_session

      def index
        posts = Post.all
        render json: posts
      end

      def show
        post = Post.find(params[:id])
        render json: post
      end

      def create
        post = Post.new(post_params)
        if post.save
          render json: post, status: :created
        else
          render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        post = Post.find(params[:id])
        if post.update(post_params)
          render json: post
        else
          render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        post = Post.find(params[:id])
        post.destroy
        head :no_content
      end

      private

      def post_params
        params.require(:post).permit(:title, :content, :user_id)
      end
    end
  end
end

