{ FCHK, FIN, FOUT, EXEC } = require 'coffee-standards'

filenames = process.argv[2..]

for filename in filenames
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
