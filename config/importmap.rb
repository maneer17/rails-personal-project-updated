pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "flatpickr" # @4.6.13
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"
pin "@nathanvda/cocoon", to: "@nathanvda--cocoon.js" # @1.2.14
pin "bootstrap", to: "bootstrap.bundle.min.js"
