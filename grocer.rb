def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  index = 0
  while index < collection.size do
    if name == collection[index][:item]
      return collection[index]
    end
    index += 1
  end
  nil
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  
  new_cart = []
  index = 0
  while index < cart.length do
    if  find_item_by_name_in_collection(cart[index][:item], new_cart)
       find_item_by_name_in_collection(cart[index][:item], new_cart)[:count] += 1
    else
      new_cart_item = cart[index]
      cart[index][:count] = 1
      new_cart << cart[index]
    end
    index += 1
  end
   new_cart
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
    coupon_counter = 0
  while coupon_counter < coupons.size do
    cart_checker = find_item_by_name_in_collection(coupons[coupon_counter][:item], cart)
    coupon_item_name = "#{coupons[coupon_counter][:item]} W/COUPON"
    couponed_item_name_checker = find_item_by_name_in_collection(coupon_item_name, cart)
    
      if couponed_item_name_checker
        couponed_item_name_checker[:count] += coupons[coupon_counter][:num]
        cart_checker[:count] -= coupons[coupon_counter][:num]
      else
        couponed_item_name_checker = {
          item: coupon_item_name,
          price: coupons[coupon_counter][:cost] / coupons[coupon_counter][:num],
          clearance: cart_checker[:clearance],
          count: coupons[coupon_counter][:num]
        }
        cart << couponed_item_name_checker
        cart_checker[:count] -= coupons[coupon_counter][:num]
      end
      
    coupon_counter += 1
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
