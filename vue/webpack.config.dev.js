"use strict";
const path = require("path");
const { VueLoaderPlugin } = require("vue-loader");
const webpack = require("webpack");

module.exports = (env) => {
  return {
    watch: env.watch == "true",
    mode: env.production ? "production" : "development",
    entry: {
      index: "./src/main.js",
    },
    output: {
      path: path.resolve("app", "assets", "javascripts"),
      filename: "[name].js",
    },
    stats: {
      warnings: false,
    },
    resolve: {
      // include folder so we can import direct from node modules
      modules: [path.resolve("node_modules")],
      alias: {
        "@": path.resolve("src"),
      },
      extensions: [".js", ".vue"],
    },
    module: {
      rules: [
        {
          test: /\.vue$/,
          loader: "vue-loader",
        },
        {
          test: /\.css$/,
          use: ["style-loader", "css-loader"],
        },
        {
          test: /\.scss$/,
          use: [
            "style-loader", // creates style nodes from JS strings
            "css-loader", // translates CSS into CommonJS
            {
              loader: "sass-loader", // compiles Sass to CSS, using Node Sass by default
            },
          ],
        },
        {
          test: /\.(png|jpe?g|gif|mp3)$/i,
          use: [
            {
              loader: 'file-loader',
            },
          ],
        },
        {
          test: /\.m?js$/,
          exclude: /(node_modules)/,
          use: {
            loader: "babel-loader",
            options: {
              presets: [["@babel/preset-env", { "targets": "defaults" }]]
            },
          },
        },
      ],
    },
    plugins: [new VueLoaderPlugin()],
  };
};
