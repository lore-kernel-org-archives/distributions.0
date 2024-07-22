Received: from kyouko.torastian.com (kyouko.torastian.com [23.88.113.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3689216C6B0
	for <distributions@lists.linux.dev>; Mon, 22 Jul 2024 18:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.113.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721672866; cv=none; b=ghnJZEyx8Aaddp6IlgcWK9I9rnWoseI7DsEjrLUqxZJDwLUIhadT+Fbl2iLnUCUDvapfcHeS5mZMDDufZOGYvhEuoDkGVvSLQ+MNHlccRM8nnn+TJ9ifAw1BSh3xLs8jGidUBfsichpKSo1evG8UX9HiBYqT9JO0Ii8ngtiYYR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721672866; c=relaxed/simple;
	bh=Zi0/Ox+T8tmdRLAsnVZw4S/U4xYCmbucMCjR8MVUYho=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DwpEgh1/XqEY1pxI5nMcBeJiuykcXZ5G6iAZZJ5WaZhqITCQ/lNft1zKRLwhDiqwPioknVajUZ0YEic6y1YkyGyy2uWHsP4O0eY+rY3kIIH6KFZY07rcPydBWAlQHGYc6JSHExmlMKOM1yXwlJX3YlhXdfRA5QvwhI3J1PGZCZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ptrcnull.me; spf=pass smtp.mailfrom=ptrcnull.me; dkim=pass (2048-bit key) header.d=ptrcnull.me header.i=@ptrcnull.me header.b=hCUjCQu2; arc=none smtp.client-ip=23.88.113.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ptrcnull.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ptrcnull.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ptrcnull.me header.i=@ptrcnull.me header.b="hCUjCQu2"
Received: (Haraka outbound); Mon, 22 Jul 2024 18:26:27 +0000
Authentication-Results: kyouko.torastian.com;
	auth=fail (plain) smtp.auth=patrycja@ptrcnull.me;
	auth=fail (login) smtp.auth=patrycja@ptrcnull.me;
	auth=pass (plain)
Received: from [10.0.0.12] (109241129110.warszawa.vectranet.pl [109.241.129.110])
	by kyouko.torastian.com (Haraka/3.0.3) with ESMTPSA id E47CE731-22C4-402E-BE4C-75475362FBD8.1
	envelope-from <patrycja@ptrcnull.me>
	tls TLS_AES_256_GCM_SHA384 (authenticated bits=0);
	Mon, 22 Jul 2024 18:26:27 +0000
Message-ID: <3aee847f-936d-4090-b20c-d9efe69e5c2a@ptrcnull.me>
Date: Mon, 22 Jul 2024 20:26:09 +0200
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Firefox-128 "Privacy-Preserving Attribution" and distribution
 defaults
To: Joonas Niilola <juippis@gentoo.org>, distributions@lists.linux.dev
References: <3efaeed6-3277-4355-ba21-4389b26d35cb@gentoo.org>
From: Patrycja Rosa <patrycja@ptrcnull.me>
Content-Language: en-US
Autocrypt: addr=patrycja@ptrcnull.me; keydata=
 xsBNBF4JPgsBCADJQjnjZyfr5QhcGtCPJ+NeImYm1WJqnxJ4msmnhmhKAZ5V5UJDoTCAuetb
 q2Lc7zbjEpClafQVcgMZ+4wGPjoviqfuT++LYcvR+6xN2IybX5qtEZ/p8Iw2WsSv5LaVIRta
 4fPgBR3OnoVZeuwCsE2UcA6207CMDeyLJu7RKD37Npx4tb1qXfU6TAiokuseIOu9LLO5jbcY
 sZTa2iBD6tx+mLu6/3gYXDcaUujn6EDeC+oTFaztMrMx7mKUGWR4jbR2jYrW42zZ0KdlMfKL
 kH3g5CFr1mXGrUKF0hfkkxl4Nl1wt4sGDSU3f5EtKiv3xDfibMbUaYrdPGrwSBYESG+BABEB
 AAHNJFBhdHJ5Y2phIFJvc2EgPHBhdHJ5Y2phQHB0cmNudWxsLm1lPsLAjgQTAQgAOBYhBNRb
 vged1YjZWlnsKYK3iXwa+YoxBQJeCT4LAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJ
 EIK3iXwa+YoxIJUH/AzvJ9fYSUByytNbvDxdMxTQIHcwJpiI/IMqjnqJkSNVji0opKoKp8wi
 E/hPev28TU1lSPLyHDduGNAJxYVtLb9+2ECHO8eTEhcisCXPjTx7GKlg7/xy9HA4BsZNeYYg
 QO3MrMffKm2CWX+BLrBnZ9NnhBgH86RhasPJJmofe+TtWe133eQXIZgHMdI2TqKVz7lqZjBi
 m+rympyAXZIof1wznaOdPUxuAXIHTWj94nIg01XtLnatOetAHalXRffsTGh4ELhztNgXxqRB
 rjc6xgHwbzEHpTGYNA7OPtGJGngKwCx5ge1BFjlbqiabCWrbVSo/aHcNCr9zQghE3Lg0A/zO
 wE0EXgk+CwEIALt6yz2G+SFFlAKtiQOg45dKJw5+nMd2ro8PfqXX4e1rN5oNQsJv0D/AGcac
 dBxJ0a05wDgYO5+Ut+J20lAdmDfgffkcmUQPI4NTbO1K0RJ1xpJq4Bly9s74Io94aLw6YM80
 rNRDjnJe7Ps+VhxBc7lMSNWd6XcIgpIn7dN32jliJim2SXK6fsRNBaTRZciyLEWAsL/L67k4
 oJjz6B0zKbH3oXsicnb7Xcbim85MxKNDGWEz6GWWVfh91VEJkJJ0E/HUOzAAo/S3qObbZuhx
 Bk9R3B7lXP5Q+9rNJM5sTm1ZPFKCDpa0eh1RIYBWK5U8uXJPTTh/XHfjoaF1dVefRLcAEQEA
 AcLAdgQYAQgAIBYhBNRbvged1YjZWlnsKYK3iXwa+YoxBQJeCT4LAhsMAAoJEIK3iXwa+Yox
 XnIIAMCmsipZe7iVeBu8L41XhZOa0rg+ew2WYwHbZiIWkyVvY3PvmEDD+m28ocvTkVqRbWli
 b/g4K4RmnAPgF01m2JJQHjWavUXvpHtghe4lIArU+Gj8Xl2s5pWsD/RoLlwHdMjA9atPss4G
 uKQ/bwqPwt2MaduuP98GOnZZtIVfMBxovD2zxjmSuzUAlSEvk+8XnYw187dVnPghMwJkQt7D
 tNsLZjiHjMHE62AUcHpCBxqvH+tN8XEOk3syFffohfWvjaNjpHgfjtnT4XCZZ363rD+Jhm/a
 1by6Qkmkg9OPZMGUjUW9u6G3D+JsHeL0qrIwsnL2AWzVLF3CT+Beq7nzAos=
In-Reply-To: <3efaeed6-3277-4355-ba21-4389b26d35cb@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=ptrcnull.me; s=apr2024;
	h=from:subject:date:message-id:to:mime-version;
	bh=Zi0/Ox+T8tmdRLAsnVZw4S/U4xYCmbucMCjR8MVUYho=;
	b=hCUjCQu2Aqw8Lkz0Q4u2rfFCvAg6t5Gap62SaRkWZlcUmTB2ltf8Z3hZrEp0vNGzQTFDpJtrgl
	BQf08kjACtQhvEXqYWdft650cUQaaviH2y9aZ0D8fSozjJa7d5KdpEPpZcWr+Vu3Hg27TI2Jm2U2
	Tr79uBtsyt3aJQ5VywvWCkg/Dkm2d90GgXSI5ULsJf4qSxe4b08uaJkSIa4oZO2FKcc/ftcXTldj
	BsrTxF85GBk+9JVHdr1psYI2/fQbrBE16yQDDxzvLBNyGTyL2be749iO5q2qKbsKgYT6WXdQ4yh3
	lolVi6FXPiowHwxjZSAexuLx11E8M0A33ar0BqGg==

On 22/07/2024 15:32, Joonas Niilola wrote:
> So far I've only seen Alpine toggling this option off with their Firefox
> package.

Alpine maintainer for Firefox here - I looked through the Firefox 
codebase, and it looks like the API becomes a no-op when disabled[1].

While Mozilla has also posted that the API isn't available for anyone 
other than themselves yet, the somewhat oddly motivated explainer posted 
by them[2] (i.e. "The value that an advertiser gains from attribution is 
enormous." and "Meta famously reported USD10 billion of losses"[3]), as 
well as multiple[4][5] concepts of attacks posted under the original 
PATCG proposal made me feel like disabling it was the right choice - 
especially since (for now?) it doesn't do anything other than just send 
more data to Mozilla+ISRG.

[1]: 
https://searchfox.org/mozilla-central/rev/318994c335b17ed02629792021e076bc0fe00145/dom/privateattribution/PrivateAttribution.cpp#59
[2]: 
https://github.com/mozilla/explainers/tree/main/ppa-experiment#end-user-benefit
[3]: https://github.com/mozilla/explainers/issues/12
[4]: https://github.com/patcg-individual-drafts/ipa/issues/57
[5]: https://github.com/patcg-individual-drafts/ipa/issues/77

-ptrc
