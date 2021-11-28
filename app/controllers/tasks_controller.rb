# タスク CRUD処理
class TasksController < ApplicationController
  # 一覧
  def index
    @tasks = Task.all
  end

  # タスク追加画面（/tasks/new）にアクセスするときに呼ばれる
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
  
  # Strong Parameters
  # ユーザから悪意のあるパラメータが渡ってきても安全に処理してくれるもの
  # Taskモデルのtitle（タスク名）パラメータがViewから渡ってきた場合のみタスク追加を行う
  private
    def task_params
      params.require(:task).permit(:title)
    end
end
