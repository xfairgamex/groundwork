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

    compass:
      groundwork:
        options:
          config: 'config.rb'
          trace: true

    coffee:
      individual:
        expand: true
        cwd: 'src/coffee'
        src: ['components/*.coffee', 'plugins/*.coffee']
        dest: 'js'
        ext: '.js'

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  grunt.registerTask 'default',           ['watch']
  grunt.registerTask 'build',             ['compass', 'coffee']
