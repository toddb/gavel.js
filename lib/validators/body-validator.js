// Generated by CoffeeScript 1.6.3
var BodyValidator, JsonValidator, SchemaGenerator, SchemaProperties, StringValidator, errors, _ref;

errors = require('../errors');

JsonValidator = require('./json-validator').JsonValidator;

StringValidator = require('./string-validator').StringValidator;

_ref = require('../utils/schema-generator'), SchemaGenerator = _ref.SchemaGenerator, SchemaProperties = _ref.SchemaProperties;

BodyValidator = BodyValidator = (function() {
  function BodyValidator(_arg) {
    var error, expected, outError, real, schema, validatorType;
    real = _arg.real, expected = _arg.expected, schema = _arg.schema;
    if (real === null || real === void 0) {
      real = "";
    }
    if (expected === null || expected === void 0) {
      expected = "";
    }
    if (typeof real !== 'string') {
      outError = new errors.MalformedDataError('Body validator: provided real data is not string');
      outError['data'] = real;
      throw outError;
    }
    if ((!schema) && typeof expected !== 'string') {
      outError = new errors.MalformedDataError('Body validator: provided expected data is not string');
      outError['data'] = expected;
      throw outError;
    }
    validatorType = 'json';
    if (schema) {
      try {
        if (typeof schema !== 'object') {
          try {
            this.schema = JSON.parse(schema);
          } catch (_error) {
            error = _error;
            throw new Error('Body: schema is not object or parseable JSON');
          }
        } else if (Object.keys(schema).length === 0) {
          this.schema = null;
        } else {
          this.schema = JSON.parse(JSON.stringify(schema));
        }
      } catch (_error) {
        error = _error;
        outError = new errors.SchemaNotJsonParsableError(error.message);
        outError['schema'] = schema;
        throw outError;
      }
    } else if (expected || expected === '') {
      try {
        this.expected = JSON.parse(expected);
        this.schema = this.getSchema(this.expected);
      } catch (_error) {
        error = _error;
        validatorType = 'string';
        this.expected = expected;
      }
    } else {
      throw new errors.NotEnoughDataError("expected data or json schema must be defined");
    }
    if (validatorType === 'json') {
      try {
        this.real = JSON.parse(real);
      } catch (_error) {
        error = _error;
        validatorType = 'string';
      }
    }
    if (validatorType === 'string') {
      this.expected = expected;
      this.real = real;
    }
    switch (validatorType) {
      case 'json':
        this.validator = new JsonValidator({
          data: this.real,
          schema: this.schema
        });
        break;
      default:
        this.validator = new StringValidator({
          string1: this.real,
          string2: this.expected
        });
    }
  }

  BodyValidator.prototype.validate = function() {
    return this.validator.validate();
  };

  BodyValidator.prototype.getSchema = function(data) {
    var properties, schemaGenerator;
    properties = new SchemaProperties({});
    properties.set({
      keysStrict: false,
      valuesStrict: false,
      typesStrict: false
    });
    schemaGenerator = new SchemaGenerator({
      json: data,
      properties: properties
    });
    return schemaGenerator.generate();
  };

  return BodyValidator;

})();

module.exports = {
  BodyValidator: BodyValidator
};