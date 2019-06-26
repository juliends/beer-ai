import { Controller } from 'stimulus';
import Rails from 'rails-ujs';

export default class extends Controller {
  static targets = ['rowsWrapper', 'newRowForm'];

  onPostSuccess() {
    const xhr = event.detail[2];
    this.rowsWrapperTarget.insertAdjacentHTML('beforeend', xhr.response)
  }

  reactOnChange() {
    let product_id = this.newRowFormTarget.elements["batch_product[product_id]"].value;
    let data = new FormData(this.newRowFormTarget);
    let batchId = this.newRowFormTarget.dataset.batchId
    let parentDiv = this.newRowFormTarget.parentNode;
    Rails.ajax({
      type: "POST",
      url: `/batches/${batchId}/batch_products`,
      data: data,
      success: function(response){
        console.log(response);
        parentDiv.outerHTML = response.body.childNodes[0].innerHTML;
        flatpickr('.datepicker', {})
      },
      error: function(response){}
    })
  }
}
