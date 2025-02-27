# ----------------------------------------------------------------
# public-ontology-registry
# ----------------------------------------------------------------

ifeq ($(OS),Windows_NT)
    os_shell := powershell
	remove_lib := resources/scripts/poetry_remove_lib.ps1
	download_en_core_web_sm := .\resources\scripts\download-en_core_web_sm.ps1
else
    os_shell := $(SHELL)
	remove_lib := resources/scripts/poetry_remove_lib.sh
	download_en_core_web_sm := ./resources/scripts/download-en_core_web_sm.sh
endif

models:
	$(os_shell) $(download_en_core_web_sm)

install:
	@echo Installing
	make models
	poetry lock
	# poetry check
	poetry update
	poetry install --no-cache 
	
activate:
	@echo Activating Microservice
	poetry run dvc config core.autostage true

test:
	echo Unit Testing Microservice
	poetry run pytest --disable-pytest-warnings

freeze:
	@echo Freezing Requirements
	poetry run pip freeze > requirements.txt
	poetry run python -m pip install --upgrade pip

all:
	make install
	make freeze

jupyter:
	poetry run python -m ipykernel install --name ontology-registry
	poetry run jupyter lab

clear_cache:
	poetry cache clear --all bast-ai 
