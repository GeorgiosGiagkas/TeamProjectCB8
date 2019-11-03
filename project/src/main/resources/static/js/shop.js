$(document).ready(function() {

    const fetchURL = "getShopDtoByUserId/3";

    const success = (response) =>
    {
        return response.json();
    }

    const handleData = (data) =>
    {
        console.log("data", data);
    }

    const error = (err) => {
        console.error("Fetch error", err);
    };

    fetch(`${fetchURL}`)
        .then(success) // successful response
        .then(handleData)
        .catch(error); // error




})