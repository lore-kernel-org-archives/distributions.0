Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA441A5B84
	for <distributions@lists.linux.dev>; Thu,  6 Nov 2025 12:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762431687; cv=none; b=aCGMFatO3NDONMkpwOE7CLTUWYukKc+lkdyt8N54+s60/zWHFjsj6ynQ+JebgkuuLlPAWF+LXGjnxs68ZTdxfjf7mbJqy90z/EAS+74HGxukAQuEYB3cUiyTsDypvpb3p9BPBEIM+6JVqxGdRVOkLBrCdbj2EpuSDYsSc5xQQC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762431687; c=relaxed/simple;
	bh=imiAnQyzunH5BVKEefAUOMBwGu3/2ST/zbhY1QVROPI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Z+ee5Oti1ISIDQ+7ELgP71SDZvld3yrAzt0wFVGhs3zJEh4E4e/tDQumop7dd+4KVzD+2h13ZXH6GMcVxZgkpDPsXnVnLhtJzFCM+bUKFrm9YCFF1o/GtuwgvSao5tMVue10HOH6EvWaIwp1AnZc2eCOp+e8IuG3Z+ka3NiFIZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-3c73e93eadfso309670fac.3
        for <distributions@lists.linux.dev>; Thu, 06 Nov 2025 04:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762431684; x=1763036484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=imiAnQyzunH5BVKEefAUOMBwGu3/2ST/zbhY1QVROPI=;
        b=gW1PU4UbscoRlNhatdiEW5iMJXTyEhstSC6VXmk1VeGqgDHRjc8AXvccsHm51y9sNh
         d47Lvkdr780WJGfxqBnOqJK7Ejd0N4b96qIfAWLcSyHAJ+R7WbFli/8r6+MF3MJu2R08
         SxKsK55+brRSMv/0EFvOObnUgJEMjB4nalxywlFFwsn/3iDFcMqOdCnyjsimH3w8AStV
         w206LjLbBWBTB5JhBBXXgF+gwSO5xFFK/dBqgQ2oNjGX5be4Q/lz5EAdD2gL15GyiZu1
         ySMnGp99gItA4mnlS34z9YyJj5x1CG8qKyHJpQL1GAFViRADSs65vTYXtV0NeMWHArm0
         5egg==
X-Gm-Message-State: AOJu0YyreIZD93Kd5iFPvGNsQ0pjfe3iItpMLV0OEGj16ysq7kMxpvLi
	5TgpolNklIedAyjQlSbKnmmKl41IpTl2FEoxp8v2iSYStajDRrErtUz4vBtxOA==
X-Gm-Gg: ASbGncvHlyBGHWkpoKXU1K1iU8B/UEngGPcsAdWhCs8GOZ3JaVs868cCFQsQjumk0rE
	v8VyObZ9LnHBc75QEJfrmiKaaDeYdMh1Xo3DGlwMN9EwFC4GPXqc4IL4sVWUJ61cRjNRRYCItQT
	1I/NSG6MQJEkfkgk5FgYqHUTmP6R+yLM4OpOcKWAob3MwcDysUq9tTnPsEHXtCdS3kX2g+dSNGP
	sBqNk1cuhcAk67z+wfB6C1jSwu0K0Aw7316A/faLVtv9BhUsv/fQsUE7zMuMwvj7mEuhbLw7dDB
	XdalnRJJoRP0Y7LA2gEdSC2XGIMxBLEmLzejVky6qfk4vtMzlAqjowvRizxovZg2/aDx6GL3LLu
	F1x2hehyGRwntTCkT2Xwml0ItiBerrk6lsaWDHemcfYiG2fXiAWXVwojN5eVQlTITrdlRpT/Tal
	2lK3Z7Ajp3kcvxldWIOmb/z58a438Y4FiEQ4My+Gvm
X-Google-Smtp-Source: AGHT+IGb9eClTFNAlb+4LHUFw3AgQTXbO/iZKeEqeR1S597MzTRIyBUf2XSQ+RJY79tVAlkBh1onyw==
X-Received: by 2002:a05:6870:41c5:b0:34b:cc55:9e85 with SMTP id 586e51a60fabf-3e19997e203mr3458907fac.13.1762431683986;
        Thu, 06 Nov 2025 04:21:23 -0800 (PST)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3e30a00da3csm992059fac.14.2025.11.06.04.21.23
        for <distributions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 04:21:23 -0800 (PST)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7c531445439so283198a34.0
        for <distributions@lists.linux.dev>; Thu, 06 Nov 2025 04:21:23 -0800 (PST)
X-Received: by 2002:a05:6830:2655:b0:7c5:3144:c0dd with SMTP id
 46e09a7af769-7c6d13dd6c4mr4037528a34.23.1762431683501; Thu, 06 Nov 2025
 04:21:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 6 Nov 2025 07:20:47 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-=WnZt1dwEbhtv=f_-wbSSYsYgsNzpu3R4bDGB_zgfQg@mail.gmail.com>
X-Gm-Features: AWmQ_bn9opMHzjXkC83cY92-xZPvYaa6zSOPen2gfKFm-BI0Jd-RHCY9snRoMe8
Message-ID: <CAEg-Je-=WnZt1dwEbhtv=f_-wbSSYsYgsNzpu3R4bDGB_zgfQg@mail.gmail.com>
Subject: Hello!
To: fhs@lists.freedesktop.org
Cc: distributions@lists.linux.dev, distributions@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello folks,

As of today, the FHS project is now hosted and stewarded by FreeDesktop.org=
!

For those who are unaware, the Filesystem Hierarchy Standard (FHS) is
the definition for POSIX operating systems to organize system and user
data. It is broadly adopted by Linux, BSD, and other operating systems
that follow POSIX-like conventions.

The official reference is available at
https://specifications.freedesktop.org/fhs/

At the website, the details about the issue tracker and the official
mailing list are also described, so feel free to join in the
discussion there.

I look forward to your engagement. :)


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
