class DemoController < ApplicationController

  def index
  end

  def hello
    @array = [1,2,3,4,5]
    @id = params['id']
    @page = params[:page].to_i
  end

end
