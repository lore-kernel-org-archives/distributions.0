Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DA723BC
	for <distributions@lists.linux.dev>; Fri, 31 Mar 2023 10:17:08 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id x20so22468207ljq.9
        for <distributions@lists.linux.dev>; Fri, 31 Mar 2023 03:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680257826;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=94U9SdqT0RpSnY19t9m64eVoWqaFaiDqQkb1Vbej9qE=;
        b=SqM8SsJDAiBZNDucxIFG/rbyCoNIEY7JLmOHLUBb12gsTuZlwzmF5ZnFWJDHM49OYz
         oxziFTPydy+mG/F8wlfvQljxyaOG2vhcLyWL2uMxDMI46seG42G2Socli7gQ2K0nAW0J
         RmE/aF37ierJ/X88VcxzIzZlDkZ+1eCjRVMFjixu5/rnBlJ2razmTKhYADGqR+7vkrNw
         /FKAJhT7Jbt2eZgXWhDuvEvGu7vHCFbT/bmB/qLxds21ymYLOy0S5qRNJgvVIlDAzj7O
         kv6pe2CywzYemKQ/Ie1XTaPxnqnbhGNZ/M9f8c+CUfXwItvH5inndzPt1QX5lhbcZA6h
         UqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680257826;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=94U9SdqT0RpSnY19t9m64eVoWqaFaiDqQkb1Vbej9qE=;
        b=jP02RZa0RFH9VkL/4xm/E5E3jXd6S5+sAvooUa+wJ+E9pNHUzC7MQq/sRYZ3trf7R3
         Jkytij/6FCDicsqWcEptSHT7iFtLtwZtp5DFiWI0nvh9hLlaqm5+4y5J3o1p3UJAo1bH
         fYc33mjdoOnGMJN37glb0QnXRWKMlrxAqkgzZg22EsXMeZBgLc9Hg72GEJJDGlGZ/o/4
         2SMUaPnMTIH2+hxtxWTi5lVkY+JPWzkqBMtgLcxw1vBRRZRqqyiad68A4JVVdeDvokkF
         TOlXMbcN9mIIqv6NsZoYvw44eHe6g6bbRgDNlHp3c7FTQPIzN25uDWjUT54B839/6II/
         AgCg==
X-Gm-Message-State: AAQBX9fCCciZ4fBZOUDYNr3NnNefmF2mRpFzCosxz1T5UQ88JSGkdgZ7
	ZkH+YeZ5Qyj8CNWguFXoimnbTEDL9DCtMhlL5IzWFs32/j0=
X-Google-Smtp-Source: AKy350aU4C0mCdX24U3NivSdK4JIg8cHFOT+HkjWivPq2+RgJdPZQ7XBJzLi6fEVu8mHHOpmMj6dafmJaZgn1WIcVcA=
X-Received: by 2002:a2e:2408:0:b0:298:7c9e:505 with SMTP id
 k8-20020a2e2408000000b002987c9e0505mr8107591ljk.8.1680257826362; Fri, 31 Mar
 2023 03:17:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Christoph Reiter <reiter.christoph@gmail.com>
Date: Fri, 31 Mar 2023 12:16:55 +0200
Message-ID: <CAE6_+Ucj9muEancYdxb19oefnS4D1Zsa=YSNWA0dg5YX8_2zFA@mail.gmail.com>
Subject: openblas 0.3.22 issues
To: distributions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

openblas 0.3.22 causes breakage/wrong results for various users:

https://github.com/xianyi/OpenBLAS/issues/3976

* octave: https://octave.discourse.group/t/make-check-fails-with-openblas-0-3-22/4289/11
* scipy: https://github.com/scipy/scipy/issues/18208
* sagemath: https://github.com/sagemath/sage/pull/35371

so distros should probably skip this release.

regards
