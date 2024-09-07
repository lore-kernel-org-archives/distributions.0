Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2358023A9
	for <distributions@lists.linux.dev>; Sat,  7 Sep 2024 00:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725669012; cv=pass; b=eTynpcKWPKVgWy3gT3NKAmEx30P9mp7f2aRFIOEDZKJkK9hSLTEeqXY0lXYY0u6RPK6wYQ1dChEgWNZ4s0TFSVsPXPRMan7IjExECA+Ib/9kgB5qfx3FwYw24v/4U8MZEp8rNGZnwqB05RznOMjnamam8uGj6i6TLPVa69XGzcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725669012; c=relaxed/simple;
	bh=u8MSJ3sK8NEOPzrtauoFFKCNONMynVmA0UCAPn+s0TU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AaKvDE0xJJM9WE4c7xfkE2vPHdJO6quQSzouEXZRuqQ5cw2RQ7cHqoff6L2gTC0TT554/cM+jcWGH6n4QMo6KmTJOqV6nB4zb7BZQC33LarddnKxnuTv8Y5PbtCAvEXefHfiERGL70uJRuMIRSZpciVysWwm+B7Y1nkJSYXnmEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=clisp.org; spf=none smtp.mailfrom=clisp.org; dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b=FmhLGaCn; dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b=ykYFB2gj; arc=pass smtp.client-ip=85.215.255.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=clisp.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=clisp.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b="FmhLGaCn";
	dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b="ykYFB2gj"
ARC-Seal: i=1; a=rsa-sha256; t=1725668647; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=P7N6+QmnT3Fob9qvaOiZLeyySkwLmnhnApWhShS3wEbPP0NzQKnVGAeZi0Qhm2eaGI
    Uzo/YP4jwD2bf+4NrW5xTSz4yxIsNCFBlkpRCAx4KtxSK7cz1SANopgXciEGP76HcHfW
    fj2glKjW8Qix/dtcQ/le6aGSD9vLMRTiHA4JWmPzQGGNiNPV6fvjiOwd9T8Hp3+asXSN
    Z+r2XeQxJGjSg2fR/aHjAcLpO+0Ukp8sceQtem1OkU4iAj1dHf7yxjVv1FtVknmuBJk2
    ChQiyVcL0GFGQS2ufFGT3GKKGeUm2lBS4atH5NYyU1So28mOOhwSVANWITVR0QzsC0pG
    mu5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1725668647;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=hJFNGVC+iPuF/7Jmu9XZAH+dq3ZM3C/Sr3MNvdoVNRQ=;
    b=ZyjVBWkPs/KigVjYH9nOd9YjlMHKs2bHC4QPb9jm10JftWOFVLD6ryq0CIupbW8t4K
    VIKpdsoCqiMbvyjyqcBoG5rhfunG/66jt1g8lhVtn7ln6d3bpzg8vVWnNjwBRYQgyE9d
    FAi4v4INrog24ub8LQofJ9pZ811+dhkEIYSYjdSqfrtU9HzJCbdUCnvmYOYNI1XhPfrY
    hKs6KlZ54NU8n1hEEM5bM0bRwwuTbD+1/ia/gTQLLByCdxghwbB7Qkn75mhn5F/hVOv9
    l/w1cpBeM4rDPCbR/qFsqJXA43bfUjlNyklR8UYJWialUXy5X6lQXwF2RyitOYbuLYfd
    AZ+Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1725668647;
    s=strato-dkim-0002; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=hJFNGVC+iPuF/7Jmu9XZAH+dq3ZM3C/Sr3MNvdoVNRQ=;
    b=FmhLGaCnD3jkL4TeiMQ+PRxGRetqh9c6IINRZ2tGmFftswuzZhCpa486sr2nxe4kVv
    9SXMpr3x5P9BU8BJ59F7rvmexVnH2te5HRJ2uYQ/4YEcJiEdKbzA6IjRg5ayPmvWkZfj
    jREU692DBeHuG/zCUNq3fReZ+4NO89FXyEHLiyJ3HPqewe0MFTXn99Ox4wqGd9zEvxSx
    jajUt/H8+7f8jvRZPAQqOLisHeJu7gpHjB7vFFd+bmAbJvMlhgqhOoSmRHBhg2aUYQir
    s25Tbzc/Uk1GE5vUF+oT/BM8/QL12Zs3W5j1ilQeal4tivrgKR12kcOftnoBHfAaNp+h
    lM2Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1725668647;
    s=strato-dkim-0003; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=hJFNGVC+iPuF/7Jmu9XZAH+dq3ZM3C/Sr3MNvdoVNRQ=;
    b=ykYFB2gjLsviaQZlXfhyABj7p6yEzbiTtGyMJWBklUn0LmNfGHyZ/dmKLyVt0ll3T7
    yp2PwnGkeaQRHkdwKVBQ==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlLnY4jECd2hdUURIbZgL8PX2QiTuZ3cdB8X/nqj/KEW/SlFzObNjGFxEHZpNkKU7s"
