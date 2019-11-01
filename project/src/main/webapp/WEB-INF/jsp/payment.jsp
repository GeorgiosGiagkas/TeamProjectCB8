<%--
  Created by IntelliJ IDEA.
  User: mousa
  Date: 01-Nov-19
  Time: 1:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/css/payment.css">
</head>
<body>
<div class="row">
    <div class="col-75">
        <div class="container">
            <form method="post"  action="/pay">
                <div class="col-50">
                    <h3>Payment</h3>
                    <label>Accepted Cards</label>
                    <div class="icon-container">
                        <i class="fa fa-cc-visa" style="color:navy;"></i>
                        <i class="fa fa-cc-amex" style="color:blue;"></i>
                        <i class="fa fa-cc-mastercard" style="color:red;"></i>
                        <i class="fa fa-cc-discover" style="color:orange;"></i>
                    </div>
                    <label for="price">Total</label>
                    <input type="text" id="price" name="price" value="10" readonly >
                    <label for="currency">Currency</label>
                    <input type="text" id="currency" name="currency" value = "EUR" placeholder="Enter Currency" readonly>
                    <label for="method">Payment Method</label>
                    <input type="text" id="method" name="method" value = "paypal" placeholder="Payment Method" readonly>
                    <label for="intent">Intent</label>
                    <input type="text" id="intent" name="intent" value="sale" readonly>


                </div>

                <input type="submit" value="Continue to checkout" class="btn">
            </form>
        </div>
    </div>
    <div class="col-25">
        <div class="container">
            <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i></span></h4>
            <p><a href="#">Gold Amount</a> <span class="price">$10</span></p>
            <hr>
            <p>Total <span class="price" style="color:black"><b>$10</b></span></p>
        </div>
    </div>
</div>

</body>
</html>
