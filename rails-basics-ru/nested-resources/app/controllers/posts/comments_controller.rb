# frozen_string_literal: true

# post module
module Posts
  # comments controller
  class CommentsController < ApplicationController
    before_action :set_comment, only: %i[show edit update destroy]

    def edit; end

    def create
      @post = Post.find(params[:post_id])
      @comment = @post.post_comments.build(comment_params)

      if @comment.save
        redirect_to post_path(@post), notice: 'Comment was successfully created.'
      else
        redirect_to post_path(@comment.post)
      end
    end

    def update
      if @comment.update(comment_params)
        redirect_to post_path(@comment.post), notice: 'Comment was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @comment.destroy
      redirect_to post_path(@comment.post), notice: 'Comment was successfully deleted'
    end

    private

    def set_comment
      @comment = PostComment.find(params[:id])
    end

    def comment_params
      params.require(:post_comment).permit(:body)
    end
  end
end
