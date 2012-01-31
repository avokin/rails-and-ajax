class ProjectsController < ApplicationController
  def index
    @project = Project.new
    @projects = Project.all
  end

  def index_json
    @project = Project.new
    @projects = Project.all
  end

  def ajax_javascript_response
    @project = Project.new params[:project]
    if @project.save
      flash[:notice] = "Successfully created project."
      @projects = Project.all
    end
  end

  def ajax_json_response
    @project = Project.new params[:project]
    @project.save
  end

  def ajax_html_response

  end
end
