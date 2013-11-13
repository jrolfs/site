define ->
  writes = []
  plugin =
    load: (name, req, load, config) ->
      shims = config.shim and Object.keys(config.shim)

      if config.isBuild
        fs = require.nodeRequire('fs');
        for shim in shims
          writes.push fs.readFileSync(req.toUrl(shim) + '.js', 'utf8')
        load()
      else if shims
        req shims, (value) ->
          load value

    write: (plugin, module, write) ->
      write writes.join(' ')