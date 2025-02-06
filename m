Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C502E64A
	for <distributions@lists.linux.dev>; Thu,  6 Feb 2025 13:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847596; cv=none; b=SU5Qar6dGyT31EKke1kcWSwu6CpPHS6UBLxJjZ1gfdY9FKwkuKtPGmePpyxPaHhLAiUJ/v4knlx2GEMcWR4mQGDQdTV0KvNMUNLUSQqQ1kI+ide3tpySMMeTvtXK8FaZidunrRgKcEuqjVXjD4SvjGiSN/ta4T7zF6y5CGxH+gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847596; c=relaxed/simple;
	bh=JTuPcUOAB8aZDnxXuQvmEgdKc3hsHwVZRtIDf8Aryds=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uWWwOAhpuJcVFp5ZDKwp0GZQaV+oW8t9mbzktpOtCnTBCudHkrajJyLGRg/+GCevyqEyyuMlM64iHO4jkqbphg1mO/XkCXPBb7I07FBR0jcHbh4amu5tNBPP0Yors/aesO1rN8UY2yHdUEijy483fbusmawwjyJ+c4cFFJMosDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id EBB4D34069F
	for <distributions@lists.linux.dev>; Thu, 06 Feb 2025 13:13:11 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Subject: Re: openssl 3.3 & 3.4 need patch for arm64 asm
In-Reply-To: <87cyfv5iit.fsf@gentoo.org>
Organization: Gentoo
References: <87cyfv5iit.fsf@gentoo.org>
User-Agent: mu4e 1.12.7; emacs 31.0.50
Date: Thu, 06 Feb 2025 13:13:09 +0000
Message-ID: <874j175i8q.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Sam James <sam@gentoo.org> writes:

> Hi!
>
> As was originally reported at https://gcc.gnu.org/PR118537 and
> on the Postgres ML [0], OpenSSL 3.x and 3.4 have broken asm for
> arm64 and need a patch backported to avoid runtime problems.
>
> 3.3: https://github.com/openssl/openssl/commit/4f7d8b2724ea7f42cff1e8a0e736ad448def60f5
> 3.4: https://github.com/openssl/openssl/commit/3ad2277e4522d363ae31a1888531915bb68964dc
> PR: https://github.com/openssl/openssl/pull/26469

... with [0] being ....

[0] https://www.postgresql.org/message-id/6fxlmnyagkycru3bewa4ympknywnsswlqzvwfft3ifqqiioxlv%40ax53pv7xdrc2
>
> thanks,
> sam
