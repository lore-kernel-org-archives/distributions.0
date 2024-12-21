Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649D0664C6
	for <distributions@lists.linux.dev>; Sat, 21 Dec 2024 15:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734795874; cv=none; b=aLV7K4oIEPMI/CPpAjrW2AGllSQ//BAzE7/ZxqGOKsc1LCXKaO75QmT/lt5UwfhTQO5fGtDiwIdMZ4nHKxBUZGDmBRgUNDtsVKWRsUXLuBZkfD4AhaCLtZ+mkZZDobM4AEwfMwKSto8MqDVgT13a82U0RVgpVvhT/Afezn0A+S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734795874; c=relaxed/simple;
	bh=4lSdILnmDyk/tHpb9ieoFfAMsVzQ5TJP7SH9rzhEF60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=etEcO2tlXE9ZHEJubdrmu4m0K+PnFsnoOIJe8lh/3oLxLJqkBhBi2cKq2omlWmm0T+thBdoD3D1Cx64KtEtAPzddTHZoS+RO4BJmIqn/vp8pw6sJaaZrsgvw1WXMtaa6PP24iSXQNHJdRWgi4okBJKkLMwONKyZGh9SplkU8Rd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa66ead88b3so537623366b.0
        for <distributions@lists.linux.dev>; Sat, 21 Dec 2024 07:44:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734795870; x=1735400670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAxtLwxeeMCDzOmktnq3G3S8n6pwsWi7G5aLHPFxPLo=;
        b=QwtmBy2GCvUPc5sLJpdtgPaoskWquMR2FJ/7hf/+NI8x5aumdn5wqWH+xIFG71u411
         iDal2tIa4Mm3P6PU8+5E++54ZAalSVwW/D3744KzZ6WlOavVhn/npbbMyvpkGMF41O9h
         GNMjxuw0leSXBZkwIo7s8FfEZyNpsWgb0PVXoyV95F0eqZisPQ+pCGeQOesgze3ClD+u
         hwJWojWLTP0KGHW91cv8jzO7PRgXxWh88XzLsW8KoQqnHyGK3P+9qrQ8hxtqP1kSuF9Q
         rpKqNCuchw0GMTIZ34yafhVKGnyccULsEcwFiqfC+B2ADk6dan+NeN1Pj4H5qqD18GY+
         cmIg==
X-Gm-Message-State: AOJu0YwX4u/+EXLsPiLzdjwGhVkel3p7YNuqJ/5NJIMwBbvS8k+pOVMK
	5+W09YmtNAfmMrN/eCGxrFT88bfm7f+p39ORZKYMyOVHK3y40SuhRr2vjb43
X-Gm-Gg: ASbGncsD1vvqct9sp7qFVBEpgLSs/76WB6zoZx6tOnV0EIrZ+RdDASEKHapLUj6tf+x
	sVNNUdWm0eRUpVMHK2QxaW1dPGYQNSo1IHfooE6pnhVqXCeMKts4rNmanCiPFdMLzm3l7xjtzLx
	er5+iy9OZnqyD28z1kweaM8lJFpoDTpzgBrckrhSIdUkcjPjG07cXNHOMHkXXyojNTEyWQq2Z8b
	VYJCSTkCZXkKyDhuQdkdOEYKdm2OKhELwtNIa+CQyQq9/ewe8S3rn6xTMM8N4uNgFy4N+oouEQs
	xiIHjS9+2Akg7IN1rPZm0ZyU
X-Google-Smtp-Source: AGHT+IGbsQZkv8d8fPie4TChi3RL7h7nkFLg9wy0z36j/HZkovhCE9GHIXWFF9dfwc8biAUFJtw83w==
X-Received: by 2002:a17:907:7f8e:b0:aa6:995d:9ee8 with SMTP id a640c23a62f3a-aac2702ae5cmr595794966b.5.1734795870230;
        Sat, 21 Dec 2024 07:44:30 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe3c25sm299763566b.100.2024.12.21.07.44.30
        for <distributions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2024 07:44:30 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa66ead88b3so537621466b.0
        for <distributions@lists.linux.dev>; Sat, 21 Dec 2024 07:44:30 -0800 (PST)
X-Received: by 2002:a17:907:360b:b0:a99:f6ee:1ee3 with SMTP id
 a640c23a62f3a-aac334f624amr797241566b.43.1734795869882; Sat, 21 Dec 2024
 07:44:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <18418467af0f3d14c4bc4d297dd4a9e30313043c.camel@gentoo.org>
In-Reply-To: <18418467af0f3d14c4bc4d297dd4a9e30313043c.camel@gentoo.org>
From: Neal Gompa <ngompa@fedoraproject.org>
Date: Sat, 21 Dec 2024 08:43:53 -0700
X-Gmail-Original-Message-ID: <CAEg-Je8Mtht4XhFGSy2nuJE0CoP1Y0eYbWCZrxpPHcO--HLkOQ@mail.gmail.com>
Message-ID: <CAEg-Je8Mtht4XhFGSy2nuJE0CoP1Y0eYbWCZrxpPHcO--HLkOQ@mail.gmail.com>
Subject: Re: The uv project is working on a new PEP517 backend that may
 negatively impact Python packaging for distros
To: =?UTF-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>
Cc: distributions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 21, 2024 at 8:12=E2=80=AFAM Micha=C5=82 G=C3=B3rny <mgorny@gent=
oo.org> wrote:
>
> Hello, everyone.
>
> I've learned that the uv project is currently working on starting to
> provide their own PEP 517 build backend [1].  I am significantly worried
> that it will negatively impact our ability to package Python software in
> Gentoo, and I think other distributions that do not use wheels will also
> be impacted.
>
> Just to make things clear, I'm not opposed to uv itself at all.  I think
> it's a great packaging tool, and I use it when I can.  However, this has
> a flip side that once it starts providing its own build backend, it will
> become immensely popular and people will be using it for pure Python
> projects.  This will mean that -- unless we resort to some kind of
> downstream patching or workarounds -- building wheels for these packages
> will also require installing uv, and therefore the portability of pure
> Python packages using the backend will be severely limited.
>
> The way I see it, if the backend starts being officially recommended,
> things are going to become much more painful for us.  If anything,
> Gentoo will probably have to resort to downstream patching the packages
> to use a pure Python backend instead to retain compatibility with all
> the targets we support.
>
> [1] https://github.com/astral-sh/uv/issues/3957
>

I agree with your assessment, and I've given some color as a Fedora
Linux package maintainer. Hopefully it helps...


--=20
Neal Gompa (FAS: ngompa)
