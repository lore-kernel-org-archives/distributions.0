Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22887F9C3
	for <distributions@lists.linux.dev>; Tue,  2 Jan 2024 12:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Zst336+n";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AC0pIg41";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Zst336+n";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AC0pIg41"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 29E7F1FCF7
	for <distributions@lists.linux.dev>; Tue,  2 Jan 2024 12:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1704199451; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
	bh=wyI9yn8hxZHemJojwUOOIS05gvn/LpbdxHSibT7mxmI=;
	b=Zst336+nOQ7iGS6HSK+H9jOMo9lOw739XHkZ1RQ6xApxEaM6IfX2IkmOcszpv5a1iKG3xB
	vLGw2aKQCXkV37r4eIzIAMzQWBBPCkq7sSpTHqNyk0K8aTwZI1diENBI4v4WH+7kYHZVhV
	KYld+0/w6vEVdEfO8Cd7rbiPcuqUMro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704199451;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
	bh=wyI9yn8hxZHemJojwUOOIS05gvn/LpbdxHSibT7mxmI=;
	b=AC0pIg41S4V+/RhdispTnhEspOX94BYafxn+7roOzdCoedjiiZTayw/DnYnLyZ/78ZXMM4
	fACjUVl9EMUI2ZCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1704199451; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
	bh=wyI9yn8hxZHemJojwUOOIS05gvn/LpbdxHSibT7mxmI=;
	b=Zst336+nOQ7iGS6HSK+H9jOMo9lOw739XHkZ1RQ6xApxEaM6IfX2IkmOcszpv5a1iKG3xB
	vLGw2aKQCXkV37r4eIzIAMzQWBBPCkq7sSpTHqNyk0K8aTwZI1diENBI4v4WH+7kYHZVhV
	KYld+0/w6vEVdEfO8Cd7rbiPcuqUMro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704199451;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
	bh=wyI9yn8hxZHemJojwUOOIS05gvn/LpbdxHSibT7mxmI=;
	b=AC0pIg41S4V+/RhdispTnhEspOX94BYafxn+7roOzdCoedjiiZTayw/DnYnLyZ/78ZXMM4
	fACjUVl9EMUI2ZCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B79C1340C
	for <distributions@lists.linux.dev>; Tue,  2 Jan 2024 12:44:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id l3IoABsFlGVMRAAAD6G6ig
	(envelope-from <bwiedemann@suse.de>)
	for <distributions@lists.linux.dev>; Tue, 02 Jan 2024 12:44:11 +0000
