#!/usr/bin/env bash

#trash -r afternoon-plains-30190/; wait
git add .; wait
git commit -m "x"; wait
heroku git:clone -a afternoon-plains-30190; wait
cd afternoon-plains-30190; wait
git add .; wait
git commit -m "x"; wait
git push heroku master
