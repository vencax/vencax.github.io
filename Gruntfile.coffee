module.exports = (grunt) ->

  # load all grunt tasks
  require("matchdep").filterDev("grunt-*").forEach grunt.loadNpmTasks

  grunt.initConfig
    watch:
      scripts:
        files: 'css/*.less'
        options: { nospawn: true }
        tasks: ["less", "watch"]

    bower:
      install:
        options:
          verbose: true

    less:
      development:
        options:
          paths: ["bower_components/bootstrap/less"]
        files:
          "site.css": [ "css/main.less" ]
      release:
        options:
          paths: ["bower_components/bootstrap/less"]
          compress: true
        files:
          "site.css": [ "css/main.less" ]

    coffeelint:
      app: ["{,*/}*.coffee"]


  grunt.registerTask "run", ["watch"]
  grunt.registerTask "default", ["less:release"]
