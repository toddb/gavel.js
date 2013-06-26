{HitStructure} = require('../src/hit')

sampleJson = '''
{
  "simple_key_value_pair": "simple_key_value_pair_value",
  "complex_key_value_pair": {
    "complex_key_value_pair_key1" : "complex_key_value_pair_value1",
    "complex_key_value_pair_key2" : "complex_key_value_pair_value2",
    "complex_key_value_pair_key3" : {
      "complex_key_value_pair_key1_in_nested_hash": "complex_key_value_pair_value1_in_nested_hash",
      "complex_key_value_pair_key2_in_nested_hash": "complex_key_value_pair_value2_in_nested_hash"
      }
    },

  "array_of_hashes": [
    {
      "array_of_hashes_item1_key1": "array_of_hashes_item1_value1",
      "array_of_hashes_item1_key2": "array_of_hashes_item1_value2"
    },
    {
      "array_of_hashes_item2_key1": "array_of_hashes_item2_value1",
      "array_of_hashes_item2_key2": "array_of_hashes_item2_value2"
    }

  ],
  "array_of_mixed_simple_types": [1,2,"a","b"],
  "array_of_same_simple_types": ["a","b"]
}
'''

sampleJsonSimpleKeyMissing = '''
{
  "complex_key_value_pair": {
    "complex_key_value_pair_key1" : "complex_key_value_pair_value1",
    "complex_key_value_pair_key2" : "complex_key_value_pair_value2",
    "complex_key_value_pair_key3" : {
      "complex_key_value_pair_key1_in_nested_hash": "complex_key_value_pair_value1_in_nested_hash",
      "complex_key_value_pair_key2_in_nested_hash": "complex_key_value_pair_value2_in_nested_hash"
      }
    },

  "array_of_hashes": [
    {
      "array_of_hashes_item1_key1": "array_of_hashes_item1_value1",
      "array_of_hashes_item1_key2": "array_of_hashes_item1_value2"
    },
    {
      "array_of_hashes_item2_key1": "array_of_hashes_item2_value1",
      "array_of_hashes_item2_key2": "array_of_hashes_item2_value2"
    }

  ],
  "array_of_mixed_simple_types": [1,2,"a","b"],
  "array_of_same_simple_types": ["a","b"]
}
'''

sampleJsonSimpleKeyAdded = '''
{
  "simple_key_value_pair": "simple_key_value_pair_value",
  "simple_key_value_pair_added": "simple_key_value_pair_value",
  "complex_key_value_pair": {
    "complex_key_value_pair_key1" : "complex_key_value_pair_value1",
    "complex_key_value_pair_key2" : "complex_key_value_pair_value2",
    "complex_key_value_pair_key3" : {
      "complex_key_value_pair_key1_in_nested_hash": "complex_key_value_pair_value1_in_nested_hash",
      "complex_key_value_pair_key2_in_nested_hash": "complex_key_value_pair_value2_in_nested_hash"
      }
    },

  "array_of_hashes": [
    {
      "array_of_hashes_item1_key1": "array_of_hashes_item1_value1",
      "array_of_hashes_item1_key2": "array_of_hashes_item1_value2"
    },
    {
      "array_of_hashes_item2_key1": "array_of_hashes_item2_value1",
      "array_of_hashes_item2_key2": "array_of_hashes_item2_value2"
    }

  ],
  "array_of_mixed_simple_types": [1,2,"a","b"],
  "array_of_same_simple_types": ["a","b"]
}
'''

sampleJsonSimpleKeyValueDiffers = '''
{
  "simple_key_value_pair": "simple_key_value_pair_value_diff",
  "complex_key_value_pair": {
    "complex_key_value_pair_key1" : "complex_key_value_pair_value1",
    "complex_key_value_pair_key2" : "complex_key_value_pair_value2",
    "complex_key_value_pair_key3" : {
      "complex_key_value_pair_key1_in_nested_hash": "complex_key_value_pair_value1_in_nested_hash",
      "complex_key_value_pair_key2_in_nested_hash": "complex_key_value_pair_value2_in_nested_hash"
      }
    },

  "array_of_hashes": [
    {
      "array_of_hashes_item1_key1": "array_of_hashes_item1_value1",
      "array_of_hashes_item1_key2": "array_of_hashes_item1_value2"
    },
    {
      "array_of_hashes_item2_key1": "array_of_hashes_item2_value1",
      "array_of_hashes_item2_key2": "array_of_hashes_item2_value2"
    }

  ],
  "array_of_mixed_simple_types": [1,2,"a","b"],
  "array_of_same_simple_types": ["a","b"]
}
'''

