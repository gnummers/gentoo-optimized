#!/usr/bin/env python
import portage
import os
import sys
manifest_dir = sys.argv[1]
os.environ['PORTDIR'] = os.path.dirname(os.path.dirname(manifest_dir))
settings = portage.config(clone=portage.settings)
for directory in sys.argv[1:]:
	settings['O'] = directory
	if not portage.digestcheck([], settings, strict=True):
		sys.exit(1)
sys.exit(0)
