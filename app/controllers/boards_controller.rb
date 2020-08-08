class BoardsController < ApplicationController
  def index
    @boards = Board.all
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

  private
  def board_params
    params.require(:board).permit(:title, :intro)
  end
end
