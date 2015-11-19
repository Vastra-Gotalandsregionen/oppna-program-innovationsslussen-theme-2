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
    responsiveBaseWidth: window


  });

});
