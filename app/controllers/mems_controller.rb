class MemsController < ApplicationController

  def index

  end 

  def new 
    @memory = Memory.new
  end

  def create
    @memory = Memory.create(memory_params)
    if @memory.valid?
      redirect_to root_path
    else 
      render :new, status: :unprocessable_entity 
    end
  end 

  def memory_params
    params.require(:memory).permit(:title)
  end
  
end
