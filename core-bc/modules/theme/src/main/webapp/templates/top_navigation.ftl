<nav class="top-navigation clearfix" id="topNavigation">
	<ul class="top-nav-list clearfix">

		<#if is_signed_in>
			<li class="top-nav-user">
				<span>Inloggad som: ${user_name}</span>
			</li>
			<li class="top-nav-signout">
				<a href="${sign_out_url}">
					<i class="icon-unlock"></i> <span>${sign_out_text}</span>
				</a>
			</li>
		<#else>
			<li class="top-nav-signin">
				<a class="signin-link" href="${sign_in_url}">
					<i class="icon-lock"></i> <span>${sign_in_text}</span>
				</a>
			</li>
		</#if>
        <li class="top-nav-signin last">
            <a class="signin-link" href="http://www.vgregion.se/innovationsplattformen">
                <i class="icon-reply"></i> <span>Tillbaka till hemsida</span>
            </a>
        </li>
	</ul>
</nav>
