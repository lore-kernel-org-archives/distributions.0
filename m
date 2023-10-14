Received: from mx1.voidlinux.org (f-sfo3-us.m.voidlinux.org [143.198.238.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5981106
	for <distributions@lists.linux.dev>; Sat, 14 Oct 2023 03:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=voidlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=voidlinux.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=voidlinux.org header.i=@voidlinux.org header.b="qiSFafRd"
DKIM-Signature: a=rsa-sha256; bh=tfyA1Xx7SYakwUa5V/aVwzJoHNCAGrdW/Z+H9GzGMdg=;
 c=relaxed/relaxed; d=voidlinux.org;
 h=Subject:Subject:Sender:To:To:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@voidlinux.org; s=default; t=1697253119; v=1; x=1697685119;
 b=qiSFafRdf0zqLR60CBNuQcItlzEcMGfqEzh+HX9ibXgwmPRMqr0BUaP7cAy/UgaJsy2PzW5Y
 Hp+EO3o94ReFT75QDwHregLc2a0I/lgENwALgVKWfgakcaIlVHV1jqr0hYo5JOSsmYvNQvFsOkU
 bY/deDvNy64p7fC5KO2PoSOCpphK0e51kC8+YUcLjXWALXwGcNZPseDdZQasroi5wD6wQse6PDd
 odjOQ4G9F62JysV4hF9y5n0dBUtgzVQOZVFA1BOfrH2EcsLMq6OaHof4ZXKv2+LH1LJaH88IuSH
 AlAIjF0tc3BWTYfJSSPRYsZqmNVFDxb3nFGNVobSQHneQ==
Received: by mx1.voidlinux.org (envelope-sender <abby@voidlinux.org>) with
 ESMTPS id ef51cf74; Sat, 14 Oct 2023 03:11:59 +0000
Message-ID: <db24ba7d-1262-4192-9c82-eeb5e7a08ea3@voidlinux.org>
Date: Fri, 13 Oct 2023 23:11:58 -0400
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Integration work needed for >=xdg-desktop-portal-1.18.0
Content-Language: en-US
To: Sam James <sam@gentoo.org>, distributions@lists.linux.dev
References: <87sf6dap1g.fsf@gentoo.org>
From: classabbyamp <abby@voidlinux.org>
In-Reply-To: <87sf6dap1g.fsf@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-10-13 22 h 55, Sam James wrote:
> Hi all,
> 
> xdg-desktop-portal-1.18.0 changes its behaviour if no portals are
> configured by the user, installed portals, or desktop environments.
> 
> Simon has a good summary at https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1050911#35
> for what one needs to do.
> 
> I've filed a Gentoo tracker bug at https://bugs.gentoo.org/915704
> with a list of things I'm aware of that need handling, but I'll
> include a list here of some useful references:
> * https://github.com/flatpak/xdg-desktop-portal/issues/1017
> * https://github.com/flatpak/xdg-desktop-portal/issues/1077
> * https://github.com/flatpak/xdg-desktop-portal/issues/1102
> 
> Thanks to abby from Void and to psykose as well for the heads up.
> 
> best,
> sam
> 

On Void we're shipping a default portals.conf to ensure all users have 
at least some working portal, regardless of WM or DE (assuming they 
installed one of the backends):

     [preferred]
     default=*

in the lowest-precedence location, /usr/share/xdg-desktop-portal.

More of the rationale behind this is available in the commit:
https://github.com/void-linux/void-packages/commit/b4c404aac0af3ced08671a8840cd261198689cef

-- 
classabbyamp