sampleJsonComplexKeyMissing = '''
{
  "simple_key_value_pair": "simple_key_value_pair_value",
  "complex_key_value_pair": {
    "complex_key_value_pair_key1" : "complex_key_value_pair_value1",
    "complex_key_value_pair_key2" : "complex_key_value_pair_value2",
    "complex_key_value_pair_key3" : {
      "complex_key_value_pair_key2_in_nested_hash": "complex_key_value_pair_value2_in_nested_hash"
      }
    },

  "array_of_hashes": [
    {
      "array_of_hashes_item1_key1": "array_of_hashes_item1_value1",
      "array_of_hashes_item1_key2": "array_of_hashes_item1_value2"
    },
    {
      "array_of_hashes_item2_key1": "array_of_hashes_item2_value1",
      "array_of_hashes_item2_key2": "array_of_hashes_item2_value2"
    }

  ],
  "array_of_mixed_simple_types": [1,2,"a","b"],
  "array_of_same_simple_types": ["a","b"]
}
'''

sampleJsonComplexKeyAdded = '''
{
  "simple_key_value_pair": "simple_key_value_pair_value",
  "complex_key_value_pair": {
    "complex_key_value_pair_key1" : "complex_key_value_pair_value1",
    "complex_key_value_pair_key2" : "complex_key_value_pair_value2",
    "complex_key_value_pair_key3" : {
      "complex_key_value_pair_key1_in_nested_hash": "complex_key_value_pair_value1_in_nested_hash",
      "complex_key_value_pair_key1_in_nested_hash_added": "complex_key_value_pair_value1_in_nested_hash",
      "complex_key_value_pair_key2_in_nested_hash": "complex_key_value_pair_value2_in_nested_hash"
      }
    },

  "array_of_hashes": [
    {
      "array_of_hashes_item1_key1": "array_of_hashes_item1_value1",
      "array_of_hashes_item1_key2": "array_of_hashes_item1_value2"
    },
    {
      "array_of_hashes_item2_key1": "array_of_hashes_item2_value1",
      "array_of_hashes_item2_key2": "array_of_hashes_item2_value2"
    }

  ],
  "array_of_mixed_simple_types": [1,2,"a","b"],
  "array_of_same_simple_types": ["a","b"]
}
'''

sampleJsonComplexKeyValueDiffers = '''
{
  "simple_key_value_pair": "simple_key_value_pair_value",
  "complex_key_value_pair": {
    "complex_key_value_pair_key1" : "complex_key_value_pair_value1",
    "complex_key_value_pair_key2" : "complex_key_value_pair_value2",
    "complex_key_value_pair_key3" : {
      "complex_key_value_pair_key1_in_nested_hash": "complex_key_value_pair_value1_in_nested_hash_diff",
      "complex_key_value_pair_key2_in_nested_hash": "complex_key_value_pair_value2_in_nested_hash"
      }
    },

  "array_of_hashes": [
    {
      "array_of_hashes_item1_key1": "array_of_hashes_item1_value1",
      "array_of_hashes_item1_key2": "array_of_hashes_item1_value2"
    },
    {
      "array_of_hashes_item2_key1": "array_of_hashes_item2_value1",
      "array_of_hashes_item2_key2": "array_of_hashes_item2_value2"
    }

  ],
  "array_of_mixed_simple_types": [1,2,"a","b"],
  "array_of_same_simple_types": ["a","b"]
}
'''

sampleJsonArrayItemAdded = '''
{
  "simple_key_value_pair": "simple_key_value_pair_value",
  "complex_key_value_pair": {
    "complex_key_value_pair_key1" : "complex_key_value_pair_value1",
    "complex_key_value_pair_key2" : "complex_key_value_pair_value2",
    "complex_key_value_pair_key3" : {
      "complex_key_value_pair_key1_in_nested_hash": "complex_key_value_pair_value1_in_nested_hash",
      "complex_key_value_pair_key2_in_nested_hash": "complex_key_value_pair_value2_in_nested_hash"
      }
    },

  "array_of_hashes": [
    {
      "array_of_hashes_item1_key1": "array_of_hashes_item1_value1",
      "array_of_hashes_item1_key2": "array_of_hashes_item1_value2"
    },
    {
      "array_of_hashes_item2_key1": "array_of_hashes_item2_value1",
      "array_of_hashes_item2_key2": "array_of_hashes_item2_value2"
    }

  ],
  "array_of_mixed_simple_types": [1,2,"a","b", "added"],
  "array_of_same_simple_types": ["a","b"]
}
'''

