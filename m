Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A0A7EB
	for <distributions@lists.linux.dev>; Sat, 14 Oct 2023 03:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; dkim=none
User-agent: mu4e 1.10.7; emacs 30.0.50
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Subject: Integration work needed for >=xdg-desktop-portal-1.18.0
Date: Sat, 14 Oct 2023 03:55:21 +0100
Organization: Gentoo
Message-ID: <87sf6dap1g.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hi all,

xdg-desktop-portal-1.18.0 changes its behaviour if no portals are
configured by the user, installed portals, or desktop environments.

Simon has a good summary at https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1050911#35
for what one needs to do.

I've filed a Gentoo tracker bug at https://bugs.gentoo.org/915704
with a list of things I'm aware of that need handling, but I'll
include a list here of some useful references:
* https://github.com/flatpak/xdg-desktop-portal/issues/1017
* https://github.com/flatpak/xdg-desktop-portal/issues/1077
* https://github.com/flatpak/xdg-desktop-portal/issues/1102

Thanks to abby from Void and to psykose as well for the heads up.

best,
sam
