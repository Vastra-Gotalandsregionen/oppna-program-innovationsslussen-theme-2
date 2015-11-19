<nav class="top-navigation clearfix" id="topNavigation">
	<ul class="top-nav-list clearfix">

		<#if is_signed_in>
			<li class="top-nav-user">
				<span>Inloggad som: ${user_name}</span>
			</li>
			<li class="top-nav-signout last">
				<a href="${sign_out_url}">
					<i class="icon-unlock"></i> <span>${sign_out_text}</span>
				</a>
			</li>
		<#else>
			<li class="top-nav-signin last">
				<a class="signin-link" href="${sign_in_url}">
					<i class="icon-lock"></i> <span>${sign_in_text}</span>
				</a>
			</li>
		</#if>
	</ul>
</nav>
