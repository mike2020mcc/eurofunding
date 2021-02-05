class Admin::SectionsController < AdminController

  def index
    @sections = Section.all
  end

end