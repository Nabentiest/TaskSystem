import "@hotwired/stimulus-loading"
import { application } from "@hotwired/stimulus"
import TaskToggleController from "./controllers/task_toggle_controller"

import "@hotwired/stimulus"
import "@hotwired/stimulus-loading"


application.register("task-toggle", TaskToggleController)
