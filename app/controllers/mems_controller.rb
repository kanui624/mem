class MemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index

  end 

  def new 
    @memory = Memory.new
  end

  def create
    @memory = current_user.memories.create(memory_params)
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
