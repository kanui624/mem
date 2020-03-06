class MemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @memories= current_user.memories.all
    if current_user.memories.blank? 
      redirect_to new_mem_path 
      flash[:alert] = "Create Mem First"
    end 
  end 

  def new 
    @memory = Memory.new
    @mem_photo = Mem_photo.new
  end

  def show 
    @memory = Memory.find_by_id(params[:id])
    if @memory.blank?
      redirect_to mems_path
    elsif @memory.user != current_user
      redirect_to mems_path
    end
  end

  def create
    @memory = current_user.memories.create(memory_params)
    if @memory.valid?
      redirect_to mems_path
    else 
      render :new, status: :unprocessable_entity 
    end
  end 

  def memory_params
    params.require(:memory).permit(:mem_title, :mood, :thoughts, :date, :location)
  end
  
end
