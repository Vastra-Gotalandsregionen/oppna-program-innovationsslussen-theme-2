
<#------ Taglibs ----------------------------------------------------------------------------------------------------------------->

<#assign liferay_ui=PortalJspTagLibs["/WEB-INF/tld/liferay-ui.tld"]>
<#assign aui=PortalJspTagLibs["/WEB-INF/tld/liferay-aui.tld"]>

<#------ Define services ----------------------------------------------------------------------------------------------------------------->

<#assign expandoValueLocalService = serviceLocator.findService("com.liferay.portlet.expando.service.ExpandoValueLocalService") />
<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.service.LayoutLocalService") />
<#assign journalArticleLocalService = serviceLocator.findService("com.liferay.portlet.journal.service.JournalArticleLocalService") />

<#assign portletItemLocalService = serviceLocator.findService("com.liferay.portal.service.PortletItemLocalService") />
<#assign portletPreferencesLocalService = serviceLocator.findService("com.liferay.portal.service.PortletPreferencesLocalService") />
<#assign userGroupLocalService = serviceLocator.findService("com.liferay.portal.service.UserGroupLocalService") />

<#------ Define variables ----------------------------------------------------------------------------------------------------------------->

<#assign show_breadcrumbs = true />

<#------ Expando values ----------------------------------------------------------------------------------------------------------------->

<#-- Add This -->
<#assign social_add_this_profile_id = expandoValueLocalService.getData(company_id, "com.liferay.portal.model.Group", "CUSTOM_FIELDS", "addThisCode", group_id, "")  />

<#-- Create Idea Layout Friendly URL -->
<#assign create_idea_friendly_url = expandoValueLocalService.getData(company_id, "com.liferay.portal.model.Group", "CUSTOM_FIELDS", "createIdeaFriendlyURL", group_id, "")  />

<#-- Social Sharing active for this page-->
<#assign social_add_this_active_for_this_page = expandoValueLocalService.getData(company_id, "com.liferay.portal.model.Layout", "CUSTOM_FIELDS", "innovationsslussen-show-social-sharing", page.getPlid(), true)  />

<#-- Piwik Code -->
<#assign piwik_code = expandoValueLocalService.getData(company_id, "com.liferay.portal.model.Group", "CUSTOM_FIELDS", "piwikCode", group_id, "")  />


<#------ Theme Settings ----------------------------------------------------------------------------------------------------------------->

<#--
-->
	<#if theme_display.getThemeSetting("show-breadcrumbs") == "false">
		<#assign show_breadcrumbs = false />
	</#if>


<#------ Permissions Checker ----------------------------------------------------------------------------------------------------------------->

<#assign permission_checker = theme_display.getPermissionChecker() />

<#assign is_scope_group_admin = permission_checker.isGroupAdmin(group_id) />
<#assign is_scope_group_owner = permission_checker.isGroupOwner(group_id) />

<#assign is_omni_admin = permission_checker.isOmniadmin() />


<#------ Page Edit Mode ----------------------------------------------------------------------------------------------------------------->
<#------ Whether or not portlet titles and other UI components should be displayed. Also used to show/hide dockbar.  ------>

<#assign show_page_edit = false />

<#-- Include Omni Admin -->
<#assign show_page_edit = show_page_edit || is_omni_admin />

<#-- Include Scope Group Owner -->
<#assign show_page_edit = show_page_edit || is_scope_group_owner />

<#-- Include Scope Group Admin -->
<#assign show_page_edit = show_page_edit || is_scope_group_admin />

<#if show_page_edit>
	<#assign css_class = css_class + " page-edit dockbar-split" />
</#if>


<#------ Macros -------------------------------------------------->

<#-- Include Web Content Display portlet in theme. attribute: group_id is long, article_id is String-->

<#macro includeWCD group_id article_id>
	<#if article_id != "">

		<#local portlet_instance_suffix = "gothiaforum" />
		<#local instance_id = "wcd" + article_id + portlet_instance_suffix />
		<#local instance_id = instance_id?substring(0, 12) />
		<#local portlet_id = "56_INSTANCE_" + instance_id />

		${freeMarkerPortletPreferences.reset()}

		${freeMarkerPortletPreferences.setValue("portletSetupShowBorders","false")}
		${freeMarkerPortletPreferences.setValue("groupId", group_id?c)}
		${freeMarkerPortletPreferences.setValue("articleId", article_id)}

		${theme.runtime(portlet_id, "", freeMarkerPortletPreferences)}
		${freeMarkerPortletPreferences.reset()}
	<#else>
		&nbsp;
	</#if>
</#macro>
