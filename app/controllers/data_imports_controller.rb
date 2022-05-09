class DataImportsController < ApplicationController

  def show
    data_import = DataImport.find(params[:id])
    render json: data_import
  end

  def create
    data_import = DataImport.create(data_import_params)

    render json: data_import.id
  end

  private
  
  def data_import_params
    params.permit(:file)
  end
end
