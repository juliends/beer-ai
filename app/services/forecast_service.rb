class ForecastService

  # NB edge case 0

  def initialize(batch_product_id)
    @batch_product = BatchProduct.find batch_product_id
    @deliveries = @batch_product.deliveries
  end

  def call
    Forecast.create!(
      batch_product: @batch_product,
      delivery: last_delivery,
      rotation: rotation,
      date: date,
      qty: qty
    )
  end

  private

  def first_date
    @deliveries.first.date
  end

  def last_delivery
    @last_delivery ||= @deliveries.last
  end


  def range_business_days(start_date, end_date)
    (start_date..end_date).select{|d| !d.saturday? && !d.sunday? }.length
  end

  def consumption_period
    range_business_days(first_date, last_delivery.date - 1)
  end

  def deliveries_qty
    @deliveries[0..-2].pluck(:qty).sum
  end

  def rotation
    (deliveries_qty / consumption_period.to_f)
  end

  def qty
    ranges = @deliveries.pluck(:date).each_cons(2).map do |range|
      range_business_days(range[0], range[1] - 1)
    end
    average_range = ranges.inject{ |sum, el| sum + el }.to_f / ranges.size
    (average_range * rotation).ceil
  end

  def date
    forecast_date = last_delivery.date
    (last_delivery.qty / rotation).to_i.times do
      forecast_date.friday? ? forecast_date += 3 : forecast_date += 1
    end
    forecast_date
  end
end
