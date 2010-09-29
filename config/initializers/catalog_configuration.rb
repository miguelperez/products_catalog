#base configurations for the catalog
require 'yaml'
CATALOG_CONFS = YAML.load_file(File.join(RAILS_ROOT, 'config', 'catalog_configuration.yml'))