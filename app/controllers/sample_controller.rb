class SampleController < ApplicationController

  # 一覧
  def index
    @msg = 'ようこそRailsの世界へ!'
    render 'sample/index'
  end

  # 作成
  def create
    render 'sample/create'
  end
  
end