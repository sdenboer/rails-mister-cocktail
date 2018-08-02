class DosesController < ApplicationController
  before_action :find_dose, only: [:edit, :update, :destroy]

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dose.update(dose_params)
     else
      render :edit  
     end
  end

  def destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:amount, :volume, :description, :ingredient_id, :cocktail_id)
  end

  def find_dose
    @dose = Dose.find(params[:id])
  end
end
