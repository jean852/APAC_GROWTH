class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  # BASIC CRUD
  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.client_id_id = current_user.id

    if @project.save
      redirect_to @project, notice: "Project was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    @project.update(project_params)
    if @project.save
      redirect_to client_path
    else
      render :edit
    end
  end

  # 4 DIFFERENT FORM TO INPUT PROJECTS
  def newstudy
    @project = Project.new
    render 'new_study'
  end

  def newsingle
    @project = Project.new
    render 'new_single'
  end

  def newmulti
    @project = Project.new
    render 'new_multi'
  end

  def newleadgen
    @project = Project.new
    render 'new_leadgen'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  # def project_params
  #   params.require(:project).permit(:project_name, :project_type, :project_start, :project_end, :project_budget, countries: [])
  # end

  def project_params
    params.require(:project).permit(
      :project_name,
      :client_id,
      :company_id,
      :expert_id,
      :project_status,
      :project_type,
      :bidding_start,
      :bidding_end,
      :rfp_status,
      :project_start,
      :project_end,
      :project_budget,
      :project_price,
      countries: []
    )
  end

end
