#!/bin/bash

ssh ubuntu@blog.cirias.li /bin/bash << EOF
  cd github.com/cirias/blog
  git pull
  hugo
EOF
