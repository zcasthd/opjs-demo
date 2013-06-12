
install:
	@cd server; npm install

run:
	@cd server; npm start

test:
	@$(MAKE) ensure-grunt
	@cd client; npm test

dist:
	@$(MAKE) ensure-grunt
	@cd client; grunt dist

deploy:
#	@$(MAKE) dist
	@dotcloud push

ensure-grunt:
	if ! hash grunt 2>/dev/null; then npm install -g grunt-cli; fi
	@if [ -d "client/node_modules/grunt" ]; then cd client ; npm install; fi

.PHONY: install run test dist deploy ensure-grunt