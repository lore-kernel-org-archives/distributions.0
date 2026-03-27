Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEC03CEB82
	for <distributions@lists.linux.dev>; Fri, 27 Mar 2026 08:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598511; cv=none; b=jzbR4yreJo46V2en8vrwwdGnXl4vA/gS+WTwru3jL9mBHMOb33DD98QZI+hNx1NTK6ncgaeM8/5eu85vsXTji6EOa9ucn9LEAJftweEC9KnVQr3zC3vZ5T2nzTFqzEEWB7fmx3fynkvXsVwskiDPvUFJf+CDT62JnghINP547jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598511; c=relaxed/simple;
	bh=Yx6+OFw5TyfGfeZs0STBG7J6E0peuQeGq3XtJKtLmbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Wdn0fQq2o47/1Ky0wf3YtGLVyoEyV1KdJpjDAXaoQc7248/FsJw3+msaWZZxCZo9a47hH55YMarrrR52+OBUpgRO1I6698WW2H7SWMTcRBfleaIxGyT9i33Shjj26PTTmySK86rMz3oAvDwNwyJltquI1tvZ9aFtW1Kt07iDNlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E0QHwGLP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hEgXxY+6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CdC1Q+1U; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=To9YTVW5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E0QHwGLP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hEgXxY+6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CdC1Q+1U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="To9YTVW5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 31ABB4D30D;
	Fri, 27 Mar 2026 08:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774598501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Yx6+OFw5TyfGfeZs0STBG7J6E0peuQeGq3XtJKtLmbw=;
	b=E0QHwGLPVchQfRPTmXCy2zY12oRpWxZpvnIrEanuke1Kb015l9OcVUeqg/CoYRLkvjXDO+
	ZwR6QF2hqSlepifnAlSaVe3DzW8I8rsgZzhTMuXTkBUZh9v9YY2EhsQTLjboyWb5RdxrkA
	U/gYAUwZ4h/EVraEvuX81jxEIqw/atY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774598501;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Yx6+OFw5TyfGfeZs0STBG7J6E0peuQeGq3XtJKtLmbw=;
	b=hEgXxY+6DqiNMLJmkzbqB8W4S409o7I4UUd1q0ZFV/Iyrhz84M8Fw7Kw/1tB6ATuoDH0pM
	ZO3HyqFTYr/f5PAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CdC1Q+1U;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=To9YTVW5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774598500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Yx6+OFw5TyfGfeZs0STBG7J6E0peuQeGq3XtJKtLmbw=;
	b=CdC1Q+1UvpYu78KzSFIodwj/lRHIyr8cY6IV8OsnJZYKNSRkl+/bLLAC5KzcwkPVtg3aha
	cn/CRzLH5wwGrHKgtUzbufByCXGgVwZSk77ZYkMeNrvb3r0cB8aNq0AVBZoAq99epNycBa
	6rs5xkvMZeZV5j40uhEaoAG9lIPwNQQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774598500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Yx6+OFw5TyfGfeZs0STBG7J6E0peuQeGq3XtJKtLmbw=;
	b=To9YTVW5xWfBCl80xI424zcPW0/srpKL5PfQjhzr8b6MOX4M51voiqe9riHuRVABvS6xSW
	FQvz6gP+dQ/RhbCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B8DE4A0A2;
	Fri, 27 Mar 2026 08:01:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id isfkI2M5xmkARQAAD6G6ig
	(envelope-from <bwiedemann@suse.de>); Fri, 27 Mar 2026 08:01:39 +0000
Message-ID: <28bcbf0a-00b1-45fb-b61f-e5043d078d3e@suse.de>
Date: Fri, 27 Mar 2026 09:01:39 +0100
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Looking for advice on how to deal with potential slop packages
To: =?UTF-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>,
 distributions@lists.linux.dev
