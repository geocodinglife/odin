class Role < ApplicationRecord

  enum name: { admin: "admin", saler: "saler", buyer:"buyer"} 
end
