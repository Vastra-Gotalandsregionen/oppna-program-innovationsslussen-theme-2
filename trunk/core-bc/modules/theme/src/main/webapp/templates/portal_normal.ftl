<!DOCTYPE html>

<#include init />

<html class="dockbar-split ${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<script type="text/javascript" src="${javascript_folder}/pojs.js"></script>

	${theme.include(top_head_include)}
</head>

<body class="${css_class}">

<a href="#main-content" id="skip-to-content"><@liferay.language key="skip-to-content" /></a>

${theme.include(body_top_include)}

<#if show_page_edit>
	<@liferay.dockbar />
</#if>

<div class="container" id="wrapper">

	<header id="banner" role="banner">
		<div id="heading" class="clearfix">
			<h1 class="site-title">
				<a class="" href="${site_default_url}">
					<#assign logo_src = images_folder + "/theme/logo/logo-vgr-innovationsslussen.png" />
					<img alt="${logo_description}" src="${logo_src}" />
				</a>
			</h1>

      <div class="top-wrap">
          <div class="top-navigation-wrap">
						<#include "${full_templates_path}/top_navigation.ftl" />
          </div>
      </div>

		</div>

		<#if has_navigation || is_signed_in>
				<#include "${full_templates_path}/navigation.ftl" />
		</#if>

	</header>

	<div id="content">

		<#if show_breadcrumbs>
			<#include "${full_templates_path}/breadcrumbs.ftl" />
		</#if>

		<#if selectable>
			${theme.include(content_include)}
		<#else>
			${portletDisplay.recycle()}

			${portletDisplay.setTitle(the_title)}

			${theme.wrapPortlet("portlet.ftl", content_include)}
		</#if>

	</div>

</div>

<#include "${full_templates_path}/footer.ftl" />

</body>

${theme.include(body_bottom_include)}

${theme.include(bottom_include)}

<script src="//www.youtube.com/player_api"></script>

<#include "${full_templates_path}/piwik.ftl" />
<#include "${full_templates_path}/social_sharing.ftl" />

</html>
