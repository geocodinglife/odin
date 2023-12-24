# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "@rails/actiontext", to: "actiontext.js", preload: true
pin "trix", to: "https://unpkg.com/trix@2.0.0/dist/trix.umd.min.js", preload: true

pin_all_from "app/javascript/controllers", under: "controllers", preload: true
