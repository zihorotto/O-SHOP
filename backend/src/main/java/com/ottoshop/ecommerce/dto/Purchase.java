package com.ottoshop.ecommerce.dto;

import com.ottoshop.ecommerce.entity.Address;
import com.ottoshop.ecommerce.entity.Customer;
import com.ottoshop.ecommerce.entity.Order;
import com.ottoshop.ecommerce.entity.OrderItem;
import lombok.Data;

import java.util.Set;

@Data
public class Purchase {

    private Customer customer;
    private Address shippingAddress;
    private Address billingAddress;
    private Order order;
    private Set<OrderItem> orderItems;

}
