module.exports = function(grunt) {
  'use strict';
  grunt.initConfig({

    pkg: grunt.file.readJSON('package.json'),

    watch: {
      svgs: {
        files: 'icons/*.svg',
        tasks: ['svg']
      }
    },
    svgstore: {
      options: {
        prefix: 'icon-',
        cleanup: true,
        includedemo: false,
         // Set includedemo to true to generate demo file for the svg sprite in the /dest directory
        svg: {
          id: 'svg-defs',
          class: 'svg-hide',
          style: 'width: 0px !important; height: 0px !important; position: absolute !important; top: 0px !important;',
          xmlns: 'http://www.w3.org/2000/svg'
        }
      },
      build: {
        files: {
          'dest/svg-defs.svg': ['icons/*.svg']
        }
      }
    }

  });

  grunt.loadNpmTasks('grunt-svgstore');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.registerTask('svg', ['svgstore']);
  grunt.registerTask('default', ['svgstore']);


};
