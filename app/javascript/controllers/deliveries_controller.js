import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['productRow'];

  onPostSuccess() {
    const xhr = event.detail[2];
    this.productRowTarget.innerHTML = xhr.response;
    flatpickr(".datepicker", {})
  }

  onPostError(event) {
  }
}
