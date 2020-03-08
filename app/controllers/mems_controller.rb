class MemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @memories = current_user.memories.all
    if current_user.memories.blank? 
      redirect_to new_mem_path 
      flash[:alert] = "Create Mem First"
    end 
  end 

  def new 
    @memory = Memory.new
    # @photo = Photo.new
  end

  def show 
    @memory = current_user.memories.find_by_id(params[:id])
    if @memory.blank?
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

  def edit 
    @memory = current_user.memories.find_by_id(params[:id])
    if @memory.blank?
      redirect_to mems_path
      flash[:alert] = "Mem Not Found"
    end
  end 

  def update 
    @memory = current_user.memories.find_by_id(params[:id])
    if @memory.blank?
      redirect_to edit_mem_path 
      flash[:alert] = "Mem Not Found"
    end 
    @memory.update_attributes(memory_params)
    # if @memory.valid?
      redirect_to edit_mem_path 
    # else 
    #   render :edit, status: :unprocessable_entity 
    # end 
  end 

  private

  def memory_params
    params.require(:memory).permit(:mem, :mood, :thoughts, :date, :location)
  end
end
