const path = require("path");
const CopyWebpackPlugin = require("copy-webpack-plugin");

module.exports = {
  module: {
          rules: [{
              test: /\.css$/,
              use: [
                  "style-loader", // creates style nodes from JS strings
                  "css-loader", // translates CSS into CommonJS
                ]
          }]
      },

  entry: "./src/index.js",
  output: {
    filename: "index.js",
    path: path.resolve(__dirname, "dist"),
  },
  plugins: [
    new CopyWebpackPlugin([{ from: "./src/index.html", to: "index.html" }]),
  ],

  devServer: { contentBase: path.join(__dirname, "dist"), compress: true },
};
