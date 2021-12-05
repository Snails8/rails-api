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

  def show
    @board = Board.find(params[:id])    
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    board = Board.find(params[:id])
    board.update(board_params)

    # 特殊な書き方ではあるが、オブジェクトを入れると遷移する
    redirect_to board
  end
  
  
  private
  # strong_parameter
  # フォームで送信されるparamsに他のデータを臆させないため(セキュリティ的に問題になる)
  def board_params
    # requireでモデルのキー、permitでプロパティのキー
    params.require(:board).permit(:name, :title, :body)
  end  
end
