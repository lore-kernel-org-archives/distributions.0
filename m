Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D57D3D902D
	for <distributions@lists.linux.dev>; Wed,  4 Feb 2026 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770200144; cv=none; b=GIzqQDjEInuvhADAqMP5Bj4a6DcCaOFOlJWO5BxwNmpCGE4nzIfL9ijbjvTLgMsEd8w8x1/2U/E4dG6SBXPiFQn18kFx2rNm22NmSsAmU+DplZW+8bKqqs4VhmgW0A7ZhccOhzj1qh4gyBhVwXuvDE4ynEXkpzxq9iLvTEnCDfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770200144; c=relaxed/simple;
	bh=iRNZwxYZygDBFbliu3w5MlEBXVL9oJupBXZ6Sgm2TL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VGC8EpQYfrDfaUQZuxw8OS+zJsBPB5jIqoe2ZboccTtX8hRE7cabKiNhGWnxDwDzjffXW6K0dUoPlYbaDYaQsDL0zHlZv0nIkvHqNDtuv2XCyn5JFMvrqEGavBGR4/2uzdGsuPaBpem4tLusJH10GFg5842uHqCV1jdI7C9UNxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PYRKcPZO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k28js+sv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PYRKcPZO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k28js+sv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PYRKcPZO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k28js+sv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PYRKcPZO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k28js+sv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B72783E6F0;
	Wed,  4 Feb 2026 10:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770200142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iRNZwxYZygDBFbliu3w5MlEBXVL9oJupBXZ6Sgm2TL4=;
	b=PYRKcPZO+1zzkC87qWskMsfrAeUJmsAGEZzyDjGEe73C2msljqD7hlG0b2E3zqtCgBQAsm
	oOuI4rHUpu+XhrUxC1zNCGdZzouZGsKL8h0yujJsf1CoEZ/ah2jUjidaEWcI4boN9wACdN
	sf2PDOouTXogIKYzQ4SYXyNTHS2i5bo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770200142;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iRNZwxYZygDBFbliu3w5MlEBXVL9oJupBXZ6Sgm2TL4=;
	b=k28js+svfKk12voy48YJu+UlRkXlviGL4MZcb1+7k0GUR6zxWTTAnkScW9aSxprDDKL6+4
	hxEV2ZMJorAlyiDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770200142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iRNZwxYZygDBFbliu3w5MlEBXVL9oJupBXZ6Sgm2TL4=;
	b=PYRKcPZO+1zzkC87qWskMsfrAeUJmsAGEZzyDjGEe73C2msljqD7hlG0b2E3zqtCgBQAsm
	oOuI4rHUpu+XhrUxC1zNCGdZzouZGsKL8h0yujJsf1CoEZ/ah2jUjidaEWcI4boN9wACdN
	sf2PDOouTXogIKYzQ4SYXyNTHS2i5bo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770200142;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iRNZwxYZygDBFbliu3w5MlEBXVL9oJupBXZ6Sgm2TL4=;
	b=k28js+svfKk12voy48YJu+UlRkXlviGL4MZcb1+7k0GUR6zxWTTAnkScW9aSxprDDKL6+4
	hxEV2ZMJorAlyiDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 767543EA63;
	Wed,  4 Feb 2026 10:15:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QnaXGk4cg2nNVAAAD6G6ig
	(envelope-from <bwiedemann@suse.de>); Wed, 04 Feb 2026 10:15:42 +0000
Message-ID: <e2130c59-f387-4337-b9f3-7788a805b9ea@suse.de>
Date: Wed, 4 Feb 2026 11:15:41 +0100
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: year 2038 is only 12 years away
To: "Andreas K. Huettel" <dilfridge@gentoo.org>,
 distributions@lists.linux.dev, "Bernhard M. Wiedemann" <bernhardout@lsmod.de>
References: <39728878-8cca-48de-a091-4af3d6de7e4e@lsmod.de>
 <47880055.fMDQidcC6G@noumea>
Content-Language: en-US
From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
Autocrypt: addr=bwiedemann@suse.de; keydata=
 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
 12bW2FfpiwAGOQ==
