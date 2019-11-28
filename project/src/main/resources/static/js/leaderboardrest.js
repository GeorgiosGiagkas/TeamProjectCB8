function loadLeaderboard(categoryName) {
    $.ajax(
        {
            url: "/getLeaderboardByCategoryName/" + categoryName
        }
    ).then(function (userScores) {
        $(".category-title").html("");
        $(".category-title").html(categoryName);
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
            url: "/show-categories"
        }
    ).then(function (categories) {
        loadLeaderboard(categories[0].categoryName);
    });

    $(".dropdown-item").click(function(e) {
        let categoryName = $(e.target).text();
        loadLeaderboard(categoryName);
    });

});