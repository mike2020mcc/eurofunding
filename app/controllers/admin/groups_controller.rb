class Admin::GroupsController < AdminController

  def index
    @groups = section.groups
  end

  private

  def section
    @section ||= Section.find(params[:section_id])
  end

end