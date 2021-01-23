.PHONY: docker

all: * docker
	#442333:b3dbf35570244a3ebfe45b5665c10a28
	#sudo docker run -v `pwd`:/srv/jekyll -it wsmoses/personal-site jekyll build

github: all docker
	sudo docker pull wsmoses/jekyll:latest
	sudo docker run -v `pwd`:/github/workspace wsmoses/jekyll:latest tmp

live: docker
	sudo docker pull wsmoses/jekyll:latest
	sudo docker run -p 4000:4000 -v `pwd`:/github/workspace -it --entrypoint /live.sh wsmoses/jekyll:latest
	#sudo docker run -p 4000:4000 -v `pwd`:/srv/jekyll -it wsmoses/personal-site jekyll serve --watch
