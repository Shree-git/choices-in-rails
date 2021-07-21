// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
// Polyfills for various old browsers.
// Using /es (ECMAScript polyfills only) for now since these are the main
// issues we are seeing in Rollbar.
// See https://github.com/zloirock/core-js
// import 'core-js/es'

import ChatPage from 'components/ChatPage'

import WebpackerReact from 'webpacker-react'

import Turbolinks from 'turbolinks'

Turbolinks.start()

WebpackerReact.setup({
  ChatPage
})

// Support component names relative to this directory:
// var componentRequireContext = require.context("components", true);
// var ReactRailsUJS = require("react_ujs");
// ReactRailsUJS.useContext(componentRequireContext);
