Received: from sysrq.in (sysrq.in [37.79.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D265CEC7
	for <distributions@lists.linux.dev>; Sat, 22 Jul 2023 22:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=sysrq.in; bh=qZsrjm5crtw
	VGkpzZcSDxnNzwGNExXShNtSU7q8R4pw=; h=to:from:date; d=sysrq.in; b=b0nFe
	1zZm1+33ROjt00Bol6ixe6CpIfT67oCul+3VSe+TsY8/C+4XhI/9euA5fMDN+bcevs//t7
	b793KltG9EUOuNH8XJLS7pXT2pSB32nOciFbuq8/uLA6rDo55t4uE21XHe/STEUSquCdJY
	iYHFDRihGADtxo+hANDTgBjZnp8LNQ47TjtXJNeBCpqePfHk71LWiyimbaCBnd1LcU9RAW
	jNsQv82rU56Zz0W5oQLVLkfKJwHUU1Xu/gaIJvAdsXioCTNDO+wE33SKOfgceDdNxLPHKc
	P6752ynUJSYh5z7+nx9nL7NusPFQiu4x9yYLK/yp0FnwdAnDr7Zc4fahg==
Received: from sysrq.in (localhost [127.0.0.1])
	by sysrq.in (OpenSMTPD) with ESMTPS id 6c023f83 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <distributions@lists.linux.dev>;
	Sat, 22 Jul 2023 22:05:23 +0000 (UTC)
Date: Sun, 23 Jul 2023 03:05:22 +0500
From: "Anna (cybertailor) Vyalkova" <cyber+gentoo@sysrq.in>
To: distributions@lists.linux.dev
Subject: eudev is no more compatible with libgudev
Message-ID: <ZLxSolytyFht4Xvv@sysrq.in>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.2.10 (2023-03-25)

Hello, list!

Eudev is a fork of Udev separated from SystemD codebase. It was
abandoned by Gentoo in 2021 and handed over to a team of cross-distro
contributors.

It's currently stuck at Udev API 243, while recent versions of libgudev
require Udev API 247 at least.

The function in question was introduced to Udev in 2020 and added to
libgudev in 2022. Eudev still haven't pulled the changes.

See the upstream issue:
https://github.com/eudev-project/eudev/issues/249

libgudev is the first project that became incompatible with Eudev. As
time passes, there will be others.

If your distro uses Eudev, consider switching to systemd-udev instead.
