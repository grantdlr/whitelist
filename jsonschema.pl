import os
import json
from jsonschema import Draft4Validator, RefResolver 

path_to_schema = './whitelist.schema.json'
with open(path_to_schema, 'r') as fr:
  schema = json.load(fr)

path_to_json = './whitelist.json'
with open(path_to_json, 'r') as fp:
  jsonfile = json.load(fp)

resolver = RefResolver('file://'+ path_to_schema, schema)

Draft4Validator.check_schema(schema)
validator = Draft4Validator(schema, resolver=resolver, format_checker=None)

validator.validate(jsonfile)

