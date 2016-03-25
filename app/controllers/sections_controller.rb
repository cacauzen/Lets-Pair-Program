class SectionsController < ApplicationController


  def show
    @section = Section.find(:id)
  end

end
