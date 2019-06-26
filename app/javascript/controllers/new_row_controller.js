import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['rowsWrapper'];

  onPostSuccess() {
    const xhr = event.detail[2];
    this.rowsWrapperTarget.insertAdjacentHTML('beforeend', xhr.response)
  }

  onPostError(event) {
  }
}