sampleJsonArrayItemMissing = '''
{
  "simple_key_value_pair": "simple_key_value_pair_value",
  "complex_key_value_pair": {
    "complex_key_value_pair_key1" : "complex_key_value_pair_value1",
    "complex_key_value_pair_key2" : "complex_key_value_pair_value2",
    "complex_key_value_pair_key3" : {
      "complex_key_value_pair_key1_in_nested_hash": "complex_key_value_pair_value1_in_nested_hash",
      "complex_key_value_pair_key2_in_nested_hash": "complex_key_value_pair_value2_in_nested_hash"
      }
    },

  "array_of_hashes": [
    {
      "array_of_hashes_item1_key1": "array_of_hashes_item1_value1",
      "array_of_hashes_item1_key2": "array_of_hashes_item1_value2"
    },
    {
      "array_of_hashes_item2_key1": "array_of_hashes_item2_value1",
      "array_of_hashes_item2_key2": "array_of_hashes_item2_value2"
    }

  ],
  "array_of_mixed_simple_types": [1,2,"a"],
  "array_of_same_simple_types": ["a","b"]
}
'''

sampleJsonSchema = '''
{
    "$schema":"http://json-schema.org/draft-03/schema",
    "id":"#",
    "required":true,
    "additionalProperties":false,
    "type":"object",
    "properties":{
        "simple_key_value_pair":{
            "id":"simple_key_value_pair",
            "required":true,
            "enum":[
                "simple_key_value_pair_value"
            ],
            "type":"string"
        },
        "complex_key_value_pair":{
            "id":"complex_key_value_pair",
            "required":true,
            "additionalProperties":false,
            "type":"object",
            "properties":{
                "complex_key_value_pair_key1":{
                    "id":"complex_key_value_pair_key1",
                    "required":true,
                    "enum":[
                        "complex_key_value_pair_value1"
                    ],
                    "type":"string"
                },
                "complex_key_value_pair_key2":{
                    "id":"complex_key_value_pair_key2",
                    "required":true,
                    "enum":[
                        "complex_key_value_pair_value2"
                    ],
                    "type":"string"
                },
                "complex_key_value_pair_key3":{
                    "id":"complex_key_value_pair_key3",
                    "required":true,
                    "additionalProperties":false,
                    "type":"object",
                    "properties":{
                        "complex_key_value_pair_key1_in_nested_hash":{
                            "id":"complex_key_value_pair_key1_in_nested_hash",
                            "required":true,
                            "enum":[
                                "complex_key_value_pair_value1_in_nested_hash"
                            ],
                            "type":"string"
                        },
                        "complex_key_value_pair_key2_in_nested_hash":{
                            "id":"complex_key_value_pair_key2_in_nested_hash",
                            "required":true,
                            "enum":[
                                "complex_key_value_pair_value2_in_nested_hash"
                            ],
                            "type":"string"
                        }
                    }
                }
            }
        },
        "array_of_hashes":{
            "id":"array_of_hashes",
            "required":true,
            "additionalItems":false,
            "type":"array",
            "items":[
                {
                    "id":0,
                    "required":true,
                    "additionalProperties":false,
                    "type":"object",
                    "properties":{
                        "array_of_hashes_item1_key1":{
                            "id":"array_of_hashes_item1_key1",
                            "required":true,
                            "enum":[
                                "array_of_hashes_item1_value1"
                            ],
                            "type":"string"
                        },
                        "array_of_hashes_item1_key2":{
                            "id":"array_of_hashes_item1_key2",
                            "required":true,
                            "enum":[
                                "array_of_hashes_item1_value2"
                            ],
                            "type":"string"
                        }
                    }
                },
                {
                    "id":1,
                    "required":true,
                    "additionalProperties":false,
                    "type":"object",
                    "properties":{
                        "array_of_hashes_item2_key1":{
                            "id":"array_of_hashes_item2_key1",
                            "required":true,
                            "enum":[
                                "array_of_hashes_item2_value1"
                            ],
                            "type":"string"
                        },
                        "array_of_hashes_item2_key2":{
                            "id":"array_of_hashes_item2_key2",
                            "required":true,
                            "enum":[
                                "array_of_hashes_item2_value2"
                            ],
                            "type":"string"
                        }
                    }
                }
            ]
        },
        "array_of_mixed_simple_types":{
            "id":"array_of_mixed_simple_types",
            "required":true,
            "additionalItems":false,
            "type":"array",
            "items":[
                {
                    "id":0,
                    "required":true,
                    "enum":[
                        1
                    ],
                    "type":"integer"
                },
                {
                    "id":1,
                    "required":true,
                    "enum":[
                        2
                    ],
                    "type":"integer"
                },
                {
                    "id":2,
                    "required":true,
                    "enum":[
                        "a"
                    ],
                    "type":"string"
                },
                {
                    "id":3,
                    "required":true,
                    "enum":[
                        "b"
                    ],
                    "type":"string"
                }
            ]
        },
        "array_of_same_simple_types":{
            "id":"array_of_same_simple_types",
            "required":true,
            "additionalItems":false,
            "type":"array",
            "items":[
                {
                    "id":0,
                    "required":true,
                    "enum":[
                        "a"
                    ],
                    "type":"string"
                },
                {
                    "id":1,
                    "required":true,
                    "enum":[
                        "b"
                    ],
                    "type":"string"
                }
            ]
        }
    }

}
'''

