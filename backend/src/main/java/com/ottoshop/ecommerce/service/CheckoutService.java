package com.ottoshop.ecommerce.service;

import com.ottoshop.ecommerce.dto.PaymentInfo;
import com.ottoshop.ecommerce.dto.Purchase;
import com.ottoshop.ecommerce.dto.PurchaseResponse;
import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;

public interface CheckoutService {

    PurchaseResponse placeOrder(Purchase purchase);

    PaymentIntent createPaymentIntent(PaymentInfo paymentInfo) throws StripeException;

}
