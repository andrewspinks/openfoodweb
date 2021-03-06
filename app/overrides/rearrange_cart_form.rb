# Remove column layout from cart form items so we can style it with CSS
Deface::Override.new(:virtual_path  => "spree/orders/edit",
                     :replace       => "[data-hook='inside_cart_form']",
                     :partial       => "spree/orders/inside_cart_form",
                     :name          => "inside_cart_form")

Deface::Override.new(:virtual_path  => "spree/orders/edit",
                     :replace       => "#empty-cart[data-hook]",
                     :partial       => "spree/orders/empty_cart_form",
                     :name          => "empty_cart_form")