Received: from nimes.localnet
    by smtp.strato.de (RZmta 51.2.3 AUTH)
    with ESMTPSA id N17ea70870O6Q5y
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 7 Sep 2024 02:24:06 +0200 (CEST)
From: Bruno Haible <bruno@clisp.org>
To: Arsen =?utf-8?B?QXJzZW5vdmnEhw==?= <arsen@gentoo.org>
Cc: Paul Eggert <eggert@cs.ucla.edu>, "Andreas K. Huettel" <dilfridge@gentoo.org>, Wookey <wookey@wookware.org>, Khem Raj <raj.khem@gmail.com>, libc-alpha@sourceware.org, binutils@sourceware.org, gcc@gcc.gnu.org, config-patches@gnu.org, distributions@lists.linux.dev, devel@lists.fedoraproject.org, glaubitz@debian.org, maskray@google.com, dickey@invisible-island.net, toolchain@gentoo.org
Subject: Re: Proposed CHOST change for the 64bit time_t transition
Date: Sat, 07 Sep 2024 02:24:06 +0200
Message-ID: <2203672.bO1fEbeGnv@nimes>
In-Reply-To: <8634mckbrn.fsf@gentoo.org>
References: <4996568.GXAFRqVoOG@noumea> <6e8dadbc-7ae2-465f-b8f6-d0d62507a191@cs.ucla.edu> <8634mckbrn.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Arsen Arsenovi=C4=87 wrote:
> An alternative that I pondered was to teach the linker about some notion
> of "compatibility strings" that it would compare and reject if
> different, plus teaching the compiler how to emit those, plus teaching
> glibc to tell the compiler to emit those..  We could have key-value
> pairs in some section.  For each key K, we could have the linker check
> that, for each (shared or otherwise) object either does not contain K or
> contains K with the same value as all the other ones, and produce an
> error otherwise.  On the resulting object, the KV pairs would be the
> union of all KV pairs of all constituent objects.

This sounds much like the arm eabi attributes: If a .s file does not
start with
        .eabi_attribute 20, 1
        .eabi_attribute 21, 1
        .eabi_attribute 23, 3
        .eabi_attribute 24, 1
        .eabi_attribute 25, 1
        .eabi_attribute 26, 2
        .eabi_attribute 30, 2
        .eabi_attribute 34, 0
        .eabi_attribute 18, 4
the resulting .o file cannot be linked with other .o files on the system.

Is it a hassle even for packages that don't use time_t of off_t (such as
GNU libffcall or libffi).

Yes, it would be useful to have a way to have the linker warn if a binary
that depends on 32-bit time_t and a binary that depends on 64-bit time_t
get linked together. But PLEASE implement this in a way that is a no-op
when time_t is not used by either of the two binaries.

Bruno



