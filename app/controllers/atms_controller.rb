class AtmsController < ApplicationController
  before_action :set_atm, only: %i[ show edit update destroy ]

  # GET /atms or /atms.json
  def index
    @atms = Atm.all
  end

  # GET /atms/1 or /atms/1.json
  def show
  end

  # GET /atms/new
  def new
    @atm = Atm.new
  end

  # GET /atms/1/edit
  def edit
  end

  # POST /atms or /atms.json
  def create
    @atm = Atm.new(atm_params)

    respond_to do |format|
      if @atm.save
        format.html { redirect_to atm_url(@atm), notice: "Atm was successfully created." }
        format.json { render :show, status: :created, location: @atm }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @atm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atms/1 or /atms/1.json
  def update
    respond_to do |format|
      if @atm.update(atm_params)
        format.html { redirect_to atm_url(@atm), notice: "Atm was successfully updated." }
        format.json { render :show, status: :ok, location: @atm }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @atm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atms/1 or /atms/1.json
  def destroy
    @atm.destroy

    respond_to do |format|
      format.html { redirect_to atms_url, notice: "Atm was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def balance
    puts "Welcome, Check your balance!"
    if current_user
      @user = current_user
      @account = @user.account
      #session[:account] = @account
      card = @account.card.amount
      session[:amount_in_card] = card
      #puts @card = @account.card
      respond_to do |format|
        format.html { render :index, notice: "Transaction Done Successfully." }
        #format.html { redirect_to atms_path(), notice: "Transaction Done Successfully." }
        #format.json { render :show, status: :ok, location: @atm }
      end
    end
  end

  def deposit
    #redirect_to deposit_atms_path()
  end
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atm
      @atm = Atm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def atm_params
      params.fetch(:atm, {})
    end
end
