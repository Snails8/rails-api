class BoardsController < ApplicationController

  # 一覧
  def index

  end

  def new
    # インスタンス変数を格納
    @board = Board.new
  end
  
  
end