sampleJsonSchemaNonStrict = '''
{
    "$schema":"http://json-schema.org/draft-03/schema",
    "id":"#",
    "required":true,
    "additionalProperties":true,
    "type":"object",
    "properties":{
        "simple_key_value_pair":{
            "id":"simple_key_value_pair",
            "required":true
        },
        "complex_key_value_pair":{
            "id":"complex_key_value_pair",
            "required":true,
            "additionalProperties":true,
            "type":"object",
            "properties":{
                "complex_key_value_pair_key1":{
                    "id":"complex_key_value_pair_key1",
                    "required":true
                },
                "complex_key_value_pair_key2":{
                    "id":"complex_key_value_pair_key2",
                    "required":true
                },
                "complex_key_value_pair_key3":{
                    "id":"complex_key_value_pair_key3",
                    "required":true,
                    "additionalProperties":true,
                    "type":"object",
                    "properties":{
                        "complex_key_value_pair_key1_in_nested_hash":{
                            "id":"complex_key_value_pair_key1_in_nested_hash",
                            "required":true
                        },
                        "complex_key_value_pair_key2_in_nested_hash":{
                            "id":"complex_key_value_pair_key2_in_nested_hash",
                            "required":true
                        }
                    }
                }
            }
        },
        "array_of_hashes":{
            "id":"array_of_hashes",
            "required":true,
            "additionalItems":true,
            "type":"array",
            "items":[
                {
                    "id":0,
                    "required":true,
                    "additionalProperties":true,
                    "type":"object",
                    "properties":{
                        "array_of_hashes_item1_key1":{
                            "id":"array_of_hashes_item1_key1",
                            "required":true
                        },
                        "array_of_hashes_item1_key2":{
                            "id":"array_of_hashes_item1_key2",
                            "required":true
                        }
                    }
                },
                {
                    "id":1,
                    "required":true,
                    "additionalProperties":true,
                    "type":"object",
                    "properties":{
                        "array_of_hashes_item2_key1":{
                            "id":"array_of_hashes_item2_key1",
                            "required":true
                        },
                        "array_of_hashes_item2_key2":{
                            "id":"array_of_hashes_item2_key2",
                            "required":true
                        }
                    }
                }
            ]
        },
        "array_of_mixed_simple_types":{
            "id":"array_of_mixed_simple_types",
            "required":true,
            "additionalItems":true,
            "type":"array",
            "items":[
                {
                    "id":0,
                    "required":true
                },
                {
                    "id":1,
                    "required":true
                },
                {
                    "id":2,
                    "required":true
                },
                {
                    "id":3,
                    "required":true
                }
            ]
        },
        "array_of_same_simple_types":{
            "id":"array_of_same_simple_types",
            "required":true,
            "additionalItems":true,
            "type":"array",
            "items":[
                {
                    "id":0,
                    "required":true
                },
                {
                    "id":1,
                    "required":true
                }
            ]
        }
    }
}
'''

