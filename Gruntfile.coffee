module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    watch:
      compass:
        files: '**/*.scss'
        tasks: ['compass:groundwork']

    compass:
      groundwork:
        options:
          config: 'config.rb'
          trace: true

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-compass'

  grunt.registerTask 'default',           ['watch']
  grunt.registerTask 'build',             ['compass']
