class DeliveriesController < ApplicationController
  def create
    @delivery = Delivery.new(delivery_params)
    @batch_product = BatchProduct.find(params[:batch_product_id])
    @delivery.batch_product = @batch_product
    @delivery.save
    ForecastService.new(@batch_product).call
    puts Forecast.last.qty
    puts Forecast.last.date
    render partial: 'batch_products/product_row', locals: { product: @batch_product }
  end

  private

  def delivery_params
    params.require(:delivery).permit(:date, :qty, :note)
  end
end
