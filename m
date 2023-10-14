Received: from mx1.voidlinux.org (f-sfo3-us.m.voidlinux.org [143.198.238.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41322A46
	for <distributions@lists.linux.dev>; Sat, 14 Oct 2023 03:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=voidlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=voidlinux.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=voidlinux.org header.i=@voidlinux.org header.b="dS/o9N84"
DKIM-Signature: a=rsa-sha256; bh=r+btgspRNGvLeeAklZgtIeMtgyCbwffEJ6HxBCUk/S0=;
 c=relaxed/relaxed; d=voidlinux.org;
 h=Subject:Subject:Sender:To:To:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@voidlinux.org; s=default; t=1697253320; v=1; x=1697685320;
 b=dS/o9N8466RoFRdTsNm594v0UcDu2o+xbZ4nzFuLqhmITsvCummr4eu6jKLUgPQCT7qUMjW8
 c7OzZc+VFyB/atUXg/2bJu73MpCj8nceQYC/pu/rOTZJ2KLruydvmHL51/6DqsMfj/e4mPcSVt3
 DK5RN67v7Vq8Sh9kD7UUcItsaZXAj6O+vEEBwrNq9lhqQDjKL6HMBh6QNt9BCyL/ZsXviueqB9N
 VZqGpUBgNB2rOf44xcmVlzyJ/eaQfTucCDb1+PP1ZvHcB1PJfQyngyjtvYGPLD3t9OGcIVHCnGq
 3G/kk0rMuE2o0Erxdf5u2geGyRMsHwI6aAQQbV7/hAhBg==
Received: by mx1.voidlinux.org (envelope-sender <abby@voidlinux.org>) with
 ESMTPS id de73c071; Sat, 14 Oct 2023 03:15:20 +0000
Date: Fri, 13 Oct 2023 23:15:16 -0400
From: classabbyamp <abby@voidlinux.org>
To: Sam James <sam@gentoo.org>, distributions@lists.linux.dev
Subject: Re: Integration work needed for >=xdg-desktop-portal-1.18.0
User-Agent: K-9 Mail for Android
In-Reply-To: <87sf6dap1g.fsf@gentoo.org>
References: <87sf6dap1g.fsf@gentoo.org>
Message-ID: <5CC94C02-DF99-4A13-9576-58B0F809CA63@voidlinux.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On October 13, 2023 10:55:21 p=2Em=2E EDT, Sam James <sam@gentoo=2Eorg> wr=
ote:
>Hi all,
>
>xdg-desktop-portal-1=2E18=2E0 changes its behaviour if no portals are
>configured by the user, installed portals, or desktop environments=2E
>
>Simon has a good summary at https://bugs=2Edebian=2Eorg/cgi-bin/bugreport=
=2Ecgi?bug=3D1050911#35
>for what one needs to do=2E
>
>I've filed a Gentoo tracker bug at https://bugs=2Egentoo=2Eorg/915704
>with a list of things I'm aware of that need handling, but I'll
>include a list here of some useful references:
>* https://github=2Ecom/flatpak/xdg-desktop-portal/issues/1017
>* https://github=2Ecom/flatpak/xdg-desktop-portal/issues/1077
>* https://github=2Ecom/flatpak/xdg-desktop-portal/issues/1102
>
>Thanks to abby from Void and to psykose as well for the heads up=2E
>
>best,
>sam
>


On Void we're shipping a default portals=2Econf to ensure all users have a=
t least some working portal, regardless of WM or DE (assuming they installe=
d one of the backends):

    [preferred]
    default=3D*

in the lowest-precedence location, /usr/share/xdg-desktop-portal=2E

More of the rationale behind this is available in the commit:
https://github=2Ecom/void-linux/void-packages/commit/b4c404aac0af3ced08671=
a8840cd261198689cef
