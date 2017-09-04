#!/usr/bin/env python

import os

#templates_path = os.path.abspath(os.path.dirname(__file__) + '//..//templates')

for extension in [ 'html', 'js', 'scss' ]:
    with open(templates_path + "/@@@template@@@." + extension) as f:
        content = f.read()
        outfile = open(output_path + "/" +  template_name + "." + extension, 'w+')
        outfile.write(content.replace('@@@template@@@', template_name))
        f.close()
        outfile.close()


