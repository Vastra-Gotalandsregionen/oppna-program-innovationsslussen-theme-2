AUI().add('innovationsslussen-theme-2',function(A) {
  var Lang = A.Lang,

  NAME = 'innovationsslussen-theme-2',
  NS = 'innovationsslussen-theme-2'
  ;

  var InnovationsslussenTheme2 = A.Component.create(
    {
      ATTRS: {

        someAttribute: {
          value: ''
        }

    },
    EXTENDS: A.Component,
    NAME: NAME,
    NS: NS,
    prototype: {

      initializer: function(config) {
        var instance = this;
      },

      renderUI: function() {
        var instance = this;

        instance._initActionConfirmation();
        instance._initSigninPrompt();
        instance._initBannerCommunicate();
        instance._initMainNavigation();
        //instance._initOverlayLinks();
        instance._initSelectToDropdown();
        //instance._fixDockbar();
      },

      bindUI: function() {
          var instance = this;

          instance._bindFaq();
          instance._bindIdeaSubmitButton();
          instance._bindIdeaList();
      },

      _bindFaq: function () {
      	var instance = this;

      	var faqQuestionNodes = A.all('.faq-question');

      	if(faqQuestionNodes) {
          	faqQuestionNodes.on('click', instance._onFaqQuestionClick, instance);

          	faqQuestionNodes.on('mouseover', function(e) {
          		var currentTarget = e.currentTarget;
          		currentTarget.addClass('hover');
          	});
          	faqQuestionNodes.on('mouseout', function(e) {
          		var currentTarget = e.currentTarget;
          		currentTarget.removeClass('hover');
          	});
      	}
      },

      _bindIdeaList: function() {
      	var instance = this;

          var ideaList = A.one('.idea-list-new');

          if(ideaList) {
          	ideaList.delegate('mouseenter', instance._handleIdeaListItemMouseEnter, 'a', instance);
          	ideaList.delegate('mouseleave', instance._handleIdeaListItemMouseLeave, 'a', instance);
          }

      },

      // Show loading mask on form submit
      _bindIdeaSubmitButton: function () {
      	var instance = this;

          var submitButton = A.one('.create-idea-form input.aui-button-input-submit');

          if(submitButton) {

          	submitButton.on('click', function(e) {

          		var formNode = e.currentTarget.ancestor('form');

          		if(formNode) {
          			formNode.plug(A.LoadingMask, {
      					background: '#bcd3e6',
      					strings: {
      						loading: 'Sparar din id&eacute;...'
      					}
          			});

          			formNode.loadingmask.show();

          			formNode.loadingmask.centerMessage();
          		}

          	}, instance);
          }
      },

      _fixDockbar: function() {
          var instance = this;

          var addButton = A.one('#_145_navAddControlsNavbarBtn');
          var addListItems = A.all('#_145_navAddControls > li');

          if(addListItems.size() == 0) {
              addButton.hide();
          }
      },

    	_handleIdeaListItemMouseEnter: function(e) {
    		var instance = this;

				var listItem = e.currentTarget;

		    var content2 = listItem.one('.idea-content-2');

		    var anim = new A.Anim({
          node: content2,
					duration: 0.3,
					easing: A.Easing.easeOut,
	        from: {
            opacity: 0.0
	        },
	        to: {
	          opacity: 1.0
	        }
		    });

				anim.run();
      },

    	_handleIdeaListItemMouseLeave: function(e) {
    		var instance = this;
    	},

      _initActionConfirmation: function() {
    	   var instance = this;

    			var requiresConfirmationLinks = A.all('a.requires-confirmation');
    			requiresConfirmationLinks.plug(A.Plugin.RpActionConfirmation);
      },

		  _initBannerCommunicate: function() {
        var instance = this;

        var bannerCommunicateNode = A.one('.banner-communicate');

        if(bannerCommunicateNode) {
          bannerCommunicateNode.plug(A.Plugin.InnovationsslussenBannerCommunicatePlugin);
        }
      },

      _initOverlayLinks: function() {
        var instance = this;

        var overlayLinks = A.all('a.rp-overlay-link');
        overlayLinks.plug(A.Plugin.RpIframeLink);
      },

      _initMainNavigation: function() {
        var instance = this;

        var mainNavList = A.one('#navigation ul.nav-list');

        if(mainNavList) {
          var mainNavListItems = mainNavList.all('> li');

          mainNavListItems.on('mouseenter', instance._onMainNavItemEnter, instance);
          mainNavListItems.on('mouseleave', instance._onMainNavItemLeave, instance);

          // Extra callback method that ensures that no hover classes are left behind in ie

          mainNavList.on('mouseenter', instance._onMainNavEnter, instance);
          mainNavList.on('mouseleave', instance._onMainNavLeave, instance);
        }
      },

      _initSelectToDropdown: function() {
        var instance = this;

        var selects = A.all('select.select-to-dropdown');
          selects.plug(A.Plugin.SelectToDropdown, {
          bindFormSubmit: true
        });
      },

      _initSigninPrompt: function() {
        var instance = this;

        var signinPromptNodes = A.all('.innovationsslussen-signin-prompt');

        signinPromptNodes.each(function(item, index, list) {
          item.plug(A.Plugin.InnovationsslussenSigninPromptLink);
        });

      },

      _onFaqQuestionClick: function(e) {
        var instance = this;

        var questionNode = e.currentTarget;
        var listNode = questionNode.ancestor('li');

        listNode.toggleClass('expanded');
      },

      _onMainNavEnter: function(e) {
        var instance = this;
      },

      _onMainNavLeave: function(e) {
        var instance = this;

        var mainNavList = e.currentTarget;

        var mainNavListItems = mainNavList.all('li');
        mainNavListItems.removeClass('hover');
      },

      _onMainNavItemEnter: function(e) {
        var instance = this;

        var navListItem = e.currentTarget;

        var allNavListItems = A.all('#navigation li');
        allNavListItems.removeClass('hover');

        navListItem.addClass('hover');
      },

      _onMainNavItemLeave: function(e) {
        var instance = this;

        var navListItem = e.currentTarget;
        navListItem.removeClass('hover');
      },

      _someFunction: function(e) {
        var instance = this;
      }

    }
  }
);

  A.InnovationsslussenTheme2 = InnovationsslussenTheme2;

  },1, {
    requires: [
      'anim',
     	'aui-base',
     	'aui-loading-mask-deprecated',
    	'event',
    	'event-mouseenter',
    	'event-resize',
    	'innovationsslussen-banner-communicate-plugin',
    	'innovationsslussen-signin-prompt-link-plugin',
    	'rp-action-confirmation-plugin',
    	//'rp-iframe-link-plugin',
    	'select-to-dropdown-plugin'
    ]
  }
);
