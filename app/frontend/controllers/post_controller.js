import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'title' ]

  something(e) {
    this.titleTarget.textContent = "貓貓";
    console.log(e.detail["hazcheeseburger"]);
    //console.log(e);
  }
}
