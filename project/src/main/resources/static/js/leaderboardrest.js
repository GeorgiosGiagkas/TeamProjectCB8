function loadLeaderboard(categoryName) {
    $.ajax(
        {
            url: "http://localhost:8080/getLeaderboardByCategoryName/" + categoryName
        }
    ).then(function (userScores) {
        $("#rows").html("");
        if(userScores.length === 0){
            let message = "No users play this category.";
            let row = `<tr>
            <td></td>
            <td>${message}</td>
            <td></td>
            </tr>`;
            $("#rows").append(row);
        } else{
            let position = 0;
            for (let userScore of userScores) {
                position++;
                let row = `<tr>
                <td>${position}.</td>
                <td>${userScore[0]}</td>
                <td>${userScore[1]}</td>
                </tr>`;
                $("#rows").append(row);
            }
        }
    });
}

$(document).ready(function () {
    $.ajax(
        {
            url: "http://localhost:8080/show-categories"
        }
    ).then(function (categories) {
        loadLeaderboard(categories[0].categoryName);
    });

    $(".dropdown-item").click(function(e) {
        let categoryName = $(e.target).text();
        loadLeaderboard(categoryName);
    });

});