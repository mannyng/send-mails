class MassmailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_massmail, only: [:show, :edit, :update, :destroy]

  # GET /massmails
  # GET /massmails.json
  def index
    @massmails = Massmail.all
  end

  def mysender
    
  end  
  def sendengine
    @riends = params[:email]
    friends = @riends.split
    #num = 0
    toreply = params[:toreply]
    data = params[:body]
    subject = params[:subject]
    greeting = params[:greeting]
    sender_name = params[:sender_name]
    sender = params[:sender_email]
    imagepath = params[:imagepath]
    linkpath = params[:linkpath]
    #friends = @friends.map(&:to_s)
     #@friends.each_line do |friend|
       #num += 1
      
      #LoanMailer.welcome(friend,toreply,data,subject,greeting,sender_name,sender).deliver
      SendLoanEmailJob.set(wait: 40.seconds).perform_later(friends,toreply,data,subject,greeting,sender_name,sender)
    
    redirect_to root_path
  end  
  # GET /massmails/1
  # GET /massmails/1.json
  def myletter
    
  end  
  def letterengine
    @riends = params[:email]
    friends = @riends.split
    #num = 0
    toreply = params[:toreply]
    data = params[:body]
    subject = params[:subject]
    greeting = params[:greeting]
    sender_name = params[:sender_name]
    sender = params[:sender_email]
    imagepath = params[:imagepath]
    linkpath = params[:linkpath]
    friends.each do |friend| 
      SendLetterEmailJob.set(cron: '*/5 * * * *').perform_later(friend,toreply,data,subject,greeting,sender_name,sender)
      #SendLetterEmailJob.set(wait: 40.seconds).perform_later(friend,toreply,data,subject,greeting,sender_name,sender)
    end
    redirect_to root_path
  end 
  def show
  end

  # GET /massmails/new
  def new
    @massmail = Massmail.new
  end

  # GET /massmails/1/edit
  def edit
  end

  # POST /massmails
  # POST /massmails.json
  def create
    @massmail = Massmail.new(massmail_params)

    respond_to do |format|
      if @massmail.save
        format.html { redirect_to @massmail, notice: 'Massmail was successfully created.' }
        format.json { render :show, status: :created, location: @massmail }
      else
        format.html { render :new }
        format.json { render json: @massmail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /massmails/1
  # PATCH/PUT /massmails/1.json
  def update
    respond_to do |format|
      if @massmail.update(massmail_params)
        format.html { redirect_to @massmail, notice: 'Massmail was successfully updated.' }
        format.json { render :show, status: :ok, location: @massmail }
      else
        format.html { render :edit }
        format.json { render json: @massmail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /massmails/1
  # DELETE /massmails/1.json
  def destroy
    @massmail.destroy
    respond_to do |format|
      format.html { redirect_to massmails_url, notice: 'Massmail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_massmail
      @massmail = Massmail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def massmail_params
      params.fetch(:massmail, {})
    end
end
