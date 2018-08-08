// Generated by CoffeeScript 2.3.1
(function() {
  window.Main = window.Main = class Main {
    constructor() {}

    init() {
      return this.fetchData();
    }

    fetchData() {
      var dataArray;
      dataArray = [];
      $.ajax({
        type: "GET",
        async: false,
        url: "./data/data.csv",
        dataType: "text",
        success: function(csvdata) {
          dataArray = $.csv.toArrays(csvdata);
          return dataArray.shift();
        }
      });
      return dataArray;
    }

  };

}).call(this);
