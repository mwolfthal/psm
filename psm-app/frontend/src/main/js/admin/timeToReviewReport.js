"use strict";

window.addEventListener("load", function () {
  var reportJson = reportTableToJson($(".reportTable"));
  console.log(reportJson);

//  var monthCounts = getDateCounts("month", reportJson);
//  console.log(monthCounts);

  var medians = reportJson.reduce(function (medians, datum) {
    medians[datum.month] = Number(datum.medianReviewTime);
    return medians;
  }, {});

  drawMonthsLineGraph(
    "#timeToReviewLineGraph",
    "Time to Review (Mean and Median)",
    medians
  );
});
