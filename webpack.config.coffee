fontName = 'fonts/[name].[ext]'

module.exports =
  entry:
    main: [
      'webpack-dev-server/client?http://localhost:8080'
      'webpack/hot/dev-server'
      './example/main'
    ]
  output:
    path: 'build/'
    filename: '[name].js'
    publicPath: 'http://localhost:8080/build/'
  resolve:
    extensions: ['.coffee', '.css', '.js', '.jsx', '.less', '']
    modulesDirectories: ['node_modules', 'src']
  module:
    loaders: [
      {test: /\.coffee$/, loader: 'coffee-loader'}
      {test: /\.css$/, loader: 'style-loader!css-loader'}
      {test: /\.jsx$/, exclude: /node_modules/, loader: 'babel-loader'}
      {test: /\.less$/, loader: 'style-loader!css-loader!less-loader'}
      {test: /\.woff((\?|\#)[\?\#\w\d_-]+)?$/, loader: "url", query: {limit: 100, minetype: 'application/font-woff', name: fontName}}
      {test: /\.woff2((\?|\#)[\?\#\w\d_-]+)?$/, loader: "url", query: {limit: 100, minetype: 'application/font-woff2', name: fontName}}
      {test: /\.ttf((\?|\#)[\?\#\w\d_-]+)?$/, loader: "url", query: {limit: 100, minetype: "application/octet-stream", name: fontName}}
      {test: /\.eot((\?|\#)[\?\#\w\d_-]+)?$/, loader: "url", query: {limit: 100, name: fontName}}
      {test: /\.svg((\?|\#)[\?\#\w\d_-]+)?$/, loader: "url", query: {limit: 10000, minetype: "image/svg+xml", name: fontName}}
    ]
  plugins: []
