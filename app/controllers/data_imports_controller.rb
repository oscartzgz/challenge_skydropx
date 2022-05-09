class DataImportsController < ApplicationController

  def show
    data_import = DataImport.find(params[:id])
    render json: data_import
  end

  def create
    data_import = DataImport.new(data_import_params)
    
    if data_import.save
      ImportDataFromFileJob.perform_later(data_import)
      render json: data_import.id
    else
      render json: { errors: data_import.errors }
    end
  end

  private
  
  def data_import_params
    params.permit(:file)
  end
end
