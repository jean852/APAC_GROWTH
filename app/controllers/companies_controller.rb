class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]

  def index
    @companies = Company.all
  end

  def show
    # authorize @company
  end

  def new
    @company = Company.new
    # authorize @company
  end

  def create

    # CREATE A CHECK TO SEE IF COMPANY ALREADY EXIST / THEN ONLY ATTRIBUTE ID TO USER ONLY

    # IF COMPANY DOESNT EXISTS THEN CREATE IT AND TTRIBUTE COMPANY ID TO USER
    @company = Company.new(company_params)

    # INSERT THE JOB TO ENRICH COMPANY
    @company.save
    current_user.company_id = @company.id
    current_user.save

    enriched_data = ComplookupJob.perform_now(@company.domain, @company.country, @company.name)

    unless enriched_data.nil?
      @company.description = enriched_data["description"]
      @company.founded = enriched_data["founded_year"]
      @company.company_size = enriched_data["company_size_on_linkedin"]
      @company.country = enriched_data["hq"]["country"]
      @company.specialities = enriched_data["specialities"]
      @company.tagline = enriched_data["tagline"]
      @company.profile_pic_url = enriched_data["profile_pic_url"]
      @company.background_cover_image_url = enriched_data["background_cover_image_url"]
      @company.save
    end

    redirect_to edit_company_path(@company)
    # authorize @company
  end

  def edit

  end

  def update
    @company.update(company_params)
    if @company.save
      redirect_to client_path
    else
      render :edit
    end
  end

  def destroy

  end

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :domain, :country, :description, :founded, :company_size, :specialities, :tagline)
  end

end
