const {environment} = require('@rails/webpacker');
const webpack = require('webpack');

// Get a pre-configured plugin
const manifestPlugin = environment.plugins.get('Manifest');
manifestPlugin.options.writeToFileEmit = false;

const jqueryLoader = {
    test: require.resolve('jquery'),
    use: [{
        loader: 'expose-loader',
        options: 'jQuery'
    }, {
        loader: 'expose-loader',
        options: '$'
    }]
};

// Insert json loader at the top of list
environment.loaders.prepend('jquery', jqueryLoader);

// environment.plugins.prepend(
//     'Provide',
//     new webpack.ProvidePlugin({
//         $: 'jquery',
//         jQuery: 'jquery',
//         jquery: 'jquery',
//         'window.Tether': 'tether',
//         Popper: ['popper.js', 'default'],
//         ActionCable: 'actioncable',
//     })
// );

module.exports = environment;
