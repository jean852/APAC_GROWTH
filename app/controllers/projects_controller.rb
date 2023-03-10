
class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]


  # BASIC CRUD
  def index
    @projects = Project.all

    if params[:client_id].present?
      @projects = @projects.where(client_id: params[:client_id])
    end
  end


  def show

  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.client_id = current_user.id
    @project.company_id = current_user.company_id
    clean_arrays

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

  # Project Pages for Client

  def clientprojects
    @rfpprojects = Project.where(client_id: current_user.id, project_status: ["pending_validation", "pending_deposit", "active_rfp"])
    @activeprojects = Project.where(client_id: current_user.id, project_status: ["active", "pending_resolution"])
    @archivedprojects = Project.where(client_id: current_user.id, project_status: ["closed", "cancelled"])
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

  def clean_arrays
    @project.attributes.each do |attr, value|
      @project[attr] = value.reject(&:empty?) if value.is_a?(Array)
    end
  end

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
      :project_duration,
      :project_objective,
      :intros_quantity,
      :target_type,
      :target_company,
      :target_url,
      :target_country,
      :target_name,
      :target_ideal,
      :project_expert_fee,
      :project_platform_fee,
      :project_payment_fee,
      :parameter_incognito,
      :parameter_terms,
      intros_type: [],
      target_industries: [],
      target_regions: [],
      target_size: [],
      target_seniority: [],
      target_jobtitle: [],
      study_elements: [],
      study_deliverables: []
    )
  end


end
