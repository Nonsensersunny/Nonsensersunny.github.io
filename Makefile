dev:
	@npm run dev

build:
	@npm run build

deploy: build
	@docker build . -t avalee
	@docker run -d --name avalee -p 8080:80 avalee

clear:
	@rm -rf ./dist
	@docker kill avalee
	@docker rm avalee
	@docker image rm avalee
