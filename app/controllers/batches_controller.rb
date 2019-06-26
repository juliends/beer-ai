class BatchesController < ApplicationController

  def show
    # We need to set a batch for first page load
    @batch = params[:id] ? Batch.find(params[:id]) : Batch.first
    @products = @batch.batch_products
  end
end
