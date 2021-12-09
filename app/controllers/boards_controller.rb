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

    # user のsessionに一次的にfalshデータの格納(リロードなくなる )
    flash[:notice] = "「#{board.title}」の掲示板を作成しました"
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
    redirect_to boards_path, flash: { notice: "「#{@board.title}」の掲示板は削除されました"}
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
