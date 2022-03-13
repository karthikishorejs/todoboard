class CommentsController < ApplicationController
  before_action :set_post, only: %i[create]
  before_action :authenticate_user!

  def create
    @comments = @post.comments.new(comment_params.merge(user_id: current_user.id))
    respond_to do |format| 
      if @comments.save
        format.html { redirect_to post_url(@post), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      end
    end
  end

  private 
    
  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:description)
  end
end
