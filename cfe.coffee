{ DEL, EXEC, FCHK, WRITE } = require 'coffee-standards'
SPAWN = require('child_process').spawn

filename = process.argv[2]
rawname = filename.replace /\.coffee$/, ''

unless FCHK filename
	throw 'file not found'

EXEC "coffee -c #{rawname}.coffee"

cp = SPAWN 'node', ["#{rawname}.js"]
HOPT = (data) ->
	WRITE do data.toString
HEND = () ->
	DEL "#{rawname}.js"

cp.stdout.on 'data', HOPT
cp.stderr.on 'data', HOPT
cp.on 'exit', HEND
