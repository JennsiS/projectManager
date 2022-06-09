const path = require('path');
const { VueLoaderPlugin } = require("vue-loader");
const HtmlWebpackPlugin = require('html-webpack-plugin');
// const MiniCssExtractPlugin = require('mini-css-extract-plugin');

module.exports = {
  mode: "development",
  entry: ["./src/main.js"],
  module: {
    rules: [
      {
        test: /\.vue$/,
        use: "vue-loader",
      },
    ],
  },
  plugins: [new VueLoaderPlugin(),
    new HtmlWebpackPlugin({
        template: 'index.html',
        filename: 'index.html',
        inject: true,
      })
],
resolve: {
    alias: {
      "@": path.resolve("src")
    },
    extensions: [".js", ".vue"]
  },
};
