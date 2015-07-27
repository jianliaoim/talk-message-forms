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
    ]
  plugins: []
