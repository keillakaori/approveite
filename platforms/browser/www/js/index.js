/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

/*MENU*/
function openNav() {
    document.getElementById("myNav").style.height = "93%";
}

function closeNav() {
    document.getElementById("myNav").style.height = "0%";
}

/*SEARCH*/
$(document).ready(function(){
  $("#txtBusca").on("keyup", function() {
	var stringPesquisa = $(this).val().replace(/[áàâã]/g,'a').replace(/[éèê]/g,'e').replace(/[óòôõ]/g,'o').replace(/[úùû]/g,'u').toLowerCase();
    $('.categoria').hide();
    $('.tag:contains('+stringPesquisa+')').parent().show().each(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});

/*FILTRO*/
function abrePopup() {
    document.getElementById("filter").style.display = "block";
}

var $filterCheckboxes = $('input[type="checkbox"]');

$filterCheckboxes.on('change', function() {

  var selectedFilters = {};

  $filterCheckboxes.filter(':checked').each(function() {

    if (!selectedFilters.hasOwnProperty(this.name)) {
      selectedFilters[this.name] = [];
    }

    selectedFilters[this.name].push(this.value);

  });

  // create a collection containing all of the filterable elements
  var $filteredResults = $('.categoria');

  // loop over the selected filter name -> (array) values pairs
  $.each(selectedFilters, function(name, filterValues) {

    // filter each .flower element
    $filteredResults = $filteredResults.filter(function() {

      var matched = false,
        currentFilterValues = $(this).data('category').split(' ');

      // loop over each category value in the current .flower's data-category
      $.each(currentFilterValues, function(_, currentFilterValue) {

        // if the current category exists in the selected filters array
        // set matched to true, and stop looping. as we're ORing in each
        // set of filters, we only need to match once

        if ($.inArray(currentFilterValue, filterValues) != -1) {
          matched = true;
          return false;
        }
      });

      // if matched is true the current .flower element is returned
      return matched;

    });
  });
document.getElementById("demo").addEventListener("click", myFunction);

function myFunction() {
 
  $('.categoria').hide().filter($filteredResults).show();
}
});

/*RECEITAS*/
var card = document.getElementById('card');
var wrapper = document.getElementById('wrapper');
var slideLength = $(".slide").length;

// Calculate wrapper and individual slide with
// relative to the parent (box model ftw)
$(wrapper).css("width", slideLength * 100 + "%");
/*$(".slide")
.each(function(index) {
  $(this).css("width", 100 / slideLength + "%");
});*/
$(".slide")
.each(function(index) {
  //Might have to repeat this one on window resize?
  $(this).css("width", ($("#wrapper").width()) / slideLength + "px");
});

var offsetX = 0;
var snapPosition = 0;

function snap_to(offset) {
  
  var difference;
  var minimumDiff;
  var slideWidth = $(".slide:first-child").width();
  var snap;

  // Of all possible snap values, find out which is the closest 
  // to current offset 
  for (var i = 0; i < $(".slide").length; i++) {
    // Calculate the discrepancy between offset and possible snap loc.
    difference = Math.abs(offset - (0 - i * slideWidth));
    //console.log($("#wrapper").width());

    // Finds out if there is a better difference
    if (minimumDiff === undefined || difference < minimumDiff) {
      minimumDiff = difference;
      snap = (0 - i * slideWidth);
    }
  }

  return snap;
};

var swipeChecker = false;

/*var swipeHandler = new Hammer(card);
swipeHandler.get("swipe").set({ direction: Hammer.DIRECTION_VERTICAL });
swipeHandler
.on("swipe", function(ev) {
  console.log("swipe"); 
})
.on("swipeup", function(ev) {  
  alert("up");
})
.on("swipedown", function(ev) {
  alert("down");
});*/

var panHandler = new Hammer(card);
panHandler.get("pan").set({ direction: Hammer.DIRECTION_ALL });
panHandler
.on("panleft panright", function(ev) {
  //ev.preventDefault();
  offsetX = snapPosition + ev.deltaX;

  $(wrapper).css('-webkit-transform', 'translate3d(' + offsetX + 'px,0px,0px)');
  $(wrapper).css('transform', 'translate3d(' + offsetX + 'px,0px,0px)');
})
.on("panend", function(ev) {
    $(wrapper).addClass('animate');
    snapPosition = snap_to(offsetX);  
    $(wrapper).css('-webkit-transform', 'translate3d(' + snapPosition + 'px, 0px, 0px)')
});