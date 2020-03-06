class MemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @memories= current_user.memories.all
  end 

  def new 
    @memory = Memory.new
  end

  def show 
    @memory = Memory.find_by_id(params[:id])
    if @memory.blank?
      render plain: 'Not Your Mem', status: :not_found
    elsif @memory.user != current_user
      return render plain: 'Not Your Mem', status: :forbidden
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
    params.require(:memory).permit(:title, :mood, :thoughts, :location)
  end
  
end
