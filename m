Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E8D1C01
	for <distributions@lists.linux.dev>; Sun,  8 Sep 2024 23:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725838924; cv=none; b=A1/73DciGrtnhjaq1LPdmMjv6XSlz/fW0JCoPaigjRF3Rsfm7iLLrwruKnFxmc/wC6bk1CqNgMQe1QhVi5KCwbwB2TyByhqiKnsV0lrUYooGlisfjOGsOXan5U+eG/8VIjVkktvbo3Gfrrgj3dux46vtnW98hAn5+cjfjfQ71zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725838924; c=relaxed/simple;
	bh=TevHAugawLteL9IVB8gAxFRHnR8SNCA2Y+1S6CAJzm0=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type; b=ECncbp/3r64eEbRwQOprKhhPY5+a+voCLiFI/2hE8cTUgLxi4cBb1Z7mWOBvO2oSE73Hkm/d3OeTci6htBKf5wfXXnUUH/6A7y+C9TAQz2c3mNUVs4mVetmr/fcCI7sH3Hfg8NdmRE/FLpEZ8uuUq+4rZ2PZ+nIRbza2ytTRPMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdQzdAoJ; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdQzdAoJ"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3e03f0564c6so601576b6e.2
        for <distributions@lists.linux.dev>; Sun, 08 Sep 2024 16:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725838922; x=1726443722; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:references:subject:cc:to
         :mime-version:user-agent:reply-to:from:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCfiKxBkwmR5U8y+I9LPCg8Jj5y3QrtZfMRbpG3siwg=;
        b=IdQzdAoJ7HIXY4FfU90sQKqaqzvM7gaEWcNqtcjXwGCmEnE0ZGLcAwrQTpPlfzPLIB
         6A44tFMZdlLpvParcOZFtC1+hlpupJINvcZKIJapVEttvf1ns1U0ZneZdNRT5mQpCWpR
         gcw33PyhC2A7Fc7/jkJk+/uoYLmDcdoMt4x2YvAT22FqFQdvcb41mLRYPJ9Q6Un8E3Yg
         qIq9HTQ6Bp1v1u9CGuq1fb6U0MhWDYvzIBHt6zNqjx/nSXQbJ2f+joVmguAknAUXJg24
         h++7F4Zji5bbsbycMP/EgukfTNGqUi34Fved2yr6fSjGsRv6cK39mKjDKsY4NUuVbT4y
         jKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725838922; x=1726443722;
        h=content-transfer-encoding:in-reply-to:references:subject:cc:to
         :mime-version:user-agent:reply-to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cCfiKxBkwmR5U8y+I9LPCg8Jj5y3QrtZfMRbpG3siwg=;
        b=bC2Nl7XxORK4cO1KgMLmkeIuk2c2nIqh0WouIeD3j7j+MzMs7lWnFj95mdro21N6nW
         pyAFcWrgIhcc6edjrjc8v3Qp0a75z96UsBV5TUDGkiDAnbbVSZzygCVRYtomQfrthXT7
         IBFnBz7Qd3DRz9Hv4rOiu74gxaF4Zz24lRNeaALhgCYvzQMtuxtVTyrBDErOkGH4BH5z
         DlHmGrMo+Enx1N+0rW5vE3it8IJYLZylqIbnr8U11r/IY6jqlkMBny0J9dT0yYjOscVu
         1aBKS+guSqwRm1yuqRFEyIRB01T7YZ/XfLwFfhE1LEoTe3zXp9BFCVEOO+IRony0wSdS
         kgUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoTLfXODaCu2zb354cUVmNjsp8A4R2WTGqmI8KNDwMLXPGZuwxJSSAGaXaewdx7XKzT4TnpbL0MoSbzaIx@lists.linux.dev
X-Gm-Message-State: AOJu0YzExlrbiw8FPaSyzqSN4DxEJOFSx9OUN4J57/i5YjJ9l4BdZ8p7
	HICrn3s9vCeQ7RRJi3oI4psQbYP//R5+A2w5y6XsyxeuESBRRpQZ
