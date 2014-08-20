<#if piwik_code?has_content>


    <script type="text/javascript">
        var piwikUrl = '//piwik.vgregion.se/';

        var _paq = _paq || [];

        (function(){
            var u = piwikUrl;

            _paq.push(['setSiteId', ${piwik_code}]);
            _paq.push(['setTrackerUrl', u+'piwik.php']);
            _paq.push(['trackPageView']);
            _paq.push(['enableLinkTracking']);
            var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0]; g.type='text/javascript'; g.defer=true; g.async=true; g.src=u+'piwik.js';
            s.parentNode.insertBefore(g,s);
        })();
    </script>

  <noscript>
    <p><img src="//piwik.vgregion.se/piwik.php?idsite=${piwik_code}" style="border:0" alt="" /></p>
  </noscript>

</#if>
