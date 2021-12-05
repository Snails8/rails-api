class BoardsController < ApplicationController

  # 一覧
  def index
    @boards = Board.all
  end

  def new
    # インスタンス変数を格納
    @board = Board.new
  end
  
  def create
    # パラメーターを渡すことで保存できる
    Board.create(board_params)
  end
  
  # strong_parameter
  # フォームで送信されるparamsに他のデータを臆させないため(セキュリティ的に問題になる)
  def board_params
    # requireでモデルのキー、permitでプロパティのキー
    params.require(:board).permit(:name, :title, :body)
  end  
end