X-Google-Smtp-Source: AGHT+IHykOGQrxS9JKeIa/eCgSpkIaF2OfOxxrkUh0HqWbEbyxCZQQOzknWN+bELefOkrmXmVpTCWQ==
X-Received: by 2002:a05:6808:3307:b0:3d9:e1fd:5660 with SMTP id 5614622812f47-3e029f205a6mr11716540b6e.31.1725838922397;
        Sun, 08 Sep 2024 16:42:02 -0700 (PDT)
Received: from [127.0.0.1] ([70.133.144.39])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e039a6c87asm912034b6e.23.2024.09.08.16.42.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Sep 2024 16:42:01 -0700 (PDT)
Message-ID: <66DE3648.3040904@gmail.com>
Date: Sun, 08 Sep 2024 18:42:00 -0500
From: Jacob Bachmeyer <jcb62281@gmail.com>
Reply-To: jcb62281@gmail.com
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.8.1.22) Gecko/20090807 SeaMonkey/1.1.17 Mnenhy/0.7.6.0
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
To: =?UTF-8?B?QXJzZW4gQXJzZW5vdmnEhw==?= <arsen@aarsen.me>
CC: Bruno Haible <bruno@clisp.org>, 
 "Andreas K. Huettel" <dilfridge@gentoo.org>,
 Wookey <wookey@wookware.org>, Khem Raj <raj.khem@gmail.com>, 
 Paul Eggert <eggert@cs.ucla.edu>,
 libc-alpha@sourceware.org, binutils@sourceware.org, gcc@gcc.gnu.org, 
 config-patches@gnu.org, distributions@lists.linux.dev, 
 devel@lists.fedoraproject.org, glaubitz@debian.org, maskray@google.com, 
 dickey@invisible-island.net, toolchain@gentoo.org
Subject: Re: Proposed CHOST change for the 64bit time_t transition
References: <4996568.GXAFRqVoOG@noumea> <3848277.MHq7AAxBmi@noumea> <6e8dadbc-7ae2-465f-b8f6-d0d62507a191@cs.ucla.edu> <1868152.c1hCyg87lr@nimes> <86mskitf0d.fsf@aarsen.me>
In-Reply-To: <86mskitf0d.fsf@aarsen.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Arsen Arsenović wrote:
> Bruno Haible <bruno@clisp.org> writes:
>   
>> Paul Eggert wrote:
>>     
>>> I'd rather just switch, as Debian has.
>>>       
>> I'd go one step further, and not only
>>   make the ABI transition without changing the canonical triplet,
>> but also
>>   make gcc and clang define -D_FILE_OFFSET_BITS=64 -D_TIME_BITS=64
>>   among their predefines.
>>     
>
> At that point, we should bump SONAME of libc and simply remove 32-bit
> time support.  This would probably be okay generally.

This is probably the best solution to this problem at hand, especially 
since the old ABI has a definite expiration date about 14 years from 
now.  Bump the libc SONAME major and hope that we can get rid of the 
last dependencies on the old SONAME before the deadline.  We will have 
14 years to do it, if that arch is even still used then.

> [...]
> But, in the case we don't do a bump, why not update the tuple?  This'd
> allow easy communication of whether we have 32 bit time to all
> components of the system, and, in lieu of a better detection mechanism,
> it'd allow anyone at a glance to look at a hosts tuple and see whether
> it is compatible with something based on the tuple it was built on.
>   

This is closely related to the idea I floated a year ago of redefining 
configuration tuples as lists of tags (with a canonical order) 
progressively narrowing a broad architecture.  Start with CPU 
architecture and work "narrower" from there.  In that system, adding 
"-t32" and "-t64" to indicate time_t width would be the simple 
solution.  In context then, it was to handle different libc choices on 
Windows.


-- Jacob
