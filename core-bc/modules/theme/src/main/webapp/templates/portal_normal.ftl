<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

	<script type="text/javascript" src="${javascript_folder}/pojs.js"></script>

	<link href='//fonts.googleapis.com/css?family=Lato:100,300,400,700' rel='stylesheet' type='text/css'>

	${theme.include(top_head_include)}
</head>

<body class="${css_class}">

<a href="#main-content" id="skip-to-content"><@liferay.language key="skip-to-content" /></a>

${theme.include(body_top_include)}

<#if show_page_edit>
	<@liferay.dockbar />
</#if>

<div id="wrapper">
	<div class="container-fluid">

		<header id="banner" role="banner">
			<div id="heading" class="clearfix">

					<h1 class="site-title">
						<a class="" href="${site_default_url}">
							${site_name}
						</a>
					</h1>

			  <div class="top-wrap">
				  <div class="top-navigation-wrap">
								<#include "${full_templates_path}/top_navigation.ftl" />
				  </div>
			  </div>

				<a href="#navigationTrigger" id="navigationTrigger">
					<span class="sr-only">Meny</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
			</div>

			<#if has_navigation || is_signed_in>
				<div class="navigation-wrapper">
					<#include "${full_templates_path}/navigation.ftl" />
				</div>
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

</div>

<#include "${full_templates_path}/footer.ftl" />

</body>

${theme.include(body_bottom_include)}

${theme.include(bottom_include)}

<script type="text/javascript" src="${javascript_folder}/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${javascript_folder}/jquery/owl.carousel.min.js"></script>

<script type="text/javascript" src="${javascript_folder}/jq.js"></script>

<script type="text/javascript" src="${javascript_folder}/modules/innovationsslussen-banner-communicate-plugin.js"></script>
<script type="text/javascript" src="${javascript_folder}/modules/innovationsslussen-signin-prompt.js"></script>
<script type="text/javascript" src="${javascript_folder}/modules/innovationsslussen-signin-prompt-link-plugin.js"></script>
<script type="text/javascript" src="${javascript_folder}/modules/rp-action-confirmation-plugin.js"></script>
<script type="text/javascript" src="${javascript_folder}/modules/select-to-dropdown-plugin.js"></script>

<script type="text/javascript" src="${javascript_folder}/modules/innovationsslussen-theme-2.js"></script>
<script type="text/javascript" src="${javascript_folder}/theme-main.js"></script>

<script src="//www.youtube.com/player_api"></script>

<#include "${full_templates_path}/piwik.ftl" />
<#include "${full_templates_path}/social_sharing.ftl" />

</html>
