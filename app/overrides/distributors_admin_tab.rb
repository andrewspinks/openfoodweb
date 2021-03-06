Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "distributors_admin_tabs",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :text => "<%= tab(:distributors, :url => spree.admin_distributors_path) %>",
                     :disabled => false)

Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "suppliers_admin_tabs",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :text => "<%= tab(:suppliers, :url => spree.admin_suppliers_path) %>",
                     :disabled => false)