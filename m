Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDE1A945
	for <distributions@lists.linux.dev>; Tue, 10 Sep 2024 16:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725985420; cv=none; b=EqSxVLVjzqC5XU/NOzVdDHYuunZwBRStNf4hITM9qAfOpRVce0aPwh/pwDAECbSrZMZwW1DusYdN6WYbaW2cesqtNVErE9dmWFHSyWBJ5YYsGS3qej9ODu3TIQ3k5/Ny6+pi5X9IzR8oK2p7KS+1uvyTiehaSdjuPXKuP/tLym8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725985420; c=relaxed/simple;
	bh=KEpGlZ2NYD1KrnguFedKR/4i1CUoleKImlBUunKGSYI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CoSnOu78QzQOHqLhoJjf9904Vnz9srrIcr+TDk9tugyd7INX4ONujKn9Fr82wpOx6CHokp6BeVyXwwmMoovmEV262MZFh/sHHvOWWLP/gD/pwSIrhW+QPtuwnqEV9MQVfWf6pMakQ6oqaU10AgPWV9OImTkoUcsnAJ6u4JWWG0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fAfyQ6x7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fAfyQ6x7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725985418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jvuVY+bm3Q6/gQyNXrtl+BuPr2aqHrjKJQQ5tGJvGJs=;
	b=fAfyQ6x72KNMZC4sjzQ2azHRrOssF9eIAgnIDnYottjsvt9g8Ir7kZ77DFnjqPxHA/4wcI
	4Umql1rdF60zlMJckYrlb5s5MPdPjT0j3MN9jS3C7zAv268+IfarbRE8AyTe8NoSO9GKMh
	rYsmVlko9zKEIakGv7V6XeNkAOLlniM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-88-PTGy5XF-N2itiCxif2r--A-1; Tue,
 10 Sep 2024 12:23:34 -0400
X-MC-Unique: PTGy5XF-N2itiCxif2r--A-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E91CC195608B;
	Tue, 10 Sep 2024 16:23:30 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.2.16.4])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3A7481956048;
	Tue, 10 Sep 2024 16:23:24 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Arsen =?utf-8?Q?Arsenovi=C4=87?= via Gcc <gcc@gcc.gnu.org>
Cc: Bruno Haible <bruno@clisp.org>,  Arsen =?utf-8?Q?Arsenovi=C4=87?=
 <arsen@aarsen.me>,
  "Andreas K. Huettel" <dilfridge@gentoo.org>,  Wookey
 <wookey@wookware.org>,  Khem Raj <raj.khem@gmail.com>,  Paul Eggert
 <eggert@cs.ucla.edu>,  libc-alpha@sourceware.org,
  binutils@sourceware.org,  config-patches@gnu.org,
  distributions@lists.linux.dev,  devel@lists.fedoraproject.org,
  glaubitz@debian.org,  maskray@google.com,  dickey@invisible-island.net,
  toolchain@gentoo.org
Subject: Re: Proposed CHOST change for the 64bit time_t transition
In-Reply-To: <86mskitf0d.fsf@aarsen.me> ("Arsen =?utf-8?Q?Arsenovi=C4=87?=
 via Gcc"'s message
	of "Sun, 08 Sep 2024 16:08:02 +0200")
References: <4996568.GXAFRqVoOG@noumea> <3848277.MHq7AAxBmi@noumea>
	<6e8dadbc-7ae2-465f-b8f6-d0d62507a191@cs.ucla.edu>
	<1868152.c1hCyg87lr@nimes> <86mskitf0d.fsf@aarsen.me>
Date: Tue, 10 Sep 2024 18:23:22 +0200
Message-ID: <87a5gfo4ud.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

* Arsen Arsenovi=C4=87 via Gcc:

> Bruno Haible <bruno@clisp.org> writes:
>
>> Paul Eggert wrote:
>>> I'd rather just switch, as Debian has.
>>
>> I'd go one step further, and not only
>>   make the ABI transition without changing the canonical triplet,
>> but also
>>   make gcc and clang define -D_FILE_OFFSET_BITS=3D64 -D_TIME_BITS=3D64
>>   among their predefines.
>
> At that point, we should bump SONAME of libc and simply remove 32-bit
> time support.  This would probably be okay generally.  Just doing the
> predefine doesn't really fix anything - all the problems of not being
> able to detect whether t64 support exists still persist, with no
> mechanism to prevent mixing.

Defaulting to 64-bit time_t would also make dlsym etc. work again.  For
post-GLIBC_2.1 targets (where valid binaries are expected to use symbol
versioning) it's not absolutely required to do a soname bump, just
changing the symbol version baseline should be enough (set DEFAULT to
e.g. GLIBC_2.40 in shlib-versions).  Old binaries will use
__libc_start_main@GLIBC_2.4 or __libc_start_main@GLIBC_2.34, and fail to
load.  This could be a more source-compatible change becaue I suspect
not everyone uses LIBC_SO in <gnu/lib-names.h> to get the soname for
libc.so.

I do not have a strong opinion whether this should be done for most
32-bit targets.  Except for i386, where I think we should aim to
preserve compatibility with legacy binaries for many years to come.

All these changes have implications for LSB complinace, as people keep
reminding us:

  LoongArch glibc does not provide libutil shared object, against LSB 5.0=
=20
  <https://sourceware.org/bugzilla/show_bug.cgi?id=3D31136>

But as I explained on the ticket, the way LSB is constructed, it's
surprisingly architecture-specific even in its generic parts, and 32-bit
Arm with its GLIBC_2.4 baseline won't have the required GLIBC_2.3.4
symbols (such as __chk_fail@GLIBC_2.3.4) anyway.

Thanks,
Florian

