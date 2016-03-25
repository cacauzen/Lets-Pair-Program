class SectionsController < ApplicationController

  def new
    @section = Section.new
  end

  def show
    @section = Section.find(params[:id])
  end

end
