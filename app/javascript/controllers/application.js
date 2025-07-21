import { Application } from "@hotwired/stimulus"
import ToastController from "./toast_controller"

const application = Application.start()
application.register("toast", ToastController)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
