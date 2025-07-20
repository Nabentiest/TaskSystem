// app/javascript/controllers/task_toggle_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["children"]

  toggle() {
    this.childrenTarget.classList.toggle("hidden")
  }
}
