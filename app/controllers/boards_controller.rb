class BoardsController < ApplicationController

  # 各メソッドが呼ばれる前に実行させる(onlyで)
  before_action :set_target_board, only: %i[show edit update destroy]

  # 一覧
  def index
    @boards = Board.page(params[:page])
  end

  def new
    # インスタンス変数を格納
    @board = Board.new
  end
  
  def create
    # パラメーターを渡すことで保存できる
    board = Board.create(board_params)
    # boardにはidがあるのでそれをもとにしたurlに移動
    redirect_to board
  end

  def show
  end

  def edit
  end

  def update
    @board.update(board_params)

    # 特殊な書き方ではあるが、オブジェクトを入れると遷移する
    redirect_to @board
  end

  def destroy
    @board.delete
    # 一覧へ
    redirect_to boards_path
  end
  
  private
  # strong_parameter
  # フォームで送信されるparamsに他のデータを臆させないため(セキュリティ的に問題になる)
  def board_params
    # requireでモデルのキー、permitでプロパティのキー
    params.require(:board).permit(:name, :title, :body)
  end  

  def set_target_board
    # 他のメソッドからアクセスできるように@boardに格納
    @board = Board.find(params[:id])
  end  
end
