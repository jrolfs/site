require 'shelljs/global'

matchdep =  require 'matchdep'


module.exports = (grunt) ->

  #
  # -------------------- Init --------------------
  #

  siteConfig =
    source: 'app'



  #
  # -------------------- Config --------------------
  #

  @initConfig

    pkg: @file.readJSON 'package.json'
    site: siteConfig


    # Clean

    clean:

      build: ['build/*']
      release: ['release/*']
      tmp: ['.tmp/']


    # Copy

    copy:

      build:
        files: [{
          expand: true
          cwd: 'bower_components/'
          src: '**/*.js'
          dest: 'build/js/vendor/'
        }, {
          expand: true
          cwd: 'app/'
          src: '**/*.coffee'
          dest: 'build/app/'
        }]

      release:
        files: [{
          expand: true
          cwd: 'bower_components/'
          src: '**/*.js'
          dest: '.tmp/js/vendor/'
        }]


    # Less

    less:

      build:
        src: '<%= site.source %>/less/app.less'
        dest: 'build/css/app.css'

      release:
        options:
          yuicompress: true
        src: '<%= site.source %>/less/app.less'
        dest: 'release/css/jamie.css'


    # Handlebars

    handlebars:

      build:
        options:
          amd: true
          namespace: false
        files: [{
          expand: true
          cwd: 'app/templates/'
          src: '**/*.handlebars'
          dest: 'build/templates/'
          ext: '.handlebars.js'
        }]

      release:
        options:
          amd: true
          namespace: false
        files: [{
          expand: true
          cwd: 'app/templates/'
          src: '**/*.handlebars'
          dest: '.tmp/templates'
          ext: '.handlebars.js'
        }]



    # Coffee

    coffee:

      build:
        options:
          sourceMap: !@option 'nomaps'
        files: [{
          expand: true
          cwd: '<%= site.source %>/coffee/'
          src: '**/*.coffee'
          dest: 'build/js/'
          ext: '.js'
        }]

      release:
        files: [{
          expand: true
          cwd: '<%= site.source %>/coffee/'
          src: '**/*.coffee'
          dest: '.tmp/js/'
          ext: '.js'
        }]


    # RequireJS

    requirejs:

      release:
        options:
          baseUrl: '.tmp/js'
          mainConfigFile: 'build/js/main.js'
          name: '../../node_modules/almond/almond'
          include: 'main'
          out: 'release/js/jamie.js'
          findNestedDependencies: true
          optimize: if @option 'uncompressed' then 'none' else 'uglify2'


    # Replace

    replace:

      build:
        options:
          prefix: '@'
          variables:
            'version': '<%= pkg.version %>'
        src: '<%= site.source %>/dev.html'
        dest: 'build/index.html'

      release:
        options:
          prefix: '@'
          variables:
            'version': '<%= pkg.version %>'
            'hash': do ->
              try
                hash = exec('git rev-parse --short --verify HEAD', { silent: true }).output
              catch error
                @log.error error
                @fatal 'Could not retrieve Git SHA hash blob'
        src: '<%= site.source %>/index.html'
        dest: 'release/index.html'


    # Connect

    connect:
      development:
        options:
          port: 8000
          hostname: '*'
          base: if @option 'release' then 'release' else 'build'
          keepalive: true
          livereload: !@option 'release'
          # middleware: (connect, options) -> [
          #   require('grunt-connect-pushstate/lib/utils').pushState
          #   connect.static options.base
          # ]



    # Watch

    watch:

      components:
        files: 'bower_components/**/*.js'
        tasks: ['copy:build']

      less:
        files: '<%= site.source %>/less/**/*.less'
        tasks: ['less:build']

      coffee:
        files: '<%= site.source %>/coffee/**/*.coffee'
        tasks: ['coffee:build', 'copy:build']

      handlebars:
        files: '<%= site.source %>/templates/**/*.handlebars'
        tasks: ['handlebars:build']

      index:
        files: '<%= site.source %>/dev.html'
        tasks: ['replace:build']

      livereload:
        files: ['build/css/*.css']
        options:
          livereload: true



  #
  # -------------------- Tasks --------------------
  #

  # Plugins

  @loadNpmTasks dep for dep in matchdep.filterDev('grunt-*')


  # Tasks

  @registerTask 'default', ['build']

  @registerTask 'build', (target = 'build') ->

    list = [
      'clean:' + target
      'copy:' + target
      'less:' + target
      'coffee:' + target
      'handlebars:' + target
      'replace:' + target
    ]

    list.push 'info:build' unless target is 'release'

    grunt.task.run list


  @registerTask 'release', ['build:release', 'requirejs', 'clean:tmp', 'info:release']


  # Custom

  @registerTask 'info', (target = 'release') ->

    grunt.log.subhead 'Build Info:'
    grunt.log.oklns exec('du -h -d 3 ' + target, { silent: true }).output.replace(new RegExp(target + '\/', 'g'), '')


