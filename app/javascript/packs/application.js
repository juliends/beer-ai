import "bootstrap";

import Rails from 'rails-ujs';
Rails.start();

// Stimulus
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("../controllers", true, /\.js$/);
application.load(definitionsFromContext(context))
