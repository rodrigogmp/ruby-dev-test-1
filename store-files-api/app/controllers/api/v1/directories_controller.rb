# frozen_string_literal: true

class Api::V1::DirectoriesController < ApplicationController
  before_action :set_directory, except: [:index, :create]
    
  def index
    @directories = Directory.where(directory_id: nil)
  end

  def show
    
  end
  
  def create
    @directory = Directory.create(directory_params)

    if @directory.errors.any?
      return render json: { errors: @directory.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def update
    unless @directory.update(directory_params)
      return render json: { errors: @directory.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    unless @directory.destroy
      return render json: { errors: @directory.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def directory_params
    params.require(:name)
    params.permit(:name)
  end

  def set_directory
    @directory = Directory.find(params[:id])
  end
end
