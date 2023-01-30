Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D416B569C
	for <distributions@lists.linux.dev>; Mon, 30 Jan 2023 17:02:42 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id 123so14818929ybv.6
        for <distributions@lists.linux.dev>; Mon, 30 Jan 2023 09:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vbPPNjyz+mLqt55wbBdddgHiHGQ1N9SMDtstq/T90SA=;
        b=UHu/zo4qpMi1aGlOBexTUisrhL+cxd+55E7tGkmFnmY5YBGVaim+WuieJIn99D3tEB
         zzam/HfYk0wbsJ8/dQAJTQjYuiSclw99yNdCk4dGbpfQTjiMa+n20Lw9/PN7PU0SWtk0
         4Ss50FczmyA2YmORnl6b41XPLXrIjufryMqewnG5SWbNHiCR0JnPScyqVnOOo9k3XEbq
         VBusamSNIT2S6Q16v2gdFSQ3RMSnvlT73oqhGklLvUYKlCvSCUIVtAmeqxbWDV27OhKI
         0Ma1lBUFjU+j3YYXgFV571h61UbzMB+mvN6iq9BQYyjDuMU2S2nLETtHGsfPxBA8onFs
         g3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vbPPNjyz+mLqt55wbBdddgHiHGQ1N9SMDtstq/T90SA=;
        b=2Yrh6NEVPBdak+6DTwV97R45vS5Q3I+eZyA1huonQY5+MoMLqfGfATOTyNiwY2MXbN
         g8F8lPgcyke+U5+Cwk4xO8fvnSona9eDmelQx7Dk1HeEjqwoa/eNHviC8hXxitN5YwuN
         CohdvSUUQCNFJYkwPdyzGy0+otyaM2DGuYD0CKjEzjIrAkQRW5w0312L+1ygRllk/lGi
         yqgwYnLoiJiFjoKvXCipx8jodPAKjVW0XoOAXVv0iQkoHd9xi1Xd5sRuQFXZ91p66T4A
         qncuOgDr4FBV9vWyDOlqfENfk7iDqj1TQuKcAeAvJDBo0H3mYLbyyi96JN+s++vx/3u/
         stKQ==
X-Gm-Message-State: AO0yUKWppM0v2QUmMegL/Xlxio8WiBmL+F+JFUpynx1HwLTRG1kDWdp6
	X9vP83X5NxRBFX6ojmLp1ZTHwdGobIig6R6i0V74M7w5KppNmQ==
X-Google-Smtp-Source: AK7set+rPjl/OD+dyBGbTXK3aTsNhKTSnFNeDEfB+1mCMxSj+84FL2kiUUIYigsYrZrC7+mBxnEDDt21jzhja4A0k6k=
X-Received: by 2002:a25:86c2:0:b0:80b:7e2e:f94 with SMTP id
 y2-20020a2586c2000000b0080b7e2e0f94mr2429511ybm.273.1675098161578; Mon, 30
 Jan 2023 09:02:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Mon, 30 Jan 2023 22:32:30 +0530
Message-ID: <CAH=dH9_oz92b8n3dHmHPzfmRsKZqyv_2Bip8LsTkN23a5Qw9Gg@mail.gmail.com>
Subject: Test Mail to distributions
To: distributions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi

This is a test mail.

-- 
Regards
Shyam Kumar
The Linux Foundation Core Projects
