Received: from mail.bmwiedemann.de (mail.bmwiedemann.de [188.40.142.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0EF33ADB9
	for <distributions@lists.linux.dev>; Mon, 19 Jan 2026 09:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.142.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768813626; cv=none; b=QN4LkNfFYvetjKMutAjZXRqro31plE7cIukKbJQfVbaZ6tHpkbKTVNdEH3uK0yPLmJBB5XmFjVauIy6JTgYNzsWGwPtQH/EoyPB82nYpR3ybQBGcIDvwP1qF6H13TJuC7v1wSE3ETEp3iialW7ht9cHnmgYCk2//yuLcew1qe+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768813626; c=relaxed/simple;
	bh=Z5FR7YBhJISrsFDFBZ97gdHt6jFGvkOTIAqsRzGkWzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=e82nVeO8baFJwWbAsE/iwTUWCRcTtxVnCunJe7Uv41WXikMilEq8IkdkZONyEPcHmKqHN9hBXH+IU/qLI2MF9AsYTluxE/mNhAeXDFuXA+G4Go7zTqrjKy/xvhSX+7EIQ5BH5Nlyv4O/0q/vhAohTb4YyW+NN2EMKwmKPHTGKaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lsmod.de; spf=pass smtp.mailfrom=lsmod.de; dkim=pass (2048-bit key) header.d=lsmod.de header.i=@lsmod.de header.b=NSmPHHio; arc=none smtp.client-ip=188.40.142.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lsmod.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lsmod.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lsmod.de header.i=@lsmod.de header.b="NSmPHHio"
Received: from mail.bmwiedemann.de (localhost [127.0.0.1])
	by mail.bmwiedemann.de (Postfix) with ESMTP id ABB91B2D;
	Mon, 19 Jan 2026 09:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lsmod.de; s=202205;
	t=1768813615; bh=Z5FR7YBhJISrsFDFBZ97gdHt6jFGvkOTIAqsRzGkWzo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=NSmPHHiod6XFR2J6viCa66oOcWzhUyZG4iSA5f1bKRJsJ9LcLigJwW2ery12cS0tq
	 wu5qWAv5Pi5Fvqz8lkAHBZa4VM4do4JXuy2i0XwbXvwElJhoVb8dRNKCZawOqeecNq
	 LGUjzcsFADshuCxTNpTrHbSQUsJ54qRKP7LbBM6eA9VW8yQ2NSwm8tDCTjqyOKezkN
	 pXKRiPVGTk+53YDyAkOw0S3M1HtWiUREKQTzAy5CtOEErJVJ90cNa8XkFGLyJh42ni
	 C2zYu90yIC9IaFy0K3Ra+6bkNKds1w54Cp9yO46OV/8RpAJgyMfUcw+qoxGaY2P00P
	 FvYsY81sRqqjA==
X-Spam-Level: 
Received: from [10.8.5.115] (unknown [10.8.5.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.bmwiedemann.de (Postfix) with ESMTPS;
	Mon, 19 Jan 2026 09:06:54 +0000 (UTC)
Message-ID: <dade563f-e7b8-48a0-9c6d-6fe5c9247fa9@lsmod.de>
Date: Mon, 19 Jan 2026 10:06:54 +0100
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: year 2038 is only 12 years away
To: =?UTF-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>,
 distributions@lists.linux.dev
References: <39728878-8cca-48de-a091-4af3d6de7e4e@lsmod.de>
 <957948e7cc92d61e41c883e1eca3def8ffc2cf19.camel@gentoo.org>
Content-Language: en-US
From: "Bernhard M. Wiedemann" <bernhardout@lsmod.de>
In-Reply-To: <957948e7cc92d61e41c883e1eca3def8ffc2cf19.camel@gentoo.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fgtgW2zCyAFWVTI7pMoTO06q"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fgtgW2zCyAFWVTI7pMoTO06q
Content-Type: multipart/mixed; boundary="------------IqA6gm0TqyBkzdPjpwx4uzPZ";
 protected-headers="v1"
From: "Bernhard M. Wiedemann" <bernhardout@lsmod.de>
To: =?UTF-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>,
 distributions@lists.linux.dev
Message-ID: <dade563f-e7b8-48a0-9c6d-6fe5c9247fa9@lsmod.de>
Subject: Re: year 2038 is only 12 years away
References: <39728878-8cca-48de-a091-4af3d6de7e4e@lsmod.de>
 <957948e7cc92d61e41c883e1eca3def8ffc2cf19.camel@gentoo.org>
In-Reply-To: <957948e7cc92d61e41c883e1eca3def8ffc2cf19.camel@gentoo.org>

--------------IqA6gm0TqyBkzdPjpwx4uzPZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCk9uIDE4LzAxLzIwMjYgMDQuMTgsIE1pY2hhxYIgR8Ozcm55IHdyb3RlOg0KDQo+IFRo
YW5rcyBmb3Igd29ya2luZyBvbiB0aGlzLiAgUGVyc29uYWxseSwgSSB0aGluayB0aGUgYmln
Z2VzdCBwcm9ibGVtIGlzDQo+IHRoYXQgYSBsb3Qgb2YgcGVvcGxlIGRvbid0IHRlc3QgdGhl
aXIgc29mdHdhcmUgb24gMzItYml0IHBsYXRmb3JtcyBhdA0KPiBhbGwuICBBbmQgdGhlIHBy
aW1hcnkgY2F1c2Ugb2YgdGhhdCBwcm9ibGVtIGlzIHRoYXQgYSBsYXJnZSBudW1iZXIgb2YN
Cj4gcG9wdWxhciBDSSBwbGF0Zm9ybXMgZG9uJ3QgcHJvdmlkZSAzMi1iaXQgZW52aXJvbm1l
bnRzIGF0IGFsbCAoYW5kDQo+IHBlb3BsZSBvYnZpb3VzbHkgZG9uJ3QgZ28gb3V0IG9mIHRo
ZWlyIHdheSB0bywgc2F5LCBydW4gYSAzMi1iaXQNCj4gY29udGFpbmVyIG9uIHRvcCBvZiB0
aGUgNjQtYml0IENJIGVudmlyb25tZW50KS4NCg0KQXQgbGVhc3Qgb24gb3VyIChTVVNFKSBz
aWRlLCBtb3N0IGRpc3RyaWJ1dGlvbnMgYXJlIDY0LWJpdC1vbmx5IHRoZXNlIA0KZGF5cyBh
bmQgc29tZSBzdGlsbCBoYXZlIDMyLWJpdCBsaWJzIGZvciB3aW5lLCBzdGVhbSBhbmQgZnJp
ZW5kcy4NClNvIGl0IGlzIG5vdCBleGFjdGx5IGVhc3kgdG8gdGVzdCBpbiBhIDMyLWJpdCBl
bnYuDQoNCkhvd2V2ZXIsIDY0LWJpdCBzb2Z0d2FyZSBjYW4gYWxzbyBiZSBhZmZlY3RlZCBh
cyBtYW55IGltcGxlbWVudGF0aW9ucyANCmRvbid0IGFsd2F5cyB1c2UgdGltZV90IHRvIHN0
b3JlIFVOSVgtdGltZXN0YW1wcy4NCg0KDQpBbmQgSSB0aGluayB0aGVyZSBpcyBzb21ldGhp
bmcgdmVyeSBkaWZmZXJlbnQgbmVlZGVkOg0KV2hlbiB3ZSB3YW50IHRvIGVuc3VyZSBzb2Z0
d2FyZSByZWFsbHkgd29ya3MgYmV5b25kIDIwMzgsIHdlIG5lZWQgdG8gc2V0IA0KdGhlIHN5
c3RlbSBjbG9jayB0byB0aGUgZnV0dXJlIGFuZCB0aGF0IHdpbGwgY2F1c2UgYWxsIFRMUyBj
ZXJ0cyB0byBiZSANCnJlamVjdGVkIGFzIGV4cGlyZWQuDQpTbyBvcGVuc3NsLCBnbnV0bHMg
YW5kIGFsbCBvdGhlciBpbXBsZW1lbnRhdGlvbnMgd291bGQgbmVlZCBhIGNvbW1vbiB3YXkg
DQp0byBoYXZlIGFuIGV4Y2VwdGlvbiB0byBjZXJ0aWZpY2F0ZS1leHBpcnkuDQoNCg0KQ2lh
bw0KQmVybmhhcmQgTS4NCg==

--------------IqA6gm0TqyBkzdPjpwx4uzPZ--

--------------fgtgW2zCyAFWVTI7pMoTO06q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQTykslvYmKwlIQesLNdovN53d8CLgUCaW30LgUDAAAAAAAKCRBdovN53d8CLimm
AQC5raziqlCQhfd3vuih5K349liGQpH2ectH+4CeFRwhmgEAmkbcfECKeUQyCgixvCfnI8xYGEW1
8i6RhgxYPr0QcQ0=
=H8m+
-----END PGP SIGNATURE-----

--------------fgtgW2zCyAFWVTI7pMoTO06q--
