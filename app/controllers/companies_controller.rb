class CompaniesController < ApplicationController
    before_action :set_company, only:[:show, :edit, :update, :delete]

  def index
    @companies = policy_scope(Company)
    @companies = [""] if @companies == nil
  end

  def new
    @company = Company.new
    authorize @company
  end

  def create
    @company = Company.new(params_company)
    @company.user = current_user
    authorize @company
    @company.save
    redirect_to company_path(@company)
  end

  def show

  end

  def edit

  end

  def update
    @company.update(params_company)
    redirect_to company_path(@company)
  end

  def destroy
    @company.destroy
    redirect_to companies_path
  end

  private
  def set_company
    @company = Company.find(params[:id])
    authorize @company
  end

  def params_company
    params.require(:company).permit(:name, :intro, :website, :phone_number, :address, :image)
  end
end
