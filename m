Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F9D8F66
	for <distributions@lists.linux.dev>; Sat,  1 Apr 2023 21:04:38 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id e9so11298842ljq.4
        for <distributions@lists.linux.dev>; Sat, 01 Apr 2023 14:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680383076;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wfnRG1ne9JkbCOxNAkkUgcsqF5i3SbSFkqccnAudPpI=;
        b=HpW0G9boEGKDe+6/EVgOwSu4tDXafrVdBsCk6XbrZsWw2qchCuXY4LubZn4pYilFe7
         w9xQIZUFNjUB6OUD2rD9D2BVx2LGYy5D7EcvZsnOqQ+riPy8RQ96GpmCA2dSAgH8e06N
         A0BI0noIvWDm+grMaHyjiU79l0J/IS54INN57Ic+ZnpLPtS+n7scyGurL8oXvqXgHYIA
         7q+1zDokzj2/toFwlolLlvb2da7woxABFziUTqqzstvTeQ0THM62rAqUJmrsv4shoqUD
         Zyyg6kGl/KYe/WDbZGaMmSfa5fsOFhDJYjReVEVfB9h2c2XO2WbsFR5fNHxH83Dvd9gl
         8e3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680383076;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wfnRG1ne9JkbCOxNAkkUgcsqF5i3SbSFkqccnAudPpI=;
        b=4kTQnMTkoDYIQU94HYxhaOcKLk5/YAGjVNlBYlv+ppHVChmK1y0T18qS8U4XizJyjQ
         wCqNikn4cPpSZWBg3OpPTsVzzqkAccKenJ36wZ125eQvXGr1UtXsa7Co5hK+Y/3T1yPs
         4w6QbbU/mmDPGdyqXxQGYYSgnQolf3rI9khxPr3/F3I0s2bBS0k4aXXbZTweFT5o73hU
         cGPtI+BNTZrpmfig0tozW5V9FchDRtTjIvqJiz8uMM6hhrUPZ+eGW1dBdLjVijQOhf2C
         TkOPgkVyZlndmczrD0DXiMUnCcYUKXOymzvLc0gsSx26Bw8cVI4FLwFy7w5JlKTYdQdA
         9ekA==
X-Gm-Message-State: AAQBX9fWZtQjz1CkCmr1e4X/aboLjGruA7NB//3xAQvUEPK4je9rXtwL
	onpNQFI6YnYPhzask5y5L3kiCLaSAPaOrf7OH8ePu4Lo+ak=
X-Google-Smtp-Source: AKy350ZWc5EMTjW1I4HPT/f+8F2mbAARtfIfZftB8uMeFDxV8Ah6B6VPHuqpwW5g7c1mvoq6YB6x3aOa0Oa9ga1FXlU=
X-Received: by 2002:a2e:8346:0:b0:29a:7cf0:3535 with SMTP id
 l6-20020a2e8346000000b0029a7cf03535mr4477867ljh.4.1680383076059; Sat, 01 Apr
 2023 14:04:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAE6_+Ucj9muEancYdxb19oefnS4D1Zsa=YSNWA0dg5YX8_2zFA@mail.gmail.com>
In-Reply-To: <CAE6_+Ucj9muEancYdxb19oefnS4D1Zsa=YSNWA0dg5YX8_2zFA@mail.gmail.com>
From: Christoph Reiter <reiter.christoph@gmail.com>
Date: Sat, 1 Apr 2023 23:04:24 +0200
Message-ID: <CAE6_+UeiCzpyA9-XVgX1x5Ucjccng0rdw-+WCZbtMnLX8VOKgQ@mail.gmail.com>
Subject: Re: openblas 0.3.22 issues
To: distributions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

a fixed 0.3.23 is released now:
https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.23
