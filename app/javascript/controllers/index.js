// app/javascript/controllers/index.js
import { Application } from "@hotwired/stimulus"

const application = Application.start()
const context = require.context(".", true, /\.js$/)
application.load(context)
