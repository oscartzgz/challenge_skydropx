require 'roo'

class ImportDataFromFileJob < ApplicationJob
  queue_as :default

  attr_reader :data_import

  def perform(data_import)
    @data_import = data_import

    data_import.processing!
    spreadsheet = open_file
    rows = spreadsheet.parse(headers: true)
    import_errors = []
    orders = []
    
    (spreadsheet.first_row...spreadsheet.last_row).each do |index|
      row = rows[index]
      order = Order.new(reference: row["order_reference"] || row["﻿order_reference"])
      orders << order
      shipment = order.build_shipment
      address_from = shipment.build_address_from(address_params(row))
      address_to = shipment.build_address_to(address_params(row, way: :to))
      parcel = shipment.parcels.build(parcel_params(row))
      errors = find_errors(order: order, address_from: address_from, address_to: address_to, parcel: parcel)
      
      import_errors << { row: index, errors: errors } if errors.any?
    end

    if import_errors.any?
      data_import.update(import_errors: import_errors, status: :error)
    else
      orders.each { |order| order.save! }
      data_import.completed!
    end
  end


  private

  def open_file
    format = data_import.file.content_type

    extension = 
      case format
      when "text/csv" then :csv
      else :xlsx
      end

    ss = Roo::Spreadsheet.open(data_import.file_path, extension: extension)
    ss
  end

  def find_errors(order:, address_from:, address_to:, parcel:)
    errors = {}
    errors[:order] = order.errors unless order.valid?
    errors[:address_from] = address_from.errors unless address_from.valid?
    errors[:address_to] = address_to.errors unless address_to.valid?
    errors[:parcel] = parcel.errors unless parcel.valid?
    errors
  end

  def address_params(data, way: :from)
    {
      name:         data["address_#{way}_name"],
      email:        data["address_#{way}_email"],
      street1:      data["address_#{way}_street1"],
      city:         data["address_#{way}_city"],
      province:     data["address_#{way}_province"],
      postal_code:  data["address_#{way}_postal_code"],
      country_code: data["address_#{way}_country_code"]
    }
  end

  def parcel_params(data)
    {
      lenght: data["parcel_length"],
      width: data["parcel_width"],
      height: data["parcel_height"],
      dimension_unit: data["parcel_dimensions_unit"],
      weight: data["parcel_weight"],
      weight_unit: data["parcel_weight_unit"]
    }
  end
end
