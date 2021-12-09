const { environment } = require("@rails/webpacker");

const webpack = require("webpack");
environment.plugins.append(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery",
    Rails: "@rails/ujs",
    // "window.jQuery": "jquery",
    // Popper: ["popper.js", "default"],
  })
);

module.exports = environment;
