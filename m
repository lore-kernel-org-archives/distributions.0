Received: from mail.bmwiedemann.de (mail.bmwiedemann.de [188.40.142.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB31500972
	for <distributions@lists.linux.dev>; Sun, 18 Jan 2026 02:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.142.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768703759; cv=none; b=PhoEMbrFxOk71Z+0/LlJTTRhIGisyc+2jkV2/+aRgqHH/+/aKjf55DFLd0miBDQ0P4T3f+CpqOMd4YYWX4rP0pUrFrMrlAiBFkJmL7FnINAdHCT85TsYN7AdbVZelAdc0krOcp4IzB6QhgF4KOpUatiUWqq4vlz78N2GopSU7hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768703759; c=relaxed/simple;
	bh=lbjcBETg1PxIebTJXzSfvsA2+zVlGsL5awED3Q9FXCs=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=rGlXoTyYE8HUwyX2WnDRx9HFde77O4HSvaK2rlwpggNR9F46IrQy4hzy0uK6DWobPNgGq0Lv5ndzcwJgKWiu3iXBLL40c+Z5yYiwvQcdCjH1Qj+NxnLT7CdVQDggqyNPms4e8CWwkVfeZBiDdHpYpHyTXgPEuNCxwp9RBdnVIpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lsmod.de; spf=pass smtp.mailfrom=lsmod.de; dkim=pass (2048-bit key) header.d=lsmod.de header.i=@lsmod.de header.b=c6n3iOf7; arc=none smtp.client-ip=188.40.142.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lsmod.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lsmod.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lsmod.de header.i=@lsmod.de header.b="c6n3iOf7"
Received: from mail.bmwiedemann.de (localhost [127.0.0.1])
	by mail.bmwiedemann.de (Postfix) with ESMTP id 1A807919
	for <distributions@lists.linux.dev>; Sun, 18 Jan 2026 02:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lsmod.de; s=202205;
	t=1768703295; bh=lbjcBETg1PxIebTJXzSfvsA2+zVlGsL5awED3Q9FXCs=;
	h=Date:To:From:Subject:From;
	b=c6n3iOf7fas2uIrOYE82zTjn/JPIOWc5CGCqrL2I3y4E+kT/nAOe5jixT/G835d46
	 nI4L6SxKL4valXzy0N03YXMqqM0TzVV16vxRJcrhu+RDdCgIxcZVJ3eAEv3IIyjPU3
	 VyPGIW/1fqkuivqESmY/sWNZEd+ySyHYJq1J41Cij/Bd90YQUzVUNUkpJtvfe9zDa/
	 wBZI6j6yWuROX9FzVJcAJfEqFN6eelQVCzipwtzh7WGzEuUgyv5dUQeAtXSAKAUW9U
	 UVr7NWxrUEkPRxKohzmjci8AAjLwHFKgnz4RlWnIefII0JU/IdjyPvBwnvRB97l7iz
	 yfCc4+bakdrtA==
X-Spam-Level: 
Received: from [10.8.5.115] (unknown [10.8.5.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.bmwiedemann.de (Postfix) with ESMTPS
	for <distributions@lists.linux.dev>; Sun, 18 Jan 2026 02:28:14 +0000 (UTC)
Message-ID: <39728878-8cca-48de-a091-4af3d6de7e4e@lsmod.de>
Date: Sun, 18 Jan 2026 03:28:13 +0100
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: distributions@lists.linux.dev
From: "Bernhard M. Wiedemann" <bernhardout@lsmod.de>
Subject: year 2038 is only 12 years away
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------G4R0Hd3Eh808uj0M9SfjGy0F"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------G4R0Hd3Eh808uj0M9SfjGy0F
Content-Type: multipart/mixed; boundary="------------rLGxV2AKng9dtPvNmZU9AIu0";
 protected-headers="v1"
From: "Bernhard M. Wiedemann" <bernhardout@lsmod.de>
To: distributions@lists.linux.dev
Message-ID: <39728878-8cca-48de-a091-4af3d6de7e4e@lsmod.de>
Subject: year 2038 is only 12 years away

--------------rLGxV2AKng9dtPvNmZU9AIu0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

VG9kYXkgaXMgWTJLMzggY29tbWVtb3JhdGlvbiBkYXkgVC0xMg0KDQpJIGhhdmUgd3JpdHRl
biBiZWZvcmUgYWJvdXQgaXQgbXVsdGlwbGUgdGltZXM6DQpodHRwczovL3d3dy5yZWRkaXQu
Y29tL3IvbGludXgvY29tbWVudHMvMTBmcXgxdC90b2RheV9pc195MmszOF9jb21tZW1vcmF0
aW9uX2RheS8NCmh0dHBzOi8vd3d3LnJlZGRpdC5jb20vci9saW51eC9jb21tZW50cy8xOWE5
NWNsL3RvZGF5X2lzX3kyazM4X2NvbW1lbW9yYXRpb25fZGF5X3QxNC8NCmh0dHBzOi8vd3d3
LnJlZGRpdC5jb20vci9saW51eC9jb21tZW50cy8xaTRvdHBvL3RvZGF5X2lzX3kyazM4X2Nv
bW1lbW9yYXRpb25fZGF5X3QxMy8NCmh0dHBzOi8vd3d3LnJlZGRpdC5jb20vci9saW51eC9j
b21tZW50cy94anRmM3EvaW5fdGhlX3llYXJfMjAzOC8NCg0KSXQgaXMgd29ydGggcmVtZW1i
ZXJpbmcgdGhhdCBpbiAxMiB5ZWFycyBmcm9tIG5vdywgYWZ0ZXIgDQoyMDM4LTAxLTE5VDAz
OjE0OjA3IFVUQywgdGhlIFVOSVggRXBvY2ggd2lsbCBub3QgZml0IGludG8gYSBzaWduZWQg
DQozMi1iaXQgaW50ZWdlciB2YXJpYWJsZSBhbnltb3JlLiBUaGlzIHdpbGwgbm90IG9ubHkg
YWZmZWN0IGk1ODYgYW5kIA0KYXJtdjcgcGxhdGZvcm1zLCBidXQgYWxzbyB4ODZfNjQgd2hl
cmUgaW4gbWFueSBwbGFjZXMgMzItYml0IGludHMgYXJlIA0KdXNlZCB0byBrZWVwIHRyYWNr
IG9mIFVOSVggdGltZSB2YWx1ZXMuDQoNCkxXTiB3cm90ZSBhYm91dCBpdDogaHR0cHM6Ly9s
d24ubmV0L0FydGljbGVzLzkzODE0OS8NCg0KVGhpcyBpcyBub3QganVzdCB0aGVvcmV0aWNh
bC4gQnkgc2V0dGluZyB0aGUgYnVpbGQgc3lzdGVtIGNsb2NrIHRvIDIwMzgsIA0KSSBmb3Vu
ZCBtYW55IGZhaWx1cmVzIGluIGJ1aWxkcyBhbmQgdGVzdHN1aXRlcyBvZiBvdXIgb3BlblNV
U0UgcGFja2FnZXM6DQoNCiogKGZpeGVkKSBjbWFrZSBoYWQgYSB0ZXN0IGZhaWx1cmUgYmVj
YXVzZSBvZiBhbiBpc3N1ZSBpbiBsaWJhcmNoaXZlDQogICBodHRwczovL2dpdGxhYi5raXR3
YXJlLmNvbS9jbWFrZS9jbWFrZS8tL2lzc3Vlcy8yNzI2Mw0KICAgaHR0cHM6Ly9naXRodWIu
Y29tL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS9wdWxsLzI3NDINCiogKGZpeGVkKSBpdCBjYW4g
c2NyZXcgeW91ciB1cHRpbWUNCiAgIGh0dHBzOi8vZ2l0bGFiLmNvbS9wcm9jcHMtbmcvcHJv
Y3BzLy0vaXNzdWVzLzM2Mg0KKiBicmVhayBtZXJjdXJpYWwNCiAgIGh0dHBzOi8vYnoubWVy
Y3VyaWFsLXNjbS5vcmcvc2hvd19idWcuY2dpP2lkPTY3NzgNCiogYnJlYWsgWm9wZS9aRU8N
CiAgIGh0dHBzOi8vZ2l0aHViLmNvbS96b3BlZm91bmRhdGlvbi9aRU8vaXNzdWVzLzI0NQ0K
KiBhZmZlY3QgbmVvdmltDQogICBodHRwczovL2dpdGh1Yi5jb20vbmVvdmltL25lb3ZpbS9p
c3N1ZXMvMzI0MjkNCiogZmFpbCBnY2MxNCBjb21waWxhdGlvbg0KICAgaHR0cHM6Ly9idWd6
aWxsYS5vcGVuc3VzZS5vcmcvc2hvd19idWcuY2dpP2lkPTEyMjMxNjkNCiogZGphbmdvLWdy
YXBocWwtand0DQogICBodHRwczovL2dpdGh1Yi5jb20vZmxhdm9ycy9kamFuZ28tZ3JhcGhx
bC1qd3QvaXNzdWVzLzMxOA0KKiBweXRob24tc3RkbnVtDQogICBodHRwczovL2dpdGh1Yi5j
b20vYXJ0aHVyZGVqb25nL3B5dGhvbi1zdGRudW0vaXNzdWVzLzQzMQ0KKiBweXRob24tMy4x
Mg0KICAgaHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi9jcHl0aG9uL2lzc3Vlcy8xMjQ4NTEN
CiogKGZpeGVkKSBsaWJ6eXBwDQogICBodHRwczovL2dpdGh1Yi5jb20vb3BlblNVU0UvbGli
enlwcC9pc3N1ZXMvNTU5DQoqIChmaXhlZCkgcHl0aG9uLWV4aXYyDQogICBodHRwczovL2dp
dGh1Yi5jb20vamltLWVhc3RlcmJyb29rL3B5dGhvbi1leGl2Mi9pc3N1ZXMvNDQNCiogKGZp
eGVkKSBjY2FjaGUNCiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9jY2FjaGUvY2NhY2hlL2lzc3Vl
cy8xNTI0DQoqIChmaXhlZCkgdGFza3dhcnJpb3INCiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9H
b3RoZW5idXJnQml0RmFjdG9yeS90YXNrd2Fycmlvci9wdWxsLzMwNTINCiogYW5kIG1hbnkg
bW9yZQ0KDQpBZGRpdGlvbmFsbHksIHNvbWUgcHJvdG9jb2xzIGxpa2UgU09BUC9YTUwtUlBD
IGFuZCBTTk1QIHVzZSAzMi1iaXQgDQp2YWx1ZXMsIHNvIGltcGxlbWVudGF0aW9ucyBoYXZl
IHRvIGJlIHNtYXJ0IGluIGhvdyB0aGV5IHRyYW5zcG9ydCANCnRpbWVzdGFtcHMuDQoNClRo
ZSB1bmRlcmx5aW5nIGlzc3VlIGlzIHRoYXQgMHg3ZmZmZmZmZiBha2EgMjE0NzQ4MzY0NyBp
cyB0aGUgaGlnaGVzdCANCnZhbHVlIHRoYXQgY2FuIGJlIHN0b3JlZCBpbiBhIHNpZ25lZCAz
Mi1iaXQgaW50ZWdlciB2YWx1ZS4gQW5kIGBkYXRlIC11IA0KLWQgQDIxNDc0ODM2NDdgIHRl
bGxzIHlvdSB3aGVuIHRoYXQgd2lsbCByb2xsIG92ZXIuDQoNCkkgdGhpbmssIHNvbWUgZGlz
dHJpYnV0aW9ucyBhbHJlYWR5IHN0YXJ0ZWQgdG8gY29tcGlsZSB0aGVpciAzMi1iaXQgY29k
ZSANCndpdGggYC1EX1RJTUVfQklUUz02NCAtRF9GSUxFX09GRlNFVF9CSVRTPTY0YCBidXQg
dGhhdCBpcyBvbmx5IHBhcnQgb2YgDQp0aGUgc29sdXRpb24uDQpDb2RlIHRoYXQgaGFuZGxl
cyB0aW1lc3RhbXBzIHJlZ3VsYXJseSBnZXRzIGFkZGVkIG9yIHJld3JpdHRlbiBhbmQgZXZl
cnkgDQp0aW1lLCBkZXZlbG9wZXJzIG5lZWQgdG8gcmVtZW1iZXIgdG8gbm90IHVzZSBgaW50
YCB0aGVyZSAobm9yIGBsb25nYCBvbiANCjMyLWJpdCBzeXN0ZW1zKSBidXQgYGxvbmcgbG9u
Z2Agb3IgYGludDY0X3RgIG9yIGp1c3QgYHRpbWVfdGAuIEkgbXlzZWxmIA0Kc2VudCBQUnMg
aW4gdGhlIHBhc3QgdXNpbmcgYGF0b2xgIGZvciB0aW1lc3RhbXBzLiBXZSBzaG91bGQgbm90
IGRvIHRoYXQgDQphbnltb3JlLiBzYW1lIGZvciBgc2NhbmYoIiVsIilgLg0KDQpJIG9wZW5l
ZCBhIGRpc2N1c3Npb24gd2l0aCB0aGUgZ2NjIGRldnMgYXQNCmh0dHBzOi8vZ2NjLmdudS5v
cmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTExODMyNiBhYm91dCBhZGRpbmcgDQp3YXJu
aW5ncyBmb3IgaW50PT50aW1lX3QgY29udmVyc2lvbnMuIEl0IGRpZCBub3QgeWV0IGdldCB2
ZXJ5IGZhciwgYnV0IA0KYXQgbGVhc3QgYSBjb2xsZWd1ZSBhdCBTVVNFIG1hZGUgYSBQb0Mg
cGF0Y2ggYW5kIGlkZW50aWZpZWQgc29tZSBjb3JuZXIgDQpjYXNlcy4NCg0KDQoNCg0KQWxz
byBwb3N0ZWQgYXQNCg0KaHR0cHM6Ly93d3cucmVkZGl0LmNvbS9yL2xpbnV4L2NvbW1lbnRz
LzFxZncxN2EvdG9kYXlfaXNfeTJrMzhfY29tbWVtb3JhdGlvbl9kYXlfdDEyLw0K

--------------rLGxV2AKng9dtPvNmZU9AIu0--

--------------G4R0Hd3Eh808uj0M9SfjGy0F
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQTykslvYmKwlIQesLNdovN53d8CLgUCaWxFPQUDAAAAAAAKCRBdovN53d8CLuTQ
AQDxpq70wzU3IBMNl3TU1xa48E3gUI/b1XSwMJs5sxwhIAEAhP3MbQA8TJF0EY7ChRUeZhjEsYY/
5nyOAjXlsL1mdw0=
=/fjo
-----END PGP SIGNATURE-----

--------------G4R0Hd3Eh808uj0M9SfjGy0F--
