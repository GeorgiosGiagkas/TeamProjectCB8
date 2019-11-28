<%@include file="authorize-user.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/css/payment.css">

    <title>QuizBot</title>
</head>
<body>
        <div class="container col-md-8">
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
                    <input type="hidden" id="price" name="price" value="4.99" readonly >
                    <input type="hidden" id="currency" name="currency" value = "EUR" placeholder="Enter Currency" readonly>
                    <input type="hidden" id="method" name="method" value = "paypal" placeholder="Payment Method" readonly>
                    <input type="hidden" id="intent" name="intent" value="sale" readonly>

                    <div class="col-md-6">
                        <div>
                            <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i></span></h4>
                            <p>1000 Gold <span class="price">4.99€</span></p>
                            <hr>
                            <p>Total <span class="price" style="color:black"><b>4.99€</b></span></p>
                        </div>
                    </div>

                </div>




                <input type = "button" value = "Discard" class = "btn-return">
                <input type="submit" value="Continue to checkout" class="btn">
            </form>
        </div>



    <script>
        const btnReturn = document.querySelector(".btn-return");
        btnReturn.addEventListener("click", function () {
           location.href = "/show-shop";
        });
    </script>

</body>
</html>
