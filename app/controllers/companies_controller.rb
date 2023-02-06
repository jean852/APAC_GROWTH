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
    # authorize @company
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :domain, :country)
  end

end
