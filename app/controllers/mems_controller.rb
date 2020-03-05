class MemsController < ApplicationController

  def index

  end 

  def new 
    @memory = Memory.new
  end

  def create
    @memory = Memory.create(memory_params)
    redirect_to root_path
  end 

  def memory_params
    params.require(:memory).permit(:title)
  end
  
end
