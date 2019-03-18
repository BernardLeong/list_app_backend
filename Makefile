all:

port:
	rails s -p 3001
reset:
	rake db:drop db:create db:migrate db:seed
g/init:
	git init
	git add README.md
	git commit -m "first commit"
	git remote add origin https://github.com/BernardLeong/list_app_backend.git
	git push -u origin master

