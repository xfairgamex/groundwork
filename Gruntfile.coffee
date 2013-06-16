module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    watch:
      coffee:
        files: '**/*.coffee'
        tasks: ['coffee']
      compass:
        files: '**/*.scss'
        tasks: ['compass:groundwork']
      jade:
        files: '**/*.jade'
        tasks: ['jade:groundwork']

    compass:
      groundwork:
        options:
          config: 'config.rb'
          trace: true
      tests:
        options:
          config: 'tests/config.rb'

    coffee:
      individual:
        expand: true
        cwd: 'src/coffee'
        src: ['components/*.coffee', 'plugins/*.coffee']
        dest: 'js'
        ext: '.js'

    jade:
      tests:
        files:
          'tests/test-grid.html':         ['tests/src/jade/test-grid.jade']

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jade'

  grunt.registerTask 'default',           ['watch']
  grunt.registerTask 'build',             ['compass:groundwork', 'coffee']
  grunt.registerTask 'tests',             ['compass:tests', 'jade:tests']
