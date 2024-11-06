Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65E313CFAD
	for <distributions@lists.linux.dev>; Wed,  6 Nov 2024 08:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730880410; cv=none; b=I5wgbPeocM7tQpzd63vAtiXdysRVbehkyBvKE/f8Ns2g/6wIFzBZUv38gbtJVzjBpHLb1u26XQUyCSsvJidIL/op3CJ478NGDDOQQjcqea0hnj5Ykdq8mmFJNLwyrhaoqdsO6VBOo1TdjI19wt2XMIptQiKNykfFZmUeXpA356Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730880410; c=relaxed/simple;
	bh=ga4PGiEG3Stv0u473nT5jdY7jkh9V7nnMo6ii58GyYA=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=q7luf3JkLH1OoA0cN8PjVbrzXM+/x4RrbSy9DEQy4LtdJzxBC6U7513Fq3jKlTfod/sNzXZ+vRvSj9AatRjBXmEK8Uy70nL+o07HUvjNFWn3543V2l8WKO5+mqD+I0JXiTAqI6Qe5uxW9wr/puQvgosZgEFi8qq1T6qPHUe1UzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V2xQLqO+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BWlZPk/d; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PfcML3Z1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mv7IzBA4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V2xQLqO+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BWlZPk/d";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PfcML3Z1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mv7IzBA4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F26A821BA2
	for <distributions@lists.linux.dev>; Wed,  6 Nov 2024 08:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730880396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
	bh=ga4PGiEG3Stv0u473nT5jdY7jkh9V7nnMo6ii58GyYA=;
	b=V2xQLqO+ZNy/gMgbVkp6BLwWkEZkeRO8ldfU597x4/eywLmdaomNstU8En0MMqpjUDMuYq
	ieWySCjYleCLnAXEQS1V1FylBOG77jvlQ6yePPf3Z8Qqn1zLwbBKWh6XAO2/CI/uL42dsA
	hr8LZjVyCD8PQrUYJOAAgFO1wHyaApQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730880396;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
	bh=ga4PGiEG3Stv0u473nT5jdY7jkh9V7nnMo6ii58GyYA=;
	b=BWlZPk/dRcF7MXDHHs/uOjC4A+XkpzKbShGE+Teh3EKYj5Pmw8X9xt4GkAaLVoCvQSOHLI
	LX8QOEvw/k+K7/Dg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PfcML3Z1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mv7IzBA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730880395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
	bh=ga4PGiEG3Stv0u473nT5jdY7jkh9V7nnMo6ii58GyYA=;
	b=PfcML3Z19GhvmLHZI9eg8j3UBWpNXHkaGkoPLjTmCLRPhfi/gQzbMQSvSB2NYcirWpfd4N
	otvE8tvbueYZR5VYpi+dIqM8QtUUp/puBi7XGTSYFgoJURpPIx60TkANxHiOUqxLs10C4O
	d+yqVcFh5vKe6U6k9tSaoEyD80TewYc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730880395;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
	bh=ga4PGiEG3Stv0u473nT5jdY7jkh9V7nnMo6ii58GyYA=;
	b=mv7IzBA4TmLULdR6n42FQN+0NtBfaM8Ir0dz5XCWLjCrzJe0tDb4xcCKsxmIGHQFRFa3aV
	emwnMvdq2fmnKmCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D913B137C4
	for <distributions@lists.linux.dev>; Wed,  6 Nov 2024 08:06:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8faoMosjK2eYOAAAD6G6ig
	(envelope-from <bwiedemann@suse.de>)
	for <distributions@lists.linux.dev>; Wed, 06 Nov 2024 08:06:35 +0000
Message-ID: <e1009d61-468f-40df-9ec1-4e1d274a7d6b@suse.de>
Date: Wed, 6 Nov 2024 09:06:35 +0100
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
Subject: FHS 4.0
Autocrypt: addr=bwiedemann@suse.de; keydata=
 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
 12bW2FfpiwAGOQ==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Nt8mwTAJ0GqKODsW0O3Wk1ox"
X-Rspamd-Queue-Id: F26A821BA2
X-Spam-Score: -4.98
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.98 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	SUBJ_ALL_CAPS(0.53)[7];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[distributions@lists.linux.dev];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Nt8mwTAJ0GqKODsW0O3Wk1ox
Content-Type: multipart/mixed; boundary="------------GAtB0sRGuiaNliRUx8s6q4iV";
 protected-headers="v1"
From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
To: distributions@lists.linux.dev
Message-ID: <e1009d61-468f-40df-9ec1-4e1d274a7d6b@suse.de>
Subject: FHS 4.0

--------------GAtB0sRGuiaNliRUx8s6q4iV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnNvbWUgcGVvcGxlIGZyb20gZGlmZmVyZW50IGRpc3RyaWJ1dGlvbnMgd2FudCB0
byB3b3JrIG9uIGFuIHVwZGF0ZWQgRkhTIA0Kc3BlY2lmaWNhdGlvbiwgYmVjYXVzZSBkaXN0
cmlidXRpb25zIGFscmVhZHkgZG8gdGhpbmdzIGRpZmZlcmVudGx5IGZyb20gDQp0aGUgY3Vy
cmVudCBvbmUsIGUuZy4gZm9yIGltbXV0YWJsZSBmaWxlc3lzdGVtcy4NCg0KSWYgeW91IGFy
ZSBpbnRlcmVzdGVkIHRvIGpvaW4gdGhlIGVmZm9ydCwgc2VlDQpodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvRkhTL2Zocy1zcGVjLy0vaXNzdWVzLzENCg0KQ2lhbw0KQmVybmhh
cmQgTS4gKG9wZW5TVVNFIGRldikNCg==

--------------GAtB0sRGuiaNliRUx8s6q4iV--

--------------Nt8mwTAJ0GqKODsW0O3Wk1ox
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQTykslvYmKwlIQesLNdovN53d8CLgUCZysjiwUDAAAAAAAKCRBdovN53d8CLr79
AP9Ox9aGFcmQRq49JYrGGfFt6vErmgU2mTNEdSb84Cw9OQEApGnMos0ELa/UNDOL6m6tdP0Sfdw0
aQQSicnW84lTeAI=
=Fy6c
-----END PGP SIGNATURE-----

--------------Nt8mwTAJ0GqKODsW0O3Wk1ox--
