class BatchesController < ApplicationController

  def show
    @batch = Batch.find(params[:id])
    @products = @batch.batch_products
  end
end