sampleJsonSchemaNonStrictCustom = '''
{
    "$schema":"http://json-schema.org/draft-03/schema",
    "id":"#",
    "required":true,
    "additionalProperties":true,
    "type":"object",
    "properties":{
        "simple_key_value_pair_custom":{
            "id":"simple_key_value_pair",
            "required":true
        }
    }
}
'''

sampleText =  """
"Lorem ipsum dolor sit amet,
consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam, quis nostrud
exercitation ullamco laboris nisi ut aliquip
ex ea commodo consequat. Duis aute irure dolor
in reprehenderit in voluptate velit esse cillum
"""

sampleTextLineDiffers =  """
"Lorem ipsum dolor sit amet,
consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. DIFF DIFF
Ut enim ad minim veniam, quis nostrud
exercitation ullamco laboris nisi ut aliquip
ex ea commodo consequat. Duis aute irure dolor
in reprehenderit in voluptate velit esse cillum
"""

sampleTextLineAdded =  """
"Lorem ipsum dolor sit amet,
consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.
tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam, quis nostrud
exercitation ullamco laboris nisi ut aliquip
ex ea commodo consequat. Duis aute irure dolor
in reprehenderit in voluptate velit esse cillum
"""

sampleTextLineMissing =  """
"Lorem ipsum dolor sit amet,
tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam, quis nostrud
exercitation ullamco laboris nisi ut aliquip
ex ea commodo consequat. Duis aute irure dolor
in reprehenderit in voluptate velit esse cillum
"""

sampleAmandaError = """
{
"0":{
  "property":[
    "complex_key_value_pair",
    "complex_key_value_pair_key3",
    "complex_key_value_pair_key1_in_nested_hash"
  ],
  "attributeName":"required",
  "attributeValue":true,
  "message":"The ‘complex_key_value_pair,complex_key_value_pair_key3,complex_key_value_pair_key1_in_nested_hash’ property is required.",
  "validator":"required",
  "validatorName":"required",
  "validatorValue":true
  },
  "1":{
  "property":[
    "complex_key_value_pair2",
    "complex_key_value_pair_key3",
    "complex_key_value_pair_key1_in_nested_hash"
  ],
  "attributeName":"required",
  "attributeValue":true,
  "message":"The ‘complex_key_value_pair2,complex_key_value_pair_key3,complex_key_value_pair_key1_in_nested_hash’ property is required.",
  "validator":"required",
  "validatorName":"required",
  "validatorValue":true
  },
  "length":2,
"errorMessages":{
}

}
                    """

sampleHeaders = {
"Content-Type": "application/json",
"header2": "header2_value"
}

sampleHeadersDiff = {
"Content-Type": "application/json",
"header2": "header2_value_changed"
}

sampleHeadersMiss = {
"Content-Type": "application/json",
}

sampleHeadersAdd = {
"Content-Type": "application/json",
"header2": "header2_value",
"header_added": "header_added_value",
}



module.exports =
  sampleJson                       : sampleJson
  sampleJsonSchema                 : sampleJsonSchema
  sampleJsonSchemaNonStrict        : sampleJsonSchemaNonStrict
  sampleJsonSchemaNonStrictCustom  : sampleJsonSchemaNonStrictCustom
  sampleJsonSimpleKeyMissing       : sampleJsonSimpleKeyMissing
  sampleJsonSimpleKeyAdded         : sampleJsonSimpleKeyAdded
  sampleJsonSimpleKeyValueDiffers  : sampleJsonSimpleKeyValueDiffers
  sampleJsonComplexKeyMissing      : sampleJsonComplexKeyMissing
  sampleJsonComplexKeyAdded        : sampleJsonComplexKeyAdded
  sampleJsonComplexKeyValueDiffers : sampleJsonComplexKeyValueDiffers
  sampleJsonArrayItemAdded         : sampleJsonArrayItemAdded
  sampleJsonArrayItemMissing       : sampleJsonArrayItemMissing
  sampleText                       : sampleText
  sampleTextLineAdded              : sampleTextLineAdded
  sampleTextLineMissing            : sampleTextLineMissing
  sampleTextLineDiffers            : sampleTextLineDiffers
  sampleHeaders                    : sampleHeaders
  sampleHeadersDiffers             : sampleHeadersDiff
  sampleHeadersMissing             : sampleHeadersMiss
  sampleHeadersAdded               : sampleHeadersAdd
  sampleAmandaError                : sampleAmandaError
  HitStructure                     : HitStructure