In-Reply-To: <47880055.fMDQidcC6G@noumea>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VXCEu00RRKtWvBbnMWCCdkq0"
X-Spamd-Result: default: False [-5.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_BASE64_TEXT(0.10)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -5.30
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VXCEu00RRKtWvBbnMWCCdkq0
Content-Type: multipart/mixed; boundary="------------Cy0QfwfYZ9famJ5qy4OxZFeT";
 protected-headers="v1"
From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
To: "Andreas K. Huettel" <dilfridge@gentoo.org>,
 distributions@lists.linux.dev, "Bernhard M. Wiedemann" <bernhardout@lsmod.de>
Message-ID: <e2130c59-f387-4337-b9f3-7788a805b9ea@suse.de>
Subject: Re: year 2038 is only 12 years away
References: <39728878-8cca-48de-a091-4af3d6de7e4e@lsmod.de>
 <47880055.fMDQidcC6G@noumea>
In-Reply-To: <47880055.fMDQidcC6G@noumea>

--------------Cy0QfwfYZ9famJ5qy4OxZFeT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCk9uIDIvMi8yNiAxMTo1MiBBTSwgQW5kcmVhcyBLLiBIdWV0dGVsIHdyb3RlOg0KPiBG
V0lXIEdlbnRvbyBpcyByZWFkeSBmb3IgdGVzdGluZyA2NGJpdCB0aW1lX3Qgb24gMzJiaXQg
YXJjaGl0ZWN0dXJlcw0KDQpJdCBpcyB3b3J0aCByZW1lbWJlcmluZywgdGhhdCB3aGlsZSB0
aGlzIGlzIG5lY2Vzc2FyeSwgdGhlcmUgYXJlIHN0aWxsIA0KcmVtYWluaW5nIGlzc3Vlcywg
ZXNwZWNpYWxseSB3aXRoIGNvZGUgdGhhdCBoYW5kbGVzIHRpbWUgZW50cmllcyBmcm9tL3Rv
IA0KZmlsZXMgb3IgbmV0d29yaywgYmVjYXVzZSB0aGUgY29udmVyc2lvbiBmcm9tL3RvIHRp
bWVfdCBmcm9tIGJpbmFyeSBvciANCkFTQ0lJIGZvcm1hdHMgbWlnaHQgaW52b2x2ZSAzMi1i
aXQgaW50IHZhbHVlcywgZS5nLiB0aHJvdWdoIGEgY2FsbCBvZiANCmF0b2koc3RyKSBvciB3
aXRoIHRoZSBwZXJsL3B5dGhvbiBwYWNrIGZ1bmN0aW9uLg0KDQpJIGFscmVhZHkgZm91bmQg
ZG96ZW5zIG9mIHRoZXNlIG9uIHg4Nl82NCB3aXRoIHNsaWdodCB0ZXN0aW5nLg0KDQpzb21l
IGV4YW1wbGVzIGFyZQ0KaHR0cHM6Ly9naXRodWIuY29tL21lbWNhY2hlZC9tZW1jYWNoZWQv
cHVsbC85MjcNCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuU1VTRS9saWJ6eXBwL2lzc3Vlcy81
NTkNCmh0dHBzOi8vZ2l0aHViLmNvbS96b3BlZm91bmRhdGlvbi9aRU8vaXNzdWVzLzI0NQ0K
aHR0cHM6Ly9naXRsYWIuY29tL2ZyZWVwYXNjYWwub3JnL2ZwYy9zb3VyY2UvLS9pc3N1ZXMv
NDA1NTINCmh0dHBzOi8vamlyYS5tYXJpYWRiLm9yZy9icm93c2UvTURFVi0zMjE4OA0KDQoN
CkFuZCB0aGF0IG90aGVyIHR5cGUgb2YgaXNzdWVzIChub3QgdGhlIG9ubHkgb25lIG9mIHRo
aXMga2luZCkNCmh0dHBzOi8vZ2l0aHViLmNvbS9saWJhcmNoaXZlL2xpYmFyY2hpdmUvcHVs
bC8yNzQyDQoNCkNpYW8NCkJlcm5oYXJkIE0uDQo=

--------------Cy0QfwfYZ9famJ5qy4OxZFeT--

--------------VXCEu00RRKtWvBbnMWCCdkq0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQTykslvYmKwlIQesLNdovN53d8CLgUCaYMcTQUDAAAAAAAKCRBdovN53d8CLrMZ
AQCKbtcYgkD6UqTkr+t4IMiPcQj3nvNvVp7dYbLyaAkNUQD/RO5Q1jGMq3zMT+BmMwC3GB09FqWl
bc+1L8lGtMCb+Q8=
=DwBw
-----END PGP SIGNATURE-----

--------------VXCEu00RRKtWvBbnMWCCdkq0--
