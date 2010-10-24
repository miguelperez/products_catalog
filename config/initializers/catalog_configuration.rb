#base configurations for the catalog
require 'yaml'
CATALOG_CONFS = YAML.load_file(File.join(RAILS_ROOT, 'config', 'catalog_configuration.yml'))

default_validations = {
  "product" => {
    "update" => {
      "not_visible_if_price_lower_than_zero" => "true",
    }
  },
}

user_validations = CATALOG_CONFS.delete("validations") || {}

VALIDATIONS = default_validations.merge(user_validations)