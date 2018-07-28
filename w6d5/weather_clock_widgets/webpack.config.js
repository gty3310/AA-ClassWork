var path = require('path');

module.exports = {
  context: __dirname,
  entry: "./frontend/widget.jsx",
  output: {
    path: path.resolve(__dirname),
    filename: "bundle.js"
  },
  module: {
    rules: [
      {
        test: [/\.jsx?$/, /\.js?$/],
        exclude: /node_modules/,
        loader: 'babel-loader',
        query: {
          presets: ['react', 'env']
        }
      }
    ]
  },
  devtool: 'source-maps',
  resolve: {
    extensions: [".js", '.jsx', '*']
  }
};
