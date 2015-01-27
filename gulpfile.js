'use strict'

var gulp        = require('gulp')
  , purescript  = require('gulp-purescript')
  , run         = require('gulp-run')
  , runSequence = require('run-sequence')
  ;

var paths = {
    src: 'src/**/*.purs',
    bowerSrc: [
      'bower_components/purescript-*/src/**/*.purs',
      'bower_components/purescript-*/src/**/*.purs.hs'
    ],
    dest: '',
    docs: {
        'Data.Argonaut': {
            dest: 'src/Data/README.md',
            src: 'src/Data/Argonaut.purs'
        },
        'Data.Argonaut.*': {
            dest: 'src/Data/Argonaut/README.md',
            src: 'src/Data/Argonaut/**/*.purs'
        }
    },
    test: 'test/**/*.purs'
};

var options = {
    test: {
        main: 'Test.Data.Argonaut',
        output: 'test/test.js'
    }
};

function compile (compiler, src, opts) {
    var psc = compiler(opts);
    psc.on('error', function(e) {
        console.error(e.message);
        psc.end();
    });
    return gulp.src(src.concat(paths.bowerSrc))
        .pipe(psc)
        .pipe(gulp.dest(paths.dest));
};

function docs (target) {
    return function() {
        var pscDocs = purescript.pscDocs();
        pscDocs.on('error', function(e) {
            console.error(e.message);
            pscDocs.end();
        });
        return gulp.src(paths.docs[target].src)
            .pipe(pscDocs)
            .pipe(gulp.dest(paths.docs[target].dest));
    }
}

function sequence () {
    var args = [].slice.apply(arguments);
    return function() {
        runSequence.apply(null, args);
    }
}

gulp.task('browser', function() {
    return compile(purescript.psc, [paths.src].concat(paths.bowerSrc), {})
});

gulp.task('make', function() {
    return compile(purescript.pscMake, [paths.src].concat(paths.bowerSrc), {})
});

gulp.task('test', function() {
    return compile(purescript.psc, [paths.src, paths.test].concat(paths.bowerSrc), options.test)
        .pipe(run('node').exec());
});

gulp.task('docs-Data.Argonaut', docs('Data.Argonaut'));
gulp.task('docs-Data.Argonaut.*', docs('Data.Argonaut.*'));

gulp.task('docs', ['docs-Data.Argonaut', 'docs-Data.Argonaut.*']);

gulp.task('watch-browser', function() {
    gulp.watch(paths.src, sequence('browser', 'docs'));
});

gulp.task('watch-make', function() {
    gulp.watch(paths.src, sequence('make', 'docs'));
});

gulp.task('default', sequence('make', 'docs', 'test'));