References: <a3f792e918674e208492a077679ae6ffc88ce0c9.camel@gentoo.org>
Content-Language: en-US
From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
Autocrypt: addr=bwiedemann@suse.de; keydata=
 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
 12bW2FfpiwAGOQ==
In-Reply-To: <a3f792e918674e208492a077679ae6ffc88ce0c9.camel@gentoo.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SoM1UgWfdccUj0MxHBBBxUET"
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-6.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:url,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: 31ABB4D30D
X-Spam-Flag: NO
X-Spam-Score: -6.51
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SoM1UgWfdccUj0MxHBBBxUET
Content-Type: multipart/mixed; boundary="------------1TCrv92MkO0UKTj6OkI4GgHH";
 protected-headers="v1"
From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
To: =?UTF-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>,
 distributions@lists.linux.dev
Message-ID: <28bcbf0a-00b1-45fb-b61f-e5043d078d3e@suse.de>
Subject: Re: Looking for advice on how to deal with potential slop packages
References: <a3f792e918674e208492a077679ae6ffc88ce0c9.camel@gentoo.org>
In-Reply-To: <a3f792e918674e208492a077679ae6ffc88ce0c9.camel@gentoo.org>

--------------1TCrv92MkO0UKTj6OkI4GgHH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCk9uIDA3LzAzLzIwMjYgMTEuMzgsIE1pY2hhxYIgR8Ozcm55IHdyb3RlOg0KPiBIZWxs
bywgZXZlcnlvbmUuDQo+IA0KPiBTZWVpbmcgbW9yZSBhbmQgbW9yZSBwYWNrYWdlcyBlbWJy
YWNpbmcgTExNLWRyaXZlbiBkZXZlbG9wbWVudCAodG8gdGhlDQo+IHBvaW50IG9mICJ2aWJl
IGNvZGluZyIgb3Igc2xvcHdhcmUpLCBJJ20gbG9va2luZyBmb3IgeW91ciBpZGVhcyBvbiBo
b3cNCj4gZGlzdHJpYnV0aW9ucyBzaG91bGQgZGVhbCB3aXRoIHRoYXQuDQoNCmh0dHBzOi8v
bHduLm5ldC9TdWJzY3JpYmVyTGluay8xMDY0NTQxL2Q3MWYzNjJmOTY4MWFkMmIvDQpwaWNr
ZWQgdXAgb24gdGhpcyB0b3BpYy4NCldoaWxlIGl0IG1lbnRpb25zIGNoYXJkZXQsIHRoZSBm
b2N1cyBpcyBvbiBhIHN1Ym1pc3Npb24gdG8gb3BlbkJTRC4NCkNvcHlyaWdodCBpcyBhIG1h
am9yIGNvbmNlcm4uDQpNYWludGFpbmFiaWxpdHkgaXMgYW5vdGhlciwgYmVjYXVzZSBub2Jv
ZHkgZnVsbHkgdW5kZXJzdGFuZHMgdGhlIA0KZ2VuZXJhdGVkIGNvZGUgYW5kIGl0IG9mdGVu
IGR1cGxpY2F0ZXMgcGxlbnR5IGV4aXN0aW5nIGNvZGUsIHZpb2xhdGluZyANCkRSWS9TUE9U
IC4NCg0KDQpDaWFvDQpCZXJuaGFyZCBNLg0K

--------------1TCrv92MkO0UKTj6OkI4GgHH--

--------------SoM1UgWfdccUj0MxHBBBxUET
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQTykslvYmKwlIQesLNdovN53d8CLgUCacY5YwUDAAAAAAAKCRBdovN53d8CLv+C
AP9QZ0oScwGwpZtSf6tjjGJz2QpqlcB+II0aszcDbqIsIgEA2F7v/s3y1jThvTL0QaTH/C4PvUYf
FtkfRIv69ibSlwM=
=cFex
-----END PGP SIGNATURE-----

--------------SoM1UgWfdccUj0MxHBBBxUET--
