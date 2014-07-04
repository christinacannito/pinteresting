# require 'pry'
class FunniesController < ApplicationController
  before_action :set_funny, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # above you can edit what you would like to see or NOT see
  # if a person is signed in or not 

  # GET /funnies
  # GET /funnies.json
  def index
    @funnies = Funny.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10) # .all gives you all of them in which they were created 
  end

  # GET /funnies/1
  # GET /funnies/1.json
  def show
  end

  # GET /funnies/new
  def new
    @funny = current_user.funnies.build
  end # this is another way to create a funny

  # GET /funnies/1/edit
  def edit
  end

  # POST /funnies
  # POST /funnies.json
  def create
    @funny = current_user.funnies.build(funny_params)

    respond_to do |format|
      if @funny.save
        format.html { redirect_to @funny, notice: 'Funny was successfully created.' }
        format.json { render :show, status: :created, location: @funny }
      else
        format.html { render :new }
        format.json { render json: @funny.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funnies/1
  # PATCH/PUT /funnies/1.json
  def update
    respond_to do |format|
      if @funny.update(funny_params)
        format.html { redirect_to @funny, notice: 'Funny was successfully updated.' }
        format.json { render :show, status: :ok, location: @funny }
      else
        format.html { render :edit }
        format.json { render json: @funny.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funnies/1
  # DELETE /funnies/1.json
  def destroy
    @funny.destroy
    respond_to do |format|
      format.html { redirect_to funnies_url, notice: 'Funny was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funny
      @funny = Funny.find(params[:id])
    end

    def correct_user
      # binding.pry
      # check if the user's signed in 
      # if current_user && current_user.funny_ids.include?(params[:id])
      if current_user && current_user.funny_ids.include?(params[:id])
      # @funny = current_user.funnies.find_by(id: params[:id])
        redirect_to funnies_path, notice: "Not authorized to edit this pin" if @funny.nil?
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funny_params
      params.require(:funny).permit(:description, :image)
    end
end
