class FoodsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  def index
    @title = 'Foods'
    params[:food_type] = params[:q].delete(:food_type) if params[:q]
    params[:food_type] ||= 'foods'
    if params[:food_type] && params[:food_type] == 'drinks'
      @base_model = Food.active.drinks
      @title = 'Drinks'
    elsif params[:food_type] == 'foods'
      @base_model = Food.active.foods
    else
      @base_model = Food.active
    end
    @q = @base_model.ransack(params[:q])

    @foods = @q.result.paginate(:page => params[:page])
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
    if params[:food_type] && params[:food_type] == 'drinks'
      @food.food_type = 'drink'
      @food_type = 'Drink'
    else
      @food.food_type = 'food'
      @food_type = 'Food'
    end
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to @food, notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to @food, notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.deactivate!
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:name, :description, :food_type, :price)
    end
end