Message-ID: <2a182576-0382-45ce-a5b4-b469f154a6de@suse.de>
Date: Tue, 2 Jan 2024 13:44:06 +0100
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: distributions@lists.linux.dev
Content-Language: en-US
From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
Subject: 64-bit time_t
Autocrypt: addr=bwiedemann@suse.de; keydata=
 xsDiBDa4Do4RBADrHxWZStG7ZjH+EKgROa9ISXQi21wGNSPOA0XiAExp4gotZ7yZJwLL2vkt
 71vNDdLoAexG7cU1jq3aK273qGBF4QOzO/OqUmtq3eugIpGR89Fd3gHFTl7ob62iUyu2Rr9p
 4PV/BHwjAVJQac9Oa9gUjk2J6/FD0aERZLY3MTbj0QCg/3vFC6whS1SLF9dOM9EeqWXyJY8E
 ANnSpHRCUBaehuE/p41sozVhvlDcUuI4JQ4QovTQ1YTHSz6yVARoJ2r2cndoVMVgrBCXcCpk
 gZxirB0Qa7ndYVuqliKSPDmxZCnbPT1P7Guq//VF9+pW6Iaubm9VSL1nnW//ICIOUEfYtbHq
 kpdVdG8sPzBrry7qfqwhOgch6R2FBADevQvDx3CEEEXONlTMNhgW0EjlWfLuHZAyOfDTWCub
 iODbcOHw+e/tTljqSeqSHJmp4H/3UADZd6GIy2BMYJX10mlqJYi07f8U17y/GBozPyLzuZd5
 eFSpmbaJT6iZ84BAG6PIEXugO31A9hvAANUUzEK/K4rsfVH14af9KaAJLs0qQmVybmhhcmQg
 TS4gV2llZGVtYW5uIDxid2llZGVtYW5uQHN1c2UuZGU+wmEEExEIACEFAk0Qo7MCGwMFCwkI
 BwMFFQoJCAsFFgIDAQACHgECF4AACgkQSTYLOx37oWTS8gCg/cwbku8C8/WZ/3UvydSgHAt9
 +LwAoKwqpGwEYs8Ma11lM6rTtomunKL7zsNNBDa4FrIQD/4/V5EEDWT1IlJhGu05woTvkFCc
 gD8L11bX+xP+IWhpez12nuGLcDwH1WJj510YadRe1eLu6eoFgQa0rkowWeyjrA24vbfeVBnC
 qotuKfd924clVippfysI6SqXHjU/X4/xayAPfpIY/tf+xN/UEdcTThv/vWUnIWL6OxtbnNlB
 BRZM5HjbRbhap7IMkAe7+Z+fjS20/iqd7qcWx0oBFjCWCSoEBdyg2WFp1J2sE2ACWSrmU3N2
 +BZ/+xHlWlm9WOUsp70RnXXvCu2U8CmdIxMp397AxjMpPtwNLR6zB08W0ewRGTaHleoVPFwY
 GyNPqFrXXdxPScToNqYCi9rhGXVqj9/BbMddBj6uf1MubW5aayEnRfXwtUZYind18vFh0qgj
 xTVMWiQ/ph7aoqCAWpwuQMx1lWtvuiKw1k6C34JFrNpeXGyiZN/7cCWwwkfmIHe3d0QgCxsR
 j1nMg5eVEK7RWIgu3A/Ff4aYZ4gRrh8HSk31EGEEGuRaTj9nebFI6wxZOC/SGmpmCijxcfnK
 sGBjup54Wdv5Cb5viJyxwAkSCUFRfh3J5a1DpKI4pD/Ew0qwfYsB9BdOFObBfo2APXD/92tS
 qRdsEys+cPWm+J80o9b+JelPOeJygGUSRfATYjz6/q/gdGjz8XA9Dwp4RAyrjd1wC4txqnIi
 yq5kRIxMFwACAg/+IpbFy+a/b5tL8C7L3lWGHoWcBkQU3F0GgP8G7V9wXKd7AGy4gkMvEeXU
 LJjZJJwfMVoxCCSK6DiMJig6sLux+qDLp73opskLH9Qj3lTCHcqCb9PnWDeLhsIimS9GcNwP
 7arwh/92Xo6AAvnVKt9QJq4aW6Vf6PVyuWKZzS1lQX0gw7hH0zkg1C6Qeba+A+sNbKnXDFj6
 cSDSiVCK7PwIkahapuP9N6IaVmHEKgeGVTyZZm7e9urs62XrcrcocH7+EV9Ky9kF3DrOK0Lb
 wm5tvIbSgq5hg5fdvBCOFGDUt56nJmTuNBaE7HiCQ63z1YdUPV9O/yuys85O/5xxcLk3mlxW
 Gbgs0CBotl+PnJ7wNMVZNzq+9bOGqabxoVaM1RO+BdPog4h81+uM0UJW6luJLQ1CNymdoPKS
 vOFK3UAsgj2WLeuKyvnYRJxEmUrtjmSU1JoffMlSuble01yP076N0PvDsfxwrEuW/i1wfYZ5
 KNNHw5RpW83FY6UYGgSHccfs8DDs1NChI2ShuCVdOpu/TX/6BUUtPEVQsW1O+7S6EX/bto22
 0PN7j7QA8GmLMb02RLnlietf73t0A59+mK6vAD4Ccb2yckpVEENtEHqxwH1JLPW5nggxmOgl
 3KyKjHCGPm6UanugKIEIf4rgxrYzu/PEvk3CI5q/k5axFCPPZ/vCTgQYEQIABgUCNrgWsgAS
 CRBJNgs7HfuhZAdlR1BHAAEBn/EAoK+4TcGOJD3w02lSkjaZ8dws4140AJ9LR1WGvnu6Xs+0
 12bW2FfpiwAGOQ==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VZgTCBZjPGjTIwpxbxValdhl"
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.31 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	 HAS_ATTACHMENT(0.00)[];
	 TO_DN_NONE(0.00)[];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MIME_BASE64_TEXT(0.10)[];
	 MX_GOOD(-0.01)[];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-0.01)[46.53%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 PREVIOUSLY_DELIVERED(0.00)[distributions@lists.linux.dev];
	 RCPT_COUNT_ONE(0.00)[1];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Zst336+n;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AC0pIg41
X-Spam-Score: -3.31
X-Rspamd-Queue-Id: 29E7F1FCF7

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VZgTCBZjPGjTIwpxbxValdhl
Content-Type: multipart/mixed; boundary="------------8y0bZgMY1sTyL51uQb8xckmL";
 protected-headers="v1"
From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
To: distributions@lists.linux.dev
Message-ID: <2a182576-0382-45ce-a5b4-b469f154a6de@suse.de>
Subject: 64-bit time_t

--------------8y0bZgMY1sTyL51uQb8xckmL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SW4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZGlzdHJpYnV0aW9ucy82NjE0NzcyLjY3MGtE
N2FzRTJAbmltZXMvDQpCcnVubyBIYWlibGUgd3JvdGU6DQoNCj4gUmVnYXJkaW5nIHRoZSBk
aXN0cm8gcGVvcGxlOg0KPiANCj4gICBUaGUgb3V0Y29tZSBvZiBhIGRpc2N1c3Npb24sIGFi
b3V0IGEgbW9udGggb3IgdHdvIGFnbywgd2FzIEFGQUlVIHRoYXQNCj4gICBMaW51eC94ODYg
YW5kIExpbnV4L2FybSBkaXN0cm9zIGhhdmUgYSBjaG9pY2UgYmV0d2Vlbg0KPiAgICAgKGEp
IGVuYWJsaW5nIDY0LWJpdCB0aW1lX3QgZm9yIGFsbCBwYWNrYWdlcywgdGh1cyBicmVha2lu
ZyBBQkkNCj4gICAgICAgICBjb21wYXRpYmlsaXR5IG9uY2UgYW5kIGJlY29taW5nIHllYXIg
MjAzOCBzYWZ0LCBvcg0KPiAgICAgKGIpIHN0YXlpbmcgd2l0aCB0aGUgMzItYml0IHRpbWVf
dCwgYW5kIGFubm91bmNpbmcgdGhhdCB0aGVpcg0KPiAgICAgICAgIGRpc3RybyB3aWxsIHN0
b3Agd29ya2luZyBpbiAyMDM4Lg0KPiAgIEFuIGluY3JlbWVudGFsIG9yIHBhcnRpYWwgbW92
ZSB0byA2NC1iaXQgdGltZV90IHdvdWxkIGJlIHRvbyBleHBlbnNpdmUsDQo+ICAgZGlkIHRo
ZSBkaXN0cm8gcGVvcGxlIHNheS4NCg0Kb3Igb3B0aW9uIGMpDQpPbmUgbGVzcyB0cm91Ymxl
c29tZSBzb2x1dGlvbiBjb3VsZCBiZSB0byBwYXRjaCBnbGliYyB0byByZWRlZmluZSB0aGUg
DQozMi1iaXQgdGltZV90IGFzIHVuc2lnbmVkIHNvIHRoYXQgQUJJcyBjb3VsZCByZW1haW4g
Y29tcGF0aWJsZSBhbmQgYXQgDQp0aGUgc2FtZSB0aW1lIGl0IHdvdWxkIHN1cHBvcnQgdGlt
ZXN0YW1wcyB1bnRpbCAyMTA2Lg0KVGhvdWdoIHRoYXQgd291bGQgYnJlYWsgYW55IGFwcGxp
Y2F0aW9uIHRoYXQgdXNlcyB0aW1lX3QgZm9yIGRhdGVzIA0KYmV0d2VlbiAxOTAxIGFuZCAx
OTcwIChhcmUgdGhlcmUgYW55PykuDQpEbyBJIG1pc3MgYW55IG90aGVyIGRvd25zaWRlcz8N
ClRoaXMgc2VlbXMgdG8gYmUgdGhlIG9ubHkgb3B0aW9uIHRoYXQgYWxsb3dzIGxlZ2FjeS1i
aW5hcmllcyB0byBrZWVwIA0Kd29ya2luZyBhZnRlciAyMDM4Lg0KDQoNCm9wdGlvbiBkKSB3
b3VsZCBiZSB0byBhZGFwdCBhbGwgbGlicmFyaWVzIHRoYXQgaGF2ZSB0aW1lX3QgaW4gdGhl
aXIgQVBJIA0KdG8gaGF2ZSBib3RoIDMyLWJpdCBhbmQgNjQtYml0IHRpbWVfdCB2YXJpYW50
cy4gVGhlIGZvcm1lciBmb3IgDQpjb21wYXRpYmlsaXR5IHdpdGggb2xkIGJpbmFyaWVzIGFu
ZCB0aGUgbGF0dGVyIGZvciBuZXcgZnV0dXJlLXByb29mIA0KYmluYXJpZXMuIFRoaXMgY291
bGQgcHJvdmlkZSBhIHNtb290aCB0cmFuc2l0aW9uIGJlY2F1c2Ugbm90IGFsbCANCjNyZC1w
YXJ0eSBiaW5hcmllcyBjYW4gYmUgcmVidWlsdC4NClRoZSB0cm91YmxlIGhlcmUgd291bGQg
YmUgdGhlIGVmZm9ydCBmb3IgdGhlIGxpYnJhcmllcyB0byBwcm92aWRlIDIgDQp2YXJpYW50
cyBhbmQgZm9yIGNhbGxlcnMgdG8gc2VsZWN0IHRoZSByaWdodCB2YXJpYW50Lg0KDQoNCkNp
YW8NCkJlcm5oYXJkIE0uDQo=

--------------8y0bZgMY1sTyL51uQb8xckmL--

--------------VZgTCBZjPGjTIwpxbxValdhl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQTykslvYmKwlIQesLNdovN53d8CLgUCZZQFFgUDAAAAAAAKCRBdovN53d8CLsMd
APoCec4sfZvxYNbKD+0MHH5ksW+4GnFTnrKHKRst+iTwqgEAjtoaimyd1rhJwLZO+0DFeZh1YjNg
HFLXfOtvxxu0Lw0=
=KJHX
-----END PGP SIGNATURE-----

--------------VZgTCBZjPGjTIwpxbxValdhl--
