execSync =  require 'execSync'
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


        # Copy

        copy:

            build:
                files: [
                    { expand: true, cwd: 'components/', src: '**/*.js', dest: 'build/js/libs/' }
                ]


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
                                hash = execSync.stdout 'git rev-parse --short --verify HEAD'
                            catch error
                                @log.error error
                                @fatal 'Could not retrieve Git SHA hash blob'
                src: '<%= site.source %>/index.html'
                dest: 'release/index.html'



    #
    # -------------------- Tasks --------------------
    #

    # Plugins

    @loadNpmTasks dep for dep in matchdep.filterDev('grunt-*')

    # Custom

    @registerTask 'coffee', 'Compile CoffeeScript withs source maps', ->
        execSync.stdout "coffee -o build/js/ -cmb #{grunt.config('site').source}/coffee/"
