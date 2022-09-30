class CardController < ApplicationController
  
  def save
    @account = params[:account_id].to_i
    @card = Card.new
    @card.account_id = @account
    @card.expiration_date = Time.now + 4.year
    @card.card_number = SecureRandom.alphanumeric(8)
    @card.card_type = "debit"
    @card.amount = 1234567890987654
    
    respond_to do |format|
      if current_user.account.card.nil?
        puts "NO CARD"
        if @card.save
          puts "Success"
          format.html { redirect_to account_url(@account), notice: "Card was successfully Generated." }
          format.json { render :show, status: :created, location: @account }
        else
          puts "Failed"
          format.html { redirect_to account_url(@account), notice: "Account can't be blank" }
          format.json { render json: @account.errors, status: :unprocessable_entity }
        end
      else
        puts "HAVE CARD"
        format.html { redirect_to account_url(@account), notice: "You already have a Bank Card. You can update you amount of Money" }
        format.json { render json: "You already have a Bank Card. You can update you amount of Money" }
      end 
    end
    
    #debugger
  end
  
end
