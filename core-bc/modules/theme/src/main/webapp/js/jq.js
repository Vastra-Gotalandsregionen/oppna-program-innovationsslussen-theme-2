// Maps

var geocoder = new google.maps.Geocoder();

$('.map-container').each(function(index) {
  var currentElement = $(this);

  var title = currentElement.data('title');
  var streetAddress = currentElement.data('streetaddress');
  var zipCode = currentElement.data('zipcode');
  var city = currentElement.data('city');

  var location = {
    title: currentElement.data('title'),
    streetAddress: currentElement.data('streetaddress'),
    zipCode: currentElement.data('zipcode'),
    city: currentElement.data('city')
  }

  var address = location.streetAddress + ', ' + location.zipCode + ' ' + location.city;

  geocoder.geocode({ 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      var latLng = results[0].geometry.location;
      renderMap(currentElement, location, latLng);
    }
  });

});


function renderMap(node, location, latLng) {

  var map = new google.maps.Map(node[0], {
      center: latLng,
      mapTypeControl: true,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      navigationControl: true,
      scaleControl: true,
      streetViewControl: true,
      zoom: 14
  });

  var contentString = '<div>' +
    '<div><strong>' + location.title + '</strong></div>' +
    '<div>' + location.streetAddress + '</div>' +
    '<div>' + location.zipCode + ' ' + location.city + '</div>' +
  '</div>';

  var infoWindow = new google.maps.InfoWindow({
    content: contentString
  });

  var marker = new google.maps.Marker({
    position: latLng,
    map: map,
    title: location.title
});

  google.maps.event.addListener(marker, 'click', function() {
    infoWindow.open(map, marker);
  });

  // Launch info window
  infoWindow.open(map, marker);

}



// Hero Carousel

var heroCarousel = $('.hero-carousel');
heroCarousel.addClass('owl-carousel')
var heroCarouselWrap = $(heroCarousel).parents('.hero-carousel-wrap')[0];

heroCarousel.owlCarousel({

  items: 1,

  loop:true,
  margin:10,

  nav:true,
  navText : [
    '<i class="icon-chevron-left"><span class="label">Next</span>',
    '<i class="icon-chevron-right"><span class="label">Previous</span>'
  ],

  dots: true,

  autoplay:true,
  autoplayTimeout:5000,
  //autoplayTimeout:50000000000000000,
  autoplayHoverPause:true,

  singleItem: 1

});



// heroCarousel.on('change.owl.carousel', function(event) {
//
//   console.log(event);
//
//   var activeItem = $(heroCarousel).find('.owl-item.active')[0];
//   var nextItem = $(activeItem).next();
//   var nextItemSlide = $(nextItem).find('.slide')[0];
//   var nextSkin = $(nextItemSlide).data('skin');
//
//   $(heroCarouselWrap).removeClass();
//   $(heroCarouselWrap).addClass('hero-carousel-wrap hero-carousel-wrap-' + nextSkin)
// })

heroCarousel.on('translate.owl.carousel', function(event) {

  console.log(event);

  var pageIndex = event.page.index;

  return false;

  var activeItem = $(heroCarousel).find('.owl-item.active')[0];
  var activeItemSlide = $(activeItem).find('.slide')[0];
  var skin = $(activeItemSlide).data('skin');

  $(heroCarouselWrap).removeClass();
  $(heroCarouselWrap).addClass('hero-carousel-wrap hero-carousel-wrap-' + skin)
})


/*
$(document).ready(function() {

  // Add custom navigation
  //http://owlgraphic.com/owlcarousel/demos/custom.html

  $(".owl-carousel").owlCarousel({

    items : 1,
    itemsDesktop : false,
    itemsDesktopSmall : false,
    itemsTablet: false,
    itemsMobile : false,

    //Basic Speeds
    slideSpeed : 200,
    paginationSpeed : 800,
    rewindSpeed : 1000,

    //Autoplay
    autoPlay : 5000,
    stopOnHover : true,

    // Navigation
    navigation : true,
    navigationText : [
      '<i class="icon-chevron-left"><span class="label">Next</span>',
      '<i class="icon-chevron-right"><span class="label">Previous</span>'
    ],
    rewindNav : true,
    scrollPerPage : false,

    //Pagination
    pagination : true,
    paginationNumbers: false,

    // Responsive
    responsive: true,
    responsiveRefreshRate : 200,
    responsiveBaseWidth: window,

    beforeMove: onBeforeMove


  });

  var ticker = 0;

  function onBeforeMove(a, b, c) {
    if(ticker == 0) {
      console.log('a, ', a);
      console.log('b, ', b);
      console.log('c, ', c);
    }
    ticker++;
  }

});
*/
