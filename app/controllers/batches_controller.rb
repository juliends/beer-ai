class BatchesController < ApplicationController

  def show
    # We need to set a batch for first page load
    if params[:id]
      @batch = Batch.find(params[:id])
    else
      @batch = Batch.first
    end
    @products = @batch.batch_products
  end
end
