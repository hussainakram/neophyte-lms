class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = current_user.companies.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company_users = @company.users.all.sort{|a,b| b.points <=> a.points}
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create

    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to company_departments_path(@company.id), notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
        @company.company_users.create(user_id: current_user.id);
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def user_graphs
    @company = Company.find(params[:company_id])
    @user = User.find(params[:user_id])
    @user_challenges = @user.user_challenges
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :ceo, :location, :email, :category, :description, :contact_no)
    end
end
