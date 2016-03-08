<nav class="" id="navigation" role="navigation">
	<ul aria-label="<@liferay.language key="site-pages" />" role="menubar" class="nav-list level-one">

		<#if nav_items?has_content>
			<#list nav_items as nav_item>
				<#assign nav_item_attr_has_popup = "" />
				<#assign nav_item_attr_selected = "" />
				<#assign nav_item_css_class = "" />
				<#assign nav_item_id = "" />
				<#assign nav_item_url = "" />
				<#assign nav_item_target = "" />
				<#assign nav_item_name = "" />


				<#if nav_item.isSelected()>
					<#assign nav_item_attr_has_popup = "aria-haspopup='true'" />
					<#assign nav_item_attr_selected = "aria-selected='true'" />
					<#assign nav_item_css_class = "selected" />
				</#if>

				<#assign nav_item_id = "layout_" + nav_item.getLayoutId() />
				<#assign nav_item_url = nav_item.getURL() />
				<#assign nav_item_target = nav_item.getTarget() />
				<#assign nav_item_name = nav_item.getName() />

				<li ${nav_item_attr_selected} class="${nav_item_css_class}" id="${nav_item_id}" role="presentation">
					<a aria-labelledby="${nav_item_id}}" ${nav_item_attr_has_popup} href="${nav_item_url}" ${nav_item_target} role="menuitem">
						<span class="nav-text">
							${nav_item_name}
						</span>
						<#if nav_item.getChildren()?has_content>
								<span class="toggle-sub-nav"></span>
						</#if>
					</a>

					<#if nav_item.getChildren()?has_content>
						<div class="nav-list-sub-wrap">
							<ul class="nav-list-sub nav-list-sub-1" role="menu">
								<#list nav_item.getChildren() as nav_child>

									<#assign nav_child_attr_selected = "" />
									<#assign nav_child_css_class = "" />

									<#if nav_child.isSelected() >
										<#assign nav_child_attr_selected = "aria-selected='true'" />
										<#assign nav_child_css_class = "selected" />
									</#if>
									<li class="${nav_child_css_class}" id="layout_${nav_child.getLayoutId()}" ${nav_child_attr_selected} role="presentation">
										<a aria-labelledby="layout_${nav_child.getLayoutId()}" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">
											<span>${nav_child.getName()}</span>
										</a>
									</li>
								</#list>
							</ul>
						</div>
					</#if>

				</li>
			</#list>
		</#if>

		<#--
		<#if add_idea_layout?has_content>
			<li class="add-idea">
          <#assign add_idea_link_css_class = "innovationsslussen-signin-prompt" />
          <#if is_signed_in>
            <#assign add_idea_link_css_class = "" />
          </#if>
				<a class="${add_idea_link_css_class}" href="${add_idea_layout.getFriendlyURL()}" data-promptmsg="Du m&aring;ste vara inloggad f&ouml;r att f&aring; skicka in en id&eacute;, information om inloggning finns p&aring; sidan Fr&aring;gor och Svar.">
					<span class="nav-text">Skicka in din id&eacute;</span>
				</a>
			</li>
		</#if>
		-->

    <#if is_signed_in>
        <li class="logout">
            <a href="${sign_out_url}">
                <span class="nav-text">${sign_out_text}</span>
            </a>
        </li>
    <#else>
        <li class="login">
            <a class="signin-link" href="${sign_in_url}">
                <span class="nav-text">${sign_in_text}</span>
            </a>

        </li>
    </#if>

	</ul>

</nav>
