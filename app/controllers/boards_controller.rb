class BoardsController < ApplicationController
  before_action :find_board, only: [:favorite, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @boards = Board.where(deleted_at: nil)
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to boards_path, notice: '新增成功！'
    else
      render :new
    end
  end

  def show
    # 解決N+1問題，除了找@board也列出@posts
    #@posts = @board.posts.includes(:user)
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to boards_path, notice: '更新成功！'
    else
      render :edit
    end
  end

  def destroy
    @board.destroy
    #@board.update(deleted_at: Time.now)
    redirect_to boards_path, notice: '刪除成功！'    
  end

  def favorite
    #current_user.favorited_boards << @board
    current_user.toggle_favorite_board(@board)
    # redirect_to favorites_path, notice: 'OK!'

    # 找到favorite後，根據格式分發到不同地方
    # 預設是回傳html
    respond_to do |format|
      format.html { redirect_to favorites_path, notice: 'OK!' }
      format.json { render json: {status: @board.favorited_by?(current_user) } }
      # @board.favorited
    end
  end

  private
  def find_board
    @board = Board.find(params[:id])
  end
  # Strong Parameters
  def board_params
    params.require(:board).permit(:title, :intro)
  end

end
