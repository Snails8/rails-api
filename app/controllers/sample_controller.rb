class SampleController < ApplicationController

  # 一覧
  def index
    @msg = 'ようこそRailsの世界へ!'
    render 'sample/index'
  end
  
end