"use strict";

$(document).ready(function() {



    const firstCategory = document.querySelector(".first-category");
    const firstCategoryId = firstCategory.innerHTML.toString();
    const categoryTitle = document.querySelector(".category-title");
    const menuItems = document.querySelectorAll(".dropdown-item");


    for (var i = 0; i < menuItems.length; i++) {
        menuItems[i].addEventListener("click", handleClick)
    }


    function handleClick(e) {

        const requestedCategoryId = e.target.getAttribute("id");

        categoryTitleSetter(requestedCategoryId);
        leaderboardFetcher(requestedCategoryId);

    }

    const leaderboard = document.querySelector(".leaderboard");

    const success = (response) => {
        return response.json();
    };

    const handleData = (data) => {
        console.log("data", data);
        let allTableRows = "";

        let i;
        for (i = 0; i < data.length; i++) {
            const pos = i + 1;
            const nickname = data[i][0];
            const points = data[i][1];


            let tableRow = `
                                        <tr>
                                            <td>${pos}.</td>
                                            <td>${nickname}</td>
                                            <td>${points}</td>
                                        </tr>
                            `
            allTableRows += tableRow;
            emptyRowsFiller(10 - data.length);

        }

        // handle empty leaderboard

        if (data.length == 0) {

            let tableRow = `
                                        <tr>
                                            <td>&nbsp</td>
                                            <td>Be the first to play this category!</td>
                                            <td>&nbsp</td>
                                        </tr>
                            `
            allTableRows += tableRow;
            emptyRowsFiller(9);

        }


        updateTable();


        function emptyRowsFiller(emptyRowsNumber) {
            for (var i = 0; i < emptyRowsNumber; i++) {
                let emptyTableRow = `
                                        <tr>
                                            <td>&nbsp</td>
                                            <td>&nbsp</td>
                                            <td>&nbsp</td>
                                        </tr>
                            `
                allTableRows += emptyTableRow;
            }
        }

        function updateTable() {
            leaderboard.innerHTML = allTableRows;
        }
    }


    const error = (err) => {
        console.error("Fetch error", err);
    };

    categoryTitleSetter(firstCategoryId);
    leaderboardFetcher(firstCategoryId);


    function leaderboardFetcher(requestedCategoryId) {


        const fetchURL = "/getLeaderboardByCategoryId/" + requestedCategoryId;

        fetch(`${fetchURL}`)
            .then(success) // successful response
            .then(handleData)
            .catch(error); // error


    }

    function categoryTitleSetter(requestedCategoryId) {

        const categoryFetchURL = "/get-category-by-id/" + requestedCategoryId;

        const success = (response) => {
            return response.json();
        };

        const handleData = (data) => {
            categoryTitle.innerHTML = data.categoryName;

        }

        const error = (err) => {
            console.error("Fetch error", err);
        };

        fetch(`${categoryFetchURL}`)
            .then(success) // successful response
            .then(handleData)
            .catch(error); // error




    }





})