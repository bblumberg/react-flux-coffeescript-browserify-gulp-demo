module.exports = {
    "jquery": "$",
    "underscore": "_",
    "backbone": {
        "exports": "Backbone",
        "depends": {
           "jquery":"$",
           "underscore":"_"
        }
    },
    "jquery.cookie": {
      "exports": "$.cookie",
      "depends": {
         "jquery":"$"
      }
    },
    "bootstrap": {
      "depends": {
         "jquery":"$"
      }
    },
    "bootstrap.transition": {
      "exports": "$.support.transition",
      "depends": {
         "jquery":"$"
      }
    },
    "bootstrap.collapse": {
      "exports": "$.fn.collapse",
      "depends": {
         "jquery":"$"
      }
    },
    "backbone.picky": {
        "exports": "Backbone.Picky",
        "depends": {
            "backbone":"Backbone"
        }
    },
    "backbone.babysitter": {
        "exports": "Backbone.BabySitter",
        "depends": {
            "backbone":"Backbone"
        }
    },
    "backbone.wreqr": {
        "exports": "Backbone.Wreqr",
        "depends": {
            "backbone":"Backbone"
        }
    },
    "backbone.queryparams": {
        "depends": {
            "backbone":"Backbone"
        }
    },
    "backbone.marionette": {
        "exports": "Marionette",
        "depends": {
            "backbone":"Backbone",
            "backbone.wreqr":"Backbone.Wreqr",
            "backbone.babysitter":"Backbone.BabySitter"
        }
    }
};
