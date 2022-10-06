class CardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: %i[update_amount]
  
  def save
    if !current_user.account.status == "pending" || current_user.account.status != "disabled"
      @account = params[:account_id].to_i
      @card = Card.new
      @card.account_id = @account
      @card.expiration_date = Time.now + 4.year
      @card.card_number = SecureRandom.alphanumeric(8)
      @card.card_type = "debit"
      @card.amount = 1234567890987654.00

      respond_to do |format|
        if current_user.account.card.nil?
          puts "NO CARD"
          if @card.save!
            puts "Success"
            format.html { redirect_to account_url(@account), notice: "Card was successfully Generated." }
            format.json { render :show, status: :created, location: @account }
          else
            puts "Failed"
            format.html { redirect_to account_url(@account), notice: "Account can't be blank OR Card Already exist" }
            format.json { render json: @card.errors, status: :unprocessable_entity }
          end
        else
          puts "HAVE CARD"
          format.html { redirect_to account_url(@account), notice: "You already have a bank card." }
          format.json { render :show, notice: "You already have a bank card.", location: @account }
        end 
      end
    else
      #debugger
      @account = params["account_id"].to_i
      redirect_to account_path(@account), alert: "Your Account Need To Be Activated By One Of Our Admin."
    end
  end
  

  def update_amount
    respond_to do |format| 
    if @card.update!(card_params)
      puts "YES, Updated Sucessfully"
      format.html { redirect_to account_url(@card.account), notice: "Amount was successfully Updated." }
      format.json { render :show, status: :updated, location: @card.account }
    else
      puts "NO, Update Failed"
      format.html { redirect_to account_url(@card.account), notice: "Update Amount Failed." }
      format.json { render :show, notice: "You already have a bank card.", location: @card.account }
    end
  end
    #debugger
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      id_card = params[:account_id].to_i
      @card = Card.find_by(account_id: id_card)
    end

    # Only allow a list of trusted parameters through.
    def card_params
      params.require(:card).permit(:account_id, :amount)
    end
end
        