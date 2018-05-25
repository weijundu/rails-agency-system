class ContractsController < ApplicationController

  before_action :set_contract, only:[:edit, :update, :show, :destroy]
  def index
    @contracts = policy_scope(Contract)
    @contracts = [""] if @contracts == nil
  end

  def new
    @contract = Contract.new
    @profile = Profile.find(params[:profile_id])
    authorize @contract
  end
  def create
    @contract = Contract.new(contract_params)
    @contract.user = current_user
    @contract.profile = Profile.find(params[:profile_id])
    @contract.start = @contract.start_date.to_date
    @contract.finished = @contract.end_date.to_date
    authorize @contract
    @contract.save
    redirect_to contracts_path
  end

  def edit


  end

  def update
    @contract.update(contract_params)
    @contract.start = @contract.start_date.to_date
    @contract.finished = @contract.end_date.to_date
    redirect_to contract_path(params[:id])
  end

  def show
  end

  def destroy
    @contract.destroy
  end

  private
  def set_contract
    @contract = Contract.find(params[:id])
    authorize @contract
  end

  def contract_params
    params.require(:contract).permit(:note, :start_date, :end_date)
  end
end
