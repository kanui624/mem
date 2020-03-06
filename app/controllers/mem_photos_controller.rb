class MemPhotosController < ApplicationController
  before_action :authenticate_user!

  def create
    @memory = Memory.find(params[:memory_id])
    @memory.mem_photos.create(mem_photo_params.merge(user: current_user))
    redirect_to mems_path
  end 

  private 

  def mem_photo_params
    params.require(:mem_photo).permit(:caption, :picture)
  end
end
