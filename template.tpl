___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Arugula",
  "categories": ["PERSONALIZATION", "UTILITY"],
  "brand": {
    "id": "brand_dummy",
    "displayName": "Arugula"
  },
  "description": "Shows offers that fit what visitors search for on your site, beside your search results, each with a tracked link. Attaches to your existing search box; no code.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "selector",
    "displayName": "Search box selector (leave empty to detect it)",
    "simpleValueType": true,
    "help": "A CSS selector for your search input, for example input[name=q]. Empty: Arugula finds input[type=search] and common search forms."
  },
  {
    "type": "TEXT",
    "name": "container",
    "displayName": "Results container selector (leave empty for after the search form)",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "limit",
    "displayName": "Number of offers",
    "simpleValueType": true,
    "defaultValue": 3,
    "valueValidators": [
      {
        "type": "POSITIVE_NUMBER"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const setInWindow = require('setInWindow');
const queryPermission = require('queryPermission');
const makeInteger = require('makeInteger');

// The released site-search script (Arugula webapp, ADAG-206). GTM cannot set integrity on an
// injected script; the URL is versioned.
const url = 'https://api.arugulanet.com/embed/v0.4.1/search.js';

const settings = { channel: 'gtm' };
if (data.selector) settings.selector = data.selector;
if (data.container) settings.container = data.container;
if (data.limit) settings.limit = makeInteger(data.limit);
setInWindow('adagentSearch', settings, true);

if (queryPermission('inject_script', url)) {
  injectScript(url, data.gtmOnSuccess, data.gtmOnFailure, 'adagent-search');
} else {
  data.gtmOnFailure();
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://api.arugulanet.com/embed/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "adagentSearch"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___NOTES___

Loads https://api.arugulanet.com/embed/v0.4.1/search.js with channel gtm.
The script reads its settings from window.adagentSearch.
