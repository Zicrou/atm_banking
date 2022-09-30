class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]

  # GET /accounts or /accounts.json
  def index
    @accounts = Account.all
  end

  # GET /accounts/1 or /accounts/1.json
  def show
    @card = Card.find_by(account_id: @account)
    #debugger
  end

  # GET /accounts/new
  def new
    @account = Account.new
    #@sexe = {[id: 0, name: "man"], [id: 1, name: "woman"]}
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts or /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to account_url(@account), notice: "Account was successfully created." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to account_url(@account), notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url, notice: "Account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def generate_bank_card
    @account = params[:account_id].to_i
    @card = Card.new
    @card.account_id = @account
    @card.expiration_date = Time.now + 4.year
    @card.card_number = SecureRandom.alphanumeric(8)
    @card.card_type = "debit"
    @card.amount = 1234567890987654
    
    
    if current_user.account.card.nil?
      puts "NO CARD"
      respond_to do |format|
        if @card.save
          puts "Success"
          format.html { redirect_to account_url(@account), notice: "Card was successfully Generated." }
          format.json { render :show, status: :created, location: @account }
        else
          puts "Failed"
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @account.errors, status: :unprocessable_entity }
        end
      end
    else
        puts "HAVE CARD"
    end
    

    debugger
    #redirect_to root_path()
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:name, :phone_number, :date_of_birth, :sexe, :profession, :address)
    end
end
