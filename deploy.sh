#!/bin/bash

# force update
git fetch origin && git reset --hard origin/master \
  && npm install && npm run sass \
  && hugo
