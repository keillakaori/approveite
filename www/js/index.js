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

$("#myNav").load("menu.html");

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
$(function() {
    new Dragend($("#swipe-receita").get(0), {
    afterInitialize: function() {
        $("#swipe-receita").css("visibility", "visible");
}
});
});

/*RECEITAS - INDICADORES*/
var dot = $("#dot > ul > li");
var contents = $("#swipe-receita > div");

$(window).scroll(function(){
  var wScroll = $(this).scrollLeft();
  
  if(wScroll>200){
    $("#dot").addClass("on");
  } else if(wScroll==0){
    $("#dot").removeClass("on");
  }
  
  if(wScroll >= contents.eq(0).offset().left){
    dot.removeClass('on');
    dot.eq(0).addClass('on');
    dot.removeClass('on');
    dot.eq(0).addClass('on');
  }
  if(wScroll >= contents.eq(1).offset().left){
    dot.removeClass('on');
    dot.eq(1).addClass('on');
    dot.removeClass('on');
    dot.eq(1).addClass('on');
  }
});