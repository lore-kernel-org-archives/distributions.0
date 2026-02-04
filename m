Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522163B95E5
	for <distributions@lists.linux.dev>; Wed,  4 Feb 2026 10:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770200771; cv=none; b=H6iJ8uh5cxv34zaT91M8JKEEdpxrROY/BAh+B+LOfY5bqYVDekESH522cGKyfF/1KvUjM1G6R+Jh6/FWEYR4+ZRZVmKRph+PDAgzQNOXm0zuGzOY15g6YWDqoWJF4ZbCzBVpFY5dcVthz6xgcRjo59xRtga7+IpEs6jaD+D/B68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770200771; c=relaxed/simple;
	bh=kMeKOBEE31WA67wCx/FI+4JeyQv/s9BSUw0fvcq4mkM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fS/qRttbGdpGPorhullI/eJpL1v1mDezAq0K4Kx7Nc8QcYm3lbGliMshQl1VGJAj96vlSVNaaVP5+ckOAwVtrCzEyWGEu9cjEkPyohOubNAYfWUu8K0dPt9RC9sx2BabN1oL/f0KLGJSKCFMUtV3Eq1oxp6MmaOjmCgWbNmpIcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=igKyxkzj; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="igKyxkzj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=BIlQThxiOzN9YFJjNxFg1u4zg/Q0kEbqCHzrZ2Hy9ZU=; t=1770200770;
	x=1770805570; b=igKyxkzjX/N8R9Rng/S4WgKoEmHvwZ3N4rAlPIdfeENxLJd+PCTD2KIys2ocQ
	IkiXR7MebbfAo0S+oG/zsQf5NnIAwxfNSDPchLkLmY86yLOLsFF/cqBDc1HO4l2ZcAOV55EdOknc4
	MrJa0VSepRhOQXgZJFz2bCLjiKlrpRm4NOZhVifHlmEu6TLexE1y6Ipm/+evhBPtD+ySzsm7eDgp3
	+SVzwz54C37Q26MW7GXc73X5BQ10JxgwmbA3I8aju7XjmuD4chH7etAY3OfDagJ7xFhiwWj1S/SNf
	eohvnnCI3l/wCath430yaTJVwwexDVA0hZmSq2gTuTHfdCIGbA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vna1W-00000000SFa-0w3i; Wed, 04 Feb 2026 11:22:14 +0100
Received: from p5dc55f29.dip0.t-ipconnect.de ([93.197.95.41] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vna1W-00000003Jmj-03En; Wed, 04 Feb 2026 11:22:14 +0100
Message-ID: <bce1c7d6cdae9391cf70af226775e03c8d7c3c75.camel@physik.fu-berlin.de>
Subject: Re: year 2038 is only 12 years away
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
Cc: "Andreas K. Huettel" <dilfridge@gentoo.org>, 
	distributions@lists.linux.dev, "Bernhard M. Wiedemann"
 <bernhardout@lsmod.de>
Date: Wed, 04 Feb 2026 11:22:13 +0100
In-Reply-To: <e2130c59-f387-4337-b9f3-7788a805b9ea@suse.de>
References: <39728878-8cca-48de-a091-4af3d6de7e4e@lsmod.de>
	 <47880055.fMDQidcC6G@noumea> <e2130c59-f387-4337-b9f3-7788a805b9ea@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Bernhard,

On Wed, 2026-02-04 at 11:15 +0100, Bernhard M. Wiedemann wrote:
>=20
> On 2/2/26 11:52 AM, Andreas K. Huettel wrote:
> > FWIW Gentoo is ready for testing 64bit time_t on 32bit architectures
>=20
> It is worth remembering, that while this is necessary, there are still=
=20
> remaining issues, especially with code that handles time entries from/to=
=20
> files or network, because the conversion from/to time_t from binary or=
=20
> ASCII formats might involve 32-bit int values, e.g. through a call of=20
> atoi(str) or with the perl/python pack function.
>=20
> I already found dozens of these on x86_64 with slight testing.
>=20
> some examples are
> https://github.com/memcached/memcached/pull/927
> https://github.com/openSUSE/libzypp/issues/559
> https://github.com/zopefoundation/ZEO/issues/245
> https://gitlab.com/freepascal.org/fpc/source/-/issues/40552
> https://jira.mariadb.org/browse/MDEV-32188
>=20
>=20
> And that other type of issues (not the only one of this kind)
> https://github.com/libarchive/libarchive/pull/2742
> .

Thanks a lot for your work on this.

Since Debian already has switched its 32-bit targets to time64_t (except fo=
r i386),
have you considered running additional tests on Debian's armhf target?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
