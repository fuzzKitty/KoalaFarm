class KoalasController < ApplicationController
  before_action :set_koala, only: [:show, :edit, :update, :destroy]

  # GET /koalas
  # GET /koalas.json
  def index
    @koalas = Koala.all
  end

  # GET /koalas/1
  # GET /koalas/1.json
  def show
  end

  # GET /koalas/new
  def new
    @koala = Koala.new
  end

  # GET /koalas/1/edit
  def edit
  end

  # POST /koalas
  # POST /koalas.json
  def create
    @koala = Koala.new(koala_params)

    respond_to do |format|
      if @koala.save
        format.html { redirect_to @koala, notice: 'Koala was successfully created.' }
        format.json { render :show, status: :created, location: @koala }
      else
        format.html { render :new }
        format.json { render json: @koala.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /koalas/1
  # PATCH/PUT /koalas/1.json
  def update
    respond_to do |format|
      if @koala.update(koala_params)
        format.html { redirect_to @koala, notice: 'Koala was successfully updated.' }
        format.json { render :show, status: :ok, location: @koala }
      else
        format.html { render :edit }
        format.json { render json: @koala.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /koalas/1
  # DELETE /koalas/1.json
  def destroy
    @koala.destroy
    respond_to do |format|
      format.html { redirect_to koalas_url, notice: 'Koala was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_koala
      @koala = Koala.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def koala_params
      params.require(:koala).permit(:name, :dob, :colour, :character, :favourite_food)
    end
end
