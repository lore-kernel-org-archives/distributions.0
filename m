Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349B916B397
	for <distributions@lists.linux.dev>; Mon, 22 Jul 2024 13:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721655151; cv=none; b=bml8BBeuXmy2vK80UAabDegcaV0TZA4tPD262WaL91S9eOsUYmMas5HpjX9qBzEomaF1rIiaZnkoJDxoSgCVEBb7TV+1VPBtRCF/MKCo2MKI4iSxjP/EFY4h+zeaukrqrlcm7gzxiBQAO6Mw5VX6VTJcHZ/f9RT4NpGhFyTcjH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721655151; c=relaxed/simple;
	bh=XXLGwvoIpm1JOdZWfh7Sl7OB2L55H1pgv7BfCED5Dkc=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=YWT5zukn3189QPR89hbyck88eDWwHYyDthbGFZsBMcXTk0G5UDRCGGPfJjy9Sne0jnsPZBAfINLaWLLlxj/dYRTPbF+iRjrTmkc30SMdscVFFvCxpgv2bKX0bOZhfNJTIEB+chUSMwGzjNmANUbAFcmPApammA5m1yuv+MgIwTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Message-ID: <3efaeed6-3277-4355-ba21-4389b26d35cb@gentoo.org>
Date: Mon, 22 Jul 2024 16:32:25 +0300
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: distributions@lists.linux.dev
From: Joonas Niilola <juippis@gentoo.org>
Subject: Firefox-128 "Privacy-Preserving Attribution" and distribution
 defaults
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Bk8IqpMgqPLUrdj10vjsvDdV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Bk8IqpMgqPLUrdj10vjsvDdV
Content-Type: multipart/mixed; boundary="------------hvgxnQrzcLG1JNMdvm9FQLIG";
 protected-headers="v1"
From: Joonas Niilola <juippis@gentoo.org>
To: distributions@lists.linux.dev
Message-ID: <3efaeed6-3277-4355-ba21-4389b26d35cb@gentoo.org>
Subject: Firefox-128 "Privacy-Preserving Attribution" and distribution
 defaults

--------------hvgxnQrzcLG1JNMdvm9FQLIG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hey,

so probably everyone has heard about Mozilla's "PPA", or
"Privacy-Preserving Attribution" addition to Firefox-128.0 release.
Quite rightfully the Internet has been furious about it, but Mozilla did
communicate afterwards with their intentions.
  https://andrewmoore.ca/blog/post/mozilla-ppa/

https://www.reddit.com/r/firefox/comments/1e43w7v/a_word_about_private_at=
tribution_in_firefox/
  https://support.mozilla.org/en-US/kb/privacy-preserving-attribution

So far I've only seen Alpine toggling this option off with their Firefox
package. Most likely other distro maintainers out there have received
inquiries about toggling it off from your users, and most likely you
distro maintainers have pondered what to do with it even without
requests from your users. Therefore I'm asking: How are you feeling
about the option overall? Should "all" distributions turn it off by
default for our users? That'd send a message to Mozilla, but the result
could be that next time the option isn't toggleable...

Here's an upstream tracker about PPA:
https://bugzilla.mozilla.org/show_bug.cgi?id=3D1900929

-- juippis

--------------hvgxnQrzcLG1JNMdvm9FQLIG--

--------------Bk8IqpMgqPLUrdj10vjsvDdV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGTBAEBCgB9FiEEltRJ9L6XRmDQCngHc4OUK43AaWIFAmaeX2pfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDk2
RDQ0OUY0QkU5NzQ2NjBEMDBBNzgwNzczODM5NDJCOERDMDY5NjIACgkQc4OUK43A
aWK5cAgAuCeVoj5VePagvp9jKIphiWHCMVeIBvSiHpBiREr1V4qxEvfjJed8ZzlW
N8t7qvgLlpppoANLL3rFrIDiHXEi8IcGZxp48wfaZjaMhkEVe6HMshS+oW8fhNJa
1pSZwiVTRON43px9aodqgUeQ7pISoLLu7+LevOWpVWlGF1AvLRxMFFlHDRjcOYBH
dMlP47STZHUV3O3GM3y6ww5FZOG69HvP9Mj/bx4GnFhmMw4XMrIyVymQgyJho+Ph
AP76MM349m4M0m7vlQY+TYmbXuTlcd4dXG1zH2b5Sxh70zvbBDM8UnhFjuMo6+pn
WZOzFtZeieW/O3RmgoIzrY59S8Dayg==
=LL9k
-----END PGP SIGNATURE-----

--------------Bk8IqpMgqPLUrdj10vjsvDdV--
