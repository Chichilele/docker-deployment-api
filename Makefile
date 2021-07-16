debug:
	@docker-compose \
		-p docker-deployment-api_debug \
		-f docker-compose.debug.yml \
		up

debug_down:
	@docker-compose \
		-p docker-deployment-api_debug \
		-f docker-compose.debug.yml \
		down

build_debug:
	@docker-compose \
		-p docker-deployment-api_debug \
		-f docker-compose.debug.yml \
		build

logs_debug:
	@docker-compose \
		-p docker-deployment-api_debug \
		-f docker-compose.debug.yml \
		logs -f

prod:
	@docker-compose \
		-p docker-deployment-api_prod \
		-f docker-compose.yml \
		up

prod_down:
	@docker-compose \
		-p docker-deployment-api_prod \
		-f docker-compose.yml \
		down

build_prod:
	@docker-compose \
		-p docker-deployment-api_prod \
		-f docker-compose.yml \
		build

logs_prod:
	@docker-compose \
		-p docker-deployment-api_prod \
		-f docker-compose.yml \
		logs -f