Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BB92595
	for <distributions@lists.linux.dev>; Mon, 10 Feb 2025 02:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739154926; cv=none; b=DW+7tiARwi7IwPdjr6ziVs2PWNO0wPXXDH2Oe/R6GpfapxPhikgOm14Sk5sJFulkHlQZlNUQ8I9BW6SFgFFX3OPyt72QgK79nSIMZ39OBq/Rp0cVgyqHVtBhUVSY79n6ADLCKOE2+G0KRPn719cxVP96QBnOTB8z+08JJDQsctk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739154926; c=relaxed/simple;
	bh=E1xZ1Xioui2idBhcOk6sBT65n+NYyb13rshc4gF3JU4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SK8R+t5X+7B6p4fgMPaFmYfdH36MeNvSGAMEtiQFuAhwa29YxCps5XEqj6VLumkzCzHGefuUljtFZNgAjh4FuMoUMZeagu/FUhZTxNoySZ9Xf9zM3WxnNzyNXtxBe3/hWKzrr66piDrWv+L99nWZLnlfh4ZNVMWopJxAWCZxLjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 610603409EC
	for <distributions@lists.linux.dev>; Mon, 10 Feb 2025 02:35:23 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Subject: libffi-3.4.7 bug
Organization: Gentoo
User-Agent: mu4e 1.12.7; emacs 31.0.50
Date: Mon, 10 Feb 2025 02:35:20 +0000
Message-ID: <878qqettlj.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hi!

libffi-3.4.7 unfortunately had a bug snuck in that I'd reported a few
days prior to the release. See https://github.com/libffi/libffi/issues/879.

It causes test failures with Clang at least. Reverting it is non-trivial
because a few build system and test tweaks were made, but you can use
https://gitweb.gentoo.org/repo/gentoo.git/tree/dev-libs/libffi/files/libffi-3.4.7-Revert-Fix-x86-ffi64-calls-with-6-gp-and-some-sse-re.patch?id=913b9ae63372f13deb88137f646213574ae94158
if you like.

thanks,
sam
