# public-ontology-registry

This repository holds two small geographic ontologies, the data behind them, and the notebooks that build and use them. `ontologies/us_city/us_city.owl` describes U.S. states, counties, and cities (about 24,000 classes). `ontologies/canada_city/canada_city.owl` describes Canadian provinces and cities (about 1,700 classes). Both are OWL files in Turtle syntax under the `http://bast.ai/` namespace: each city is a class with a label, placed under its county or province. The source tables are in `data/` (`uscities.csv`, `canadacities.csv`), along with the intermediate entity files the notebooks generate from them (`us_states.json`, `canada_provinces.json`).

The `notebooks/` folder shows the two halves of the process. The "Pipelines Create" notebooks turn a source table into a hierarchy of entities and write it to an OWL file. The "Parsing Ontology" notebooks run free text against a finished ontology and list the entities it recognizes, for example a city and the state it belongs to. The notebooks call Bast's own Python packages (such as `bast-ai-build-owl` and `bast-ai-parse-owl`). Those packages are listed in `pyproject.toml` but are not published on PyPI, so the notebooks document the steps rather than run as-is outside Bast.

This is a small, public example of how Bast works. Bast grounds answers in ontologies built from approved knowledge, so a recognized term can be traced back to the class, the label, and the source row it came from, and a question the ontology does not support is refused rather than guessed. The ontologies here are general reference data, not customer knowledge. More about Bast: https://www.bast.ai

## License

MIT; see [LICENSE](LICENSE) (Copyright (c) 2024 Bast AI).
