Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827281F61C
	for <distributions@lists.linux.dev>; Thu, 23 Jan 2025 14:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737641060; cv=none; b=Xi6oPx1ZrxY0GjLVnrYyk6RdcV85ISpd8jSa+EEzffacXo/pI8wKfWvbhRZf4jS4uqMLFfSw2yWl0R8vAXYI4NIzbLpGhNUooF/QEc6Yq1r22XRIrYFxmkpTTZNs1kr/2pEgD49v0q5Et/9ENxB2Bg6ZXHO7tcFPwaZijUu+rcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737641060; c=relaxed/simple;
	bh=5Qe9O6uCPB6cLnb4Xu99fAcfEdKEnE6qUUbqibXenGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rFX7elVWd42ZQST5yaFKgeo9brBexYgJTMc9EBVfYZkA3pYfoE/+bKLjVj+TaZCObQbWdD1rAS/Y33QKOIs3LwTq9LLwUGCtg5Hg+eRlmnBQgT8eNhtHTMTUq/QQx2Ydz88jw/OZGUbFxFgY5q9CH+Ef5Z+UIyg1JfWqoVTyHl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BGHECD2f; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=voLvyO4I; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BGHECD2f; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=voLvyO4I; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BGHECD2f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="voLvyO4I";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BGHECD2f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="voLvyO4I"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 71EA61F365;
	Thu, 23 Jan 2025 14:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737641056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UjsxaKRLXJjWpHvVcBRrdieMp3AhXSh4uwy073wuVDs=;
	b=BGHECD2f1eecpsUI0umDsKYZPKZoo4ijI77WnU4FdnuPkOy1BkdqwDnnGuzQbBfQEIze5V
	XgghMgZZhIWygJSKYJMY6HrQKxvZ8LQGINtUVhtlbAYMAnXulyAWLe+O0ujaPikZebqit1
	rhZ0EHJ5KzoU6pBD7OJ9N23ChoSBQwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737641056;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UjsxaKRLXJjWpHvVcBRrdieMp3AhXSh4uwy073wuVDs=;
	b=voLvyO4I2RgOas7pKWcMmXSoE7DUVYBSgi7LEM1qfhoy2CAhEsXESh2xoGjspOg+pPvTzt
	6mDDMa2nDQbzs/CA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BGHECD2f;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=voLvyO4I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737641056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UjsxaKRLXJjWpHvVcBRrdieMp3AhXSh4uwy073wuVDs=;
	b=BGHECD2f1eecpsUI0umDsKYZPKZoo4ijI77WnU4FdnuPkOy1BkdqwDnnGuzQbBfQEIze5V
	XgghMgZZhIWygJSKYJMY6HrQKxvZ8LQGINtUVhtlbAYMAnXulyAWLe+O0ujaPikZebqit1
	rhZ0EHJ5KzoU6pBD7OJ9N23ChoSBQwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737641056;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UjsxaKRLXJjWpHvVcBRrdieMp3AhXSh4uwy073wuVDs=;
	b=voLvyO4I2RgOas7pKWcMmXSoE7DUVYBSgi7LEM1qfhoy2CAhEsXESh2xoGjspOg+pPvTzt
	6mDDMa2nDQbzs/CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5B77D1351A;
	Thu, 23 Jan 2025 14:04:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kxn9FGBMkmdJPwAAD6G6ig
	(envelope-from <bwiedemann@suse.de>); Thu, 23 Jan 2025 14:04:16 +0000
Message-ID: <aad2b06f-df80-4751-a667-8fc4c4e10482@suse.de>
Date: Thu, 23 Jan 2025 15:04:15 +0100
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Standardizing NO_NETWORK and USE_SYSTEM_DEPS environment
 variables
To: =?UTF-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>,
 distributions@lists.linux.dev
References: <b0726076ea438d59d8b7b5d0f44a4ed6ca11d418.camel@gentoo.org>
Content-Language: en-US
From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
In-Reply-To: <b0726076ea438d59d8b7b5d0f44a4ed6ca11d418.camel@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 71EA61F365
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.98%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On 1/23/25 2:14 PM, Michał Górny wrote:
> Hello,
> 
> As a packager, I often find it necessary to ensure two important aspects
> of the build process:
> 
> 1) that the build process itself doesn't access the Internet,
> in particular that it doesn't download any files on its own,
> 
> 2) that the build process uses system shared libraries and other
> dependencies whenever possible, rather than vendored (or downloaded)
> copies.

For openSUSE, we build in Open-Build-Service (OBS) that runs the build 
in KVM without Internet-access. It is the only way to be sure.
That means that everything that is used during the build must be checked 
into the system, so it is known and versioned.
In practice, many rust and golang packages come with large vendor tarballs.

We try to un-bundle libraries to use our system versions instead, but 
what if there are too many incompatible versions required?

What is the problem with
configure --use-system-libfoo

Ciao
Bernhard M.
