class PostsController < ApplicationController
  before_action :find_board, only: [:new, :create, :show]
  before_action :find_post, only: [:edit, :update, :destroy] 
  def show
    @post = Post.find(params[:id])
  end
  def new
    @post = @board.posts.new
  end

  def create
    @post = @board.posts.new(post_params)

    if @post.save
      redirect_to @board, notice: '文章新增成功'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to board_path(@post.board_id), notice: '文章更新成功'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to board_path(@post.board_id), notice: '文章刪除成功'
  end

  private
  def find_board
    #byebug
    @board = Board.find(params[:board_id]) if params[:board_id]
    @board = Post.find(params[:id]).board if params[:id]
  end

  def find_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
