class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    Post.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Post supprimé.' }
      format.turbo_stream { render turbo_stream: turbo_stream.remove("post_#{params[:id]}") }
    end
  end
end
