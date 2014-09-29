#jshint node:true
module.exports = (grunt) ->
  "use strict"

  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    jade: {
      dev: {
        options: {
          pretty: true
        },
        files: {
          'dist/loadingCircleWithMessage.html': 'src/loadingCircleWithMessage.jade'
          'example/index.html': 'src/example/index.jade'
        }
      },
    }
    coffee: {
      dev: {
        options: {
          bare: false
        },
        files: {
          'dist/loadingCircleWithMessage.js': 'temp/loadingCircleWithMessage.coffee'
          'example/main.js': 'src/example/main.coffee'
        }
      }
    }

    clean:
      dist: "dist/*"
      example: "example/dist/*"


    copy:
      build:
        files: [
          expand: true
          cwd: "src/"
          src: "*.css"
          dest: "dist/"
          filter: "isFile"
        ]
      example:
        files: [
          {
            expand: true
            cwd: "dist/"
            src: "**/*"
            dest: "example/dist/"
            filter: "isFile"
          }
          {
            expand: true
            cwd: "bower_components/"
            src: "**/*"
            dest: "example/lib/"
            filter: "isFile"
          }
        ]

    watch:
      livereload:
        options:
          livereload: true

        files: [
          "src/**/*.{coffee,jade,css}"
        ]
        tasks: [
          "build"
        ]

    connect: {
      example: {
        options: {
          port: 9000,
          base: ['example'],
          livereload: true,
          open: 'http://localhost:9000/index.html'
        }
      }
    }


    "string-replace":
      dev:
        files:
          'temp/loadingCircleWithMessage.coffee': 'src/loadingCircleWithMessage.coffee'

        options:
          replacements: [
            {
              pattern: "{html}",
              replacement: (match, p1, offset, string) ->
                return grunt.file.read('dist/loadingCircleWithMessage.html');
            }
          ]




  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)
  # Register tasks
  grunt.registerTask "server", [
    "clean"
    "build"
    "connect"
    "watch"
  ]
  
  grunt.registerTask "build", [
    "clean"
    "jade"
    "string-replace"
    "coffee"
    "copy:build"
    "copy:example"
  ]

  grunt.registerTask "default", [
    "clean"
    "build"
  ]
  return
