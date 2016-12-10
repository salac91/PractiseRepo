class CompaniesController < ApplicationController

  # GET /companies
  def index
    @companies = Company.all
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # POST /companies
  def create
    @company = Company.new(company_params)
    @company.save
    redirect_to companies_path, notice: 'Company was successfully created.'
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name)
    end
end
