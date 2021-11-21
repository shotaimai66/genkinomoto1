const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.config.resolve.alias = { 'jQuery': 'jquery/src/jquery' }

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: ['popper.js', 'default']
  })
)

module.exports = environment
