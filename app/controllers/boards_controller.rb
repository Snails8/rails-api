class BoardsController < ApplicationController

  # 各メソッドが呼ばれる前に実行させる(onlyで)
  before_action :set_target_board, only: %i[show edit update destroy]

  # 一覧
  def index
    @boards = Board.page(params[:page])
  end

  def new
    # インスタンス変数を格納(保存失敗時flashを格納)
    @board = Board.new(flash[:board])
  end
  
  def create
    # 初期化()
    board = Board.new(board_params)

    # 保存した場合 true が返される(このときvalidationが起こる)
    if board.save
      # user のsessionに一次的にfalshデータの格納(リロードなくなる )
      flash[:notice] = "「#{board.title}」の掲示板を作成しました"
      redirect_to board
    else 
      redirect_to new_board_path, flash: {
        board: board,
        error_messages: board.errors.full_messages
      }
    end

    # パラメーターを渡すことで保存できる
    # board = Board.create(board_params)
  end

  def show
    # このままだと保存されていない全てのコメントが表示されてしまう。(常に空のコメントが含まれる)
    # @comment = @board.comments.new

    # 初期化する際に紐付いたのもを取得
    @comment = Comment.new(board_id: @board_id)

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
