Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F18154444
	for <distributions@lists.linux.dev>; Thu,  5 Sep 2024 16:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725554380; cv=none; b=jmq+/asCXzhL9lOR30U03g5LbRPbcOssq19d697+QswMu2K5dAosjKiqE2iTT3CiO62tKk/aqtCBHxCZIR5jhKYLTBeAsTpKn0d5ZFck55et+9isbTZACC6qxFL1PiKiV01NiSzVGhMnSZkvs3A0JKI4EtjKG/yxJdEeT1HICOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725554380; c=relaxed/simple;
	bh=rn8TiATqDG8Y63T4zpw02H77jzsD37YUkgA/SSBZtSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEE8MHuMqN5mfxn+D4EXE4mVTihVF4X/+X4CmZkaNhoXweoUKaX/OBqY0kLUXpw3/97WYulkGrmOG/KO+j/fgfIcgP2AtaDTx00oiKR8VmjWsTaylJ8TnNs1tn5AZ+CUxY/CpXWrDH3cpqCaJGQFiHL7/zkToLE+6+4xPKj844E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ov6fCFOs; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ov6fCFOs"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-26ff21d82e4so544738fac.2
        for <distributions@lists.linux.dev>; Thu, 05 Sep 2024 09:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725554378; x=1726159178; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rn8TiATqDG8Y63T4zpw02H77jzsD37YUkgA/SSBZtSg=;
        b=Ov6fCFOsBDl5ifdfbTLVts1IFvGReF+zMcmidALLwascyDTtop63uULWHLyhYUwhDI
         B7qC2OPfXIyHld25KmD0sDnlZ2LffQjInjQUxoB3ALUv7NnaKQWexPMYa1xZpHBEbbpd
         ciCJFRbvNW9DpcQMPPLujGq3hTCehxV4o/wd7IBqjWPMZvllvUW4r59RmH2agHkeUVyK
         dueVrUidZeZZAqMxZc8SzoU+otzPzwiQX0Oc6uzE5J7auoIpbhV0cBYH7ON5AKY55iOE
         8VCtxb2EvXARWCM4t/aLJ4lpqYwVUk51UdUb9ljFoRyN92FtGT+i/RQhRuHyxmURYzMs
         qc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725554378; x=1726159178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rn8TiATqDG8Y63T4zpw02H77jzsD37YUkgA/SSBZtSg=;
        b=CZBxur2V9+q4JOsdTgqBfom2NyDZtCt6H6Q1vEQsJLstdPi3nl8ru8+qIhy1JhqK+U
         m6Ykm8GZmdj+R8amee8fhYiFDZGsRXxEDvGpccxGgb9oMxTjGLOlY4fhV97OrRAE5E8R
         ehfGtrusjjESJQG+BfWBOzgnF9Q39tovrGsaHQo8kl/rkvN44SQPI0SvOvtoLHs1T4CE
         lkWCswjX7uedMnzK8JQnKUNhnWr6lShDSLaYDTMFDXPQKYTgG7t9E+4+VnBM63eguZID
         JEbnb+J0PoJUbWc5ex4YGMFyGT1AgeSwTaK2w2sK4v7jQ6ruvu3nd4oOD5EvFdo8cwtB
         wfwg==
X-Forwarded-Encrypted: i=1; AJvYcCU7gfFKEXCnrAZaxOSlWrAFzI6P2A1KvJqcBeV1rXAnw0O9Av8TSCvXQ1PTr/H8NyE7a1yuBALakV6ofzFi@lists.linux.dev
X-Gm-Message-State: AOJu0YyJfRTc8yodQNBkZ6S9J5C8OJydVlR2rpp4uZFQlWfHw4Kqkczs
	tQPOtflxNxsAoNA9Hd1DRaUoaZk2FskZ3hIqlBpaSE9fgle3d83OhkvKYjmrfxEtsxZ5fLv+ftD
	tyoMjN8zohjzfnwWIzaIpQz6j4cM=
X-Google-Smtp-Source: AGHT+IGhxfnkh3iP2EPWpbhzMvJxwF/G8K1eHemmN3c8TjgQPvnueqd2tCccp9+01aj9YfLs/xVRmLTRbo24J7qvM5I=
X-Received: by 2002:a05:6870:3b16:b0:277:f5d8:b77b with SMTP id
 586e51a60fabf-277f5d8bafcmr15324335fac.32.1725554377871; Thu, 05 Sep 2024
 09:39:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4996568.GXAFRqVoOG@noumea> <20240905020617.GZ23787@mail.wookware.org>
 <CAMKF1spAZzNH3jYOnwo720nM4zQ_5JCv=ZGq4SC=TWC+WXWVPQ@mail.gmail.com> <3848277.MHq7AAxBmi@noumea>
In-Reply-To: <3848277.MHq7AAxBmi@noumea>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Sep 2024 09:39:12 -0700
Message-ID: <CAMKF1sqS7geN+RvUSWEbcgEjkawoMk9JcSsfSar-8DamZzNJJw@mail.gmail.com>
Subject: Re: Proposed CHOST change for the 64bit time_t transition
To: "Andreas K. Huettel" <dilfridge@gentoo.org>
Cc: Wookey <wookey@wookware.org>, libc-alpha@sourceware.org, binutils@sourceware.org, 
	gcc@gcc.gnu.org, config-patches@gnu.org, distributions@lists.linux.dev, 
	devel@lists.fedoraproject.org, glaubitz@debian.org, maskray@google.com, 
	dickey@invisible-island.net, toolchain@gentoo.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 6:51=E2=80=AFAM Andreas K. Huettel <dilfridge@gentoo=
.org> wrote:
>
> >
> > FWIW, yocto/openembedded have also done the same and offered a distro
> > setting to the users
> > to select 32bit time_t if they wished to but defaulted to 64bit time_t.
>
> In case of Openembedded, which (as far as I understand) mostly offers
> complete system images for download or build, I might have done that
> similarly at the start - this is a different situation.

OpenEmbedded and Gentoo are alike in some respects, they are source
based distributions with
some pre-builts, I thought it must be easier for gentoo compared to
binary distros.

>
> That said, nothing would keep you from trivially still switching the CHOS=
T
> in case of enabled 64bit time_t, to be able to keep the two variants apar=
t.
>

it does have impact on OE when packages ( configure ) start depending
upon these new tuples
for enabled/disabling stuff.

> --
> Andreas K. H=C3=BCttel
> dilfridge@gentoo.org
> Gentoo Linux developer
> (council, comrel, toolchain, base-system, perl, libreoffice)
> https://wiki.gentoo.org/wiki/User:Dilfridge
