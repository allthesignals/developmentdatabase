class ClaimsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :load_parent, only: [:new, :create]

  def new
    @claim = Claim.new(development: @development)
  end

  def create
    @claim = Claim.new
    @claim.assign_attributes(development: @development, claimant: current_user)
    if @claim.save
      flash[:success] = CLAIM_CREATED
      redirect_to @development
    else
      flash[:danger] = @claim.errors.full_messages #CLAIM_NOT_CREATED
      redirect_to @development
    end
  end

  def index
    @claim = Claim.all
  end

  private

    def load_parent
      @development = Development.find params[:development_id]
    end

    CLAIM_CREATED = """
      We received your claim and will address it within 5-10 business days.
    """

    CLAIM_NOT_CREATED = """
      Sorry, we were unable to accept your claim. Please contact
      us if you think this message is in error.
    """

end
