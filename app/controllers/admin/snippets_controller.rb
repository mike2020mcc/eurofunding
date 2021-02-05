class Admin::SnippetsController < AdminController

  def index
    @snippets = group.snippets
  end

  def edit
    @snippet ||= group.snippets.find(params[:id])
  end

  def update
    @snippet ||= group.snippets.find(params[:id])
    if @snippet.update_attributes(snippet_params)
      flash.now[:success] = 'Saved'
      render 'edit'
    else
      flash.now[:danger] = 'Problem saving'
      render 'edit'
    end

  end

  private

  def section
    @section ||= Section.find(params[:section_id])
  end

  def group
    @group ||= section.groups.find(params[:group_id])
  end

  def snippet_params
    params.require(:snippet).permit(:content)
  end

end