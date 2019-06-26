import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['rowsWrapper'];

  connect() {
    console.log(this.rowsWrapperTarget)
  }

  onPostSuccess() {
    const xhr = event.detail[2];
    this.productRowTarget.innerHTML = xhr.response;
  }

  onPostError(event) {
  }
}
