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
    @friends = params[:email]
    num = 0
    #@friends = ['nji@smailg.com','guy@saol.com']
    subject = params[:subject]
    body = params[:body]
    sender = params[:sender]
    #friend = @friends.each {|x| x=x.first}
    #friends = @friends.map(&:to_s)
     @friends.each_line do |friend|
       num += 1
      MassMailer.welcome(friend,subject,body,sender).deliver
    end
    redirect_to root_path
  end  
  # GET /massmails/1
  # GET /massmails/1.json
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
