import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    delay: { type: Number, default: 3000 }
  }

  connect() {
    console.log("✅ Toast controller connected") // <-- Add this
    this.timeout = setTimeout(() => this.close(), this.delayValue)
  }

  close() {
    console.log("❌ Toast closed") // <-- Add this
    this.element.remove()
  }

  disconnect() {
    clearTimeout(this.timeout)
  }
}
