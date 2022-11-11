class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  # Create post
  def create_post
    # new object from params
    @post = Post.create(post_params)
    @first_user = current_user
    @post.author_id = @first_user.id

    # respond_to block
    respond_to do |f|
      f.html do
        if @post.save
          flash[:success] = 'Post created successfully!'
          redirect_to "/users/#{@first_user.id}/posts/"
        else
          flash.now[:error] = 'Error creating post!'
          render :new
        end
      end
    end
  end

  # Create comment
  def create_comment
    # new object from params
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post = Post.find(params[:id])

    if @comment.save
      flash[:success] = 'Comment created successfully!'
      redirect_to user_post_path
    else
      flash.now[:error] = 'Error creating comment!'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:Title, :Text)
  end

  def comment_params
    params.require(:form_comment).permit(:Text)
  end
end
