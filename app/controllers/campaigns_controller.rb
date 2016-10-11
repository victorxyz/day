class CampaignsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  before_action :is_authenticated
  before_action :is_authenticated_admin, except: [:index]

  # GET /campaigns
  def index
    @campaigns = Campaign.all
    @volunteer = Volunteer.new
    @campaign = Campaign.where(id: params[:id])
    @id = params[:id]

  end
  # GET /campaigns/1
  def show
  end
  # GET /campaigns/:specialityid/new
  def new
    @campaign = Campaign.new
  end
  # GET /campaigns/1/edit
  def edit
  end
  # POST /campaigns
  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.user_id = current_user.id if current_user
    if @campaign.save
      redirect_to campaigns_path, notice: 'Campaign was successfully created.'
    else
      redirect_to campaigns_path, notice: 'Irsyad says no.'
    end
  end

  # PATCH/PUT /campaigns/1
  def update
    if @campaign.update(campaign_params)
      redirect_to @campaign, notice: 'Campaign was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /campaigns/1
  def destroy
    @campaign.destroy
    redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params.require(:campaign).permit(:title, :description, :deadline, :beneficiary_id, :target_amount, :user_id, :beneficiary_id)
    end
end
