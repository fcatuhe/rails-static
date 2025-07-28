import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  click(event) {
    event.preventDefault()
    this.element.click()
  }
}
