module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    coffee:
      individual:
        expand: true
        cwd: 'src/coffee'
        src: ['components/*.coffee', 'plugins/*.coffee']
        dest: 'js'
        ext: '.js'
      concatenated:
        options:
          join: true
        files:
          "js/groundwork.all.js": ["src/coffee/components/*.coffee", "src/coffee/plugins/*.coffee"]

    jade:
      pages:
        files:
          'templates/home.html': ['src/jade/home.jade']
          'templates/kitchen-sink.html': ['src/jade/kitchen-sink.jade']
          'templates/layout-1.html': ['src/jade/layout-1.jade']
          'templates/layout-2.html': ['src/jade/layout-2.jade']
          'templates/layout-3.html': ['src/jade/layout-3.jade']
          'templates/layout-4.html': ['src/jade/layout-4.jade']
          'templates/layout-5.html': ['src/jade/layout-5.jade']

    compass:
      dev:
        options:
          config: 'config.rb'

    watch:
      js:
        files: '**/*.coffee'
        tasks: ['coffee']
      html:
        files: '**/*.jade'
        tasks: ['jade']

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-compass'

  grunt.registerTask 'default',       ['coffee', 'jade', 'compass'];
  grunt.registerTask 'compile-js',    ['coffee'];
  grunt.registerTask 'compile-css',   ['compass'];
  grunt.registerTask 'compile-html',  ['jade'];
