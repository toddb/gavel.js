MalformedDataError = class MalformedDataError extends Error

DataNotJsonParsableError = class DataNotJsonParsableError extends MalformedDataError

DataNotStringError = class DataNotStringError extends MalformedDataError

MalformedSchemaError = class MalformedSchemaError extends Error

SchemaNotJsonParsableError = class DataNotJsonParcableError extends MalformedSchemaError

UnknownValidatorError = class UnknownValidatorError extends Error

module.exports = {
  DataNotJsonParsableError,
  SchemaNotJsonParsableError,
  MalformedSchemaError,
  MalformedDataError,
  UnknownValidatorError,
  DataNotStringError,

}