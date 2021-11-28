class TaskController < ApplicationController
  
  # 一覧
  def index
    @tasks = Task.all
  end

  
  
end
