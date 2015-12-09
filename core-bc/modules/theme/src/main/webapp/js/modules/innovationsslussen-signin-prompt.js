AUI().add('innovationsslussen-signin-prompt',function(A) {
  var Lang = A.Lang,
    isNull = Lang.isNull,

    NAME = 'innovationsslussen-signin-prompt',
    NS = 'innovationsslussen-signin-prompt',

	  // Custom Attributes
    PROMPT_MSG = 'promptMsg',
    PROMPT_MSG_DEFAULT = 'Du m&aring;ste vara inloggad f&ouml;r att f&aring; skicka in en id&eacute;, information om inloggning finns p&aring; sidan Fr&aring;gor och Svar.',
    SIGNIN_URL = 'signinUrl',

    CSS_HIDDEN = 'hide'
  ;

  var InnovationsslussenSigninPrompt = A.Component.create(
    {
      ATTRS: {

        promptMsg: {
  		    value: ''
      	},

  			signinUrl: {
		      value: ''
  			},

      	someAttr: {
  		    value: null
      	}

      },
      EXTENDS: A.Component,
      NAME: NAME,
      NS: NS,

      prototype: {

      	dialog: null,

        initializer: function(config) {
          var instance = this;

          var promptMsg = instance.get(PROMPT_MSG);

          if(promptMsg == '') {
          	promptMsg = PROMPT_MSG_DEFAULT;
          	instance.set(PROMPT_MSG, promptMsg);
          }

        },

        renderUI: function() {
          var instance = this;

  				var width = 350;
  				var height = 220;

  				var signinUrl = instance.get(SIGNIN_URL);

  				var headerContent = '<h3>Logga in f&ouml;rst</h3>';
  				var bodyContent = '';
  				bodyContent += '<p>';
  				bodyContent += instance.get(PROMPT_MSG);
  				bodyContent += '</p>';
  				bodyContent += '<div class="link-btn-wrap"><a class="link-btn link-btn-link" href="'+  signinUrl + '"><span>Logga in h&auml;r</span></a></div>';

  				var dialog = new A.Modal({
  					bodyContent: bodyContent,
  					centered: true,
  					cssClass: 'innovationsslussen-dialog',
  					destroyOnClose: true,
            headerContent: headerContent,
  					modal: true,
  					resizable: false,
  					height: height,
  					width: width,
            zIndex: 2000
  				});

  				dialog.render();

  				instance.dialog = dialog;


        },

        bindUI: function() {
            var instance = this;

            // Destroy instance when dialog is destroyed
            instance.dialog.on('destroy', function(e) {
            	instance.destroy();
            }, instance);
        },

        _someFunction: function() {
            var instance = this;
        }

      }
    }
  );

  A.InnovationsslussenSigninPrompt = InnovationsslussenSigninPrompt;

    },1, {
        requires: [
	       'aui-base',
	       'aui-modal',
	       'substitute'
      ]
    }
);
