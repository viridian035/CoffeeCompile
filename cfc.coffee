{ FCHK, FIN, FOUT, EXEC } = require 'coffee-standards'

filename = process.argv[2]
rawname = filename.replace /\.coffee$/, ''

unless FCHK filename
	throw 'file not found'

EXEC "coffee -c #{rawname}.coffee"

code = FIN "#{rawname}.js"
newCode =
	"""
	#!/usr/bin/env node
	
	#{code}
	"""
FOUT "#{rawname}.js", newCode
