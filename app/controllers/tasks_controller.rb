# タスク CRUD処理
class TasksController < ApplicationController
  # 一覧
  def index
    @tasks = Task.all
  end

  # タスク追加画面表示（/tasks/new）にアクセスするときに呼ばれる
  def new
    @task = Task.new
  end
  
  # 作成(タスク追加するときに呼ばれる)
  def create
    @task = Task.create(task_params)
    #  名前付きルート
    #  tasks_pathはトップ画面（/）へのリンクを表す
    redirect_to tasks_path
  end

  # 編集画面表示(/tasks/1/edit)
  def edit
    @task = Task.find(params:[:id])
  end

  # 更新処理
  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end
  
  # Strong Parameters
  # ユーザから悪意のあるパラメータが渡ってきても安全に処理してくれるもの
  # Taskモデルのtitle（タスク名）パラメータがViewから渡ってきた場合のみタスク追加を行う
  private
    def task_params
      params.require(:task).permit(:title)
    end
end
