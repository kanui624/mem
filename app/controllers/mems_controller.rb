class MemsController < ApplicationController

  def index

  end 

  def new 
    @memory = Memory.new
  end
  
end
