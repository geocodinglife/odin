// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// require jquery

import "@hotwired/turbo-rails"
import "controllers"
import "./menu"
import "jquery"



// only for buttons
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("controllers", true, /\.js$/)
application.load(definitionsFromContext(context))



