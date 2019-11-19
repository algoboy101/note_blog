#!/bin/bash
rm db.json
hexo clean
hexo g
hexo s -p 8080
