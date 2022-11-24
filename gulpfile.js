
const babel = require('gulp-babel');
const { parallel, watch, src, dest } = require('gulp');
const uglify = require('gulp-uglify');
const sourcemaps = require('gulp-sourcemaps');
const mode = require('gulp-mode')({
    modes: ["production", "development"],
    default: "development",
    verbose: false
});

function transpileJS() {
    return src('client/src/javascript/**/*.js')
        .pipe(mode.development(sourcemaps.init()))
        .pipe(babel({
            presets: [
                '@babel/preset-env'
            ]
        }))
        .pipe(mode.production(uglify()))
        .pipe(mode.development(sourcemaps.write('../../dist/javascript/maps')))
        .pipe(dest('client/dist/javascript'))
}

function watchfiles() {
    watch('client/src/javascript/**/*.js', {queue: false}, transpileJS);
}

exports.default = parallel(transpileJS);
exports.watch = watchfiles;
